#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${ROOT_DIR}/generation.yaml"
CLIENTS_DIR="${ROOT_DIR}/clients/go"
README_FILE="${ROOT_DIR}/docs/go/README.md"

START_MARKER="<!-- GO_METHODS_LIST_START -->"
END_MARKER="<!-- GO_METHODS_LIST_END -->"

if [[ ! -f "${CONFIG_FILE}" ]]; then
  echo "Error: config not found: ${CONFIG_FILE}" >&2
  exit 1
fi

if [[ ! -d "${CLIENTS_DIR}" ]]; then
  echo "Error: go clients directory not found: ${CLIENTS_DIR}" >&2
  exit 1
fi

if [[ ! -f "${README_FILE}" ]]; then
  echo "Error: README not found: ${README_FILE}" >&2
  exit 1
fi

PYTHON_BIN=""
if command -v python3 >/dev/null 2>&1; then
  PYTHON_BIN="python3"
elif command -v python >/dev/null 2>&1; then
  PYTHON_BIN="python"
else
  echo "Error: python is required to parse client files." >&2
  exit 1
fi

read_specs() {
  awk '
    $1=="specs:" {inside=1; next}
    inside && $0 ~ /^[^[:space:]]/ {inside=0}
    inside && $1=="-" {print $2}
  ' "${CONFIG_FILE}"
}

module_names=()
while IFS= read -r spec; do
  [[ -z "${spec}" ]] && continue
  base="$(basename "${spec%%\?*}" .yaml)"
  base="${base#*-}"
  module="${base//-/_}"
  if [[ -d "${CLIENTS_DIR}/${module}" ]]; then
    module_names+=("${module}")
  fi
done < <(read_specs)

if [[ "${#module_names[@]}" -eq 0 ]]; then
  while IFS= read -r module; do
    [[ -n "${module}" ]] && module_names+=("${module}")
  done < <(ls -1 "${CLIENTS_DIR}" 2>/dev/null | sort)
fi

if [[ "${#module_names[@]}" -eq 0 ]]; then
  echo "Error: no go client modules found in ${CLIENTS_DIR}" >&2
  exit 1
fi

render_module_section() {
  local module="$1"
  local api_dir="${CLIENTS_DIR}/${module}"

  if [[ ! -d "${api_dir}" ]]; then
    return
  fi

  local api_files=()
  while IFS= read -r file; do
    case "$(basename "${file}")" in
      api_client.go) continue ;;
    esac
    api_files+=("${file}")
  done < <(ls -1 "${api_dir}"/api_*.go 2>/dev/null | sort)

  if [[ "${#api_files[@]}" -eq 0 ]]; then
    return
  fi

  "${PYTHON_BIN}" - <<'PY' "${module}" "${api_files[@]}"
import re
import sys

module = sys.argv[1]
files = sys.argv[2:]

FUNC_RE = re.compile(r"^func\s+\(a\s+\*([A-Za-z0-9_]+)\)\s+([A-Za-z0-9_]+)\(")


def normalize_summary(text, method_name):
    text = text.strip()
    if not text:
        return ""
    if text.startswith(method_name):
        text = text[len(method_name):].lstrip()
        if text.startswith("-"):
            text = text[1:].lstrip()
        if text.startswith(":"):
            text = text[1:].lstrip()
    return text


def extract_summary(lines, func_index, method_name):
    i = func_index - 1
    while i >= 0:
        line = lines[i].rstrip("\n")
        stripped = line.strip()
        if stripped == "":
            i -= 1
            continue
        if stripped.startswith("//"):
            text = stripped[2:].strip()
            if not text:
                i -= 1
                continue
            return normalize_summary(text, method_name)
        if stripped.endswith("*/"):
            block = []
            i -= 1
            while i >= 0:
                block_line = lines[i].rstrip("\n")
                block.append(block_line)
                if "/*" in block_line:
                    break
                i -= 1
            block.reverse()
            for block_line in block:
                text = block_line.strip().lstrip("/*").lstrip("*").strip()
                if not text:
                    continue
                return normalize_summary(text, method_name)
            return ""
        break
    return ""


def parse_file(path):
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    func_indices = []
    for idx, line in enumerate(lines):
        match = FUNC_RE.match(line)
        if match:
            service, name = match.groups()
            if not service.endswith("Service"):
                continue
            func_indices.append((service, name, idx))

    summaries = {}
    http_map = {}
    for i, (service, name, start) in enumerate(func_indices):
        end = func_indices[i + 1][2] if i + 1 < len(func_indices) else len(lines)
        block = lines[start:end]

        http_method = None
        path = None

        for block_line in block:
            if http_method is None:
                match = re.search(r"localVarHTTPMethod\s*(?::=|=)\s*http\.Method([A-Za-z]+)", block_line)
                if match:
                    http_method = match.group(1).upper()
            if http_method is None:
                match = re.search(r"localVarHTTPMethod\s*(?::=|=)\s*\"([A-Z]+)\"", block_line)
                if match:
                    http_method = match.group(1)
            if path is None:
                match = re.search(r"localVarPath\s*(?::=|=)[^\"]*\"([^\"]+)\"", block_line)
                if match:
                    candidate = match.group(1)
                    if candidate.startswith("/"):
                        path = candidate
            if http_method and path:
                break

        if name.endswith("Execute"):
            base_name = name[:-len("Execute")]
            if http_method and path:
                http_map[(service, base_name)] = (http_method, path)
            continue

        summary = extract_summary(lines, start, name)
        summaries[(service, name)] = summary
    methods = []
    keys = set(summaries.keys()) | set(http_map.keys())
    for key in sorted(keys):
        service, name = key
        http_method, path = http_map.get(key, (None, None))
        summary = summaries.get(key, "")
        methods.append((service, name, http_method, path, summary))

    return methods


all_methods = []
for file_path in files:
    all_methods.extend(parse_file(file_path))

print(f"### {module} (`{module}`)")
for service, name, http_method, path, summary in all_methods:
    line = f"- `{module}.{service}.{name}`"
    extras = []
    if http_method and path:
        extras.append(f"`{http_method} {path}`")
    if summary:
        extras.append(summary)
    if extras:
        line += " — " + " — ".join(extras)
    print(line)
PY
}

methods_list="## Методы API"
for module in "${module_names[@]}"; do
  section="$(render_module_section "${module}")"
  if [[ -n "${section}" ]]; then
    methods_list+=$'\n\n'
    methods_list+="${section}"
  fi
done

ensure_markers() {
  if ! grep -Fq "${START_MARKER}" "${README_FILE}" || ! grep -Fq "${END_MARKER}" "${README_FILE}"; then
    printf "\n%s\n%s\n" "${START_MARKER}" "${END_MARKER}" >> "${README_FILE}"
  fi
}

update_readme() {
  local tmp_file methods_file
  methods_file="$(mktemp)"
  printf "%s\n" "${methods_list}" > "${methods_file}"

  tmp_file="$(mktemp)"
  awk -v start="${START_MARKER}" -v end="${END_MARKER}" -v block_file="${methods_file}" '
    function print_block() {
      while ((getline line < block_file) > 0) { print line }
      close(block_file)
    }
    $0 == start { print start; print_block(); skipping=1; next }
    skipping && $0 == end { print end; skipping=0; next }
    !skipping { print }
  ' "${README_FILE}" > "${tmp_file}"
  mv "${tmp_file}" "${README_FILE}"
  rm -f "${methods_file}"
}

ensure_markers
update_readme
