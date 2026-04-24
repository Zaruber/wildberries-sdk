#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${ROOT_DIR}/generation.yaml"
CLIENTS_DIR="${ROOT_DIR}/clients/python"
README_FILE="${ROOT_DIR}/docs/python/README.md"

START_MARKER="<!-- PY_METHODS_LIST_START -->"
END_MARKER="<!-- PY_METHODS_LIST_END -->"

if [[ ! -f "${CONFIG_FILE}" ]]; then
  echo "Error: config not found: ${CONFIG_FILE}" >&2
  exit 1
fi

if [[ ! -d "${CLIENTS_DIR}" ]]; then
  echo "Error: python clients directory not found: ${CLIENTS_DIR}" >&2
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
  echo "Error: no python client modules found in ${CLIENTS_DIR}" >&2
  exit 1
fi

render_module_section() {
  local module="$1"
  local api_dir="${CLIENTS_DIR}/${module}/api"

  if [[ ! -d "${api_dir}" ]]; then
    return
  fi

  local api_files=()
  while IFS= read -r file; do
    case "$(basename "${file}")" in
      __init__.py|api.py) continue ;;
    esac
    api_files+=("${file}")
  done < <(ls -1 "${api_dir}"/*.py 2>/dev/null | sort)

  if [[ "${#api_files[@]}" -eq 0 ]]; then
    return
  fi

  "${PYTHON_BIN}" - <<'PY' "${module}" "${api_files[@]}"
import re
import sys

module = sys.argv[1]
files = sys.argv[2:]

def extract_docstring(block_lines):
    for i, line in enumerate(block_lines[1:], start=1):
        if '"""' in line or "'''" in line:
            quote = '"""' if '"""' in line else "'''"
            _, after = line.split(quote, 1)
            if quote in after:
                content = after.split(quote, 1)[0].strip()
                return content
            content = after.strip()
            if content:
                return content
            for next_line in block_lines[i + 1:]:
                if quote in next_line:
                    content = next_line.split(quote, 1)[0].strip()
                    return content
                content = next_line.strip()
                if content:
                    return content
            return ""
    return ""

def parse_class_block(block_lines):
    def_blocks = []
    for idx, line in enumerate(block_lines):
        match = re.match(r"^    def (\w+)\(", line)
        if match:
            def_blocks.append((match.group(1), idx))

    blocks = []
    for i, (name, start) in enumerate(def_blocks):
        end = def_blocks[i + 1][1] if i + 1 < len(def_blocks) else len(block_lines)
        blocks.append((name, block_lines[start:end]))

    serialize_map = {}
    for name, block in blocks:
        if not name.startswith("_") or not name.endswith("_serialize"):
            continue
        base = name[1:-len("_serialize")]
        method = None
        path = None
        for line in block:
            if method is None:
                match = re.search(r"method='([^']+)'", line)
                if match:
                    method = match.group(1)
            if path is None:
                match = re.search(r"resource_path='([^']+)'", line)
                if match:
                    path = match.group(1)
            if method and path:
                break
        serialize_map[base] = (method, path)

    methods = []
    for name, block in blocks:
        if name.startswith("_"):
            continue
        if name == "__init__":
            continue
        if name.endswith("_with_http_info") or name.endswith("_without_preload_content"):
            continue
        summary = extract_docstring(block)
        method, path = serialize_map.get(name, (None, None))
        methods.append((name, method, path, summary))

    return methods

sections = []
for api_file in files:
    with open(api_file, "r", encoding="utf-8") as f:
        lines = f.readlines()

    class_indices = []
    for idx, line in enumerate(lines):
        match = re.match(r"^class (\w+)\b", line)
        if match:
            class_indices.append((match.group(1), idx))

    for i, (class_name, start) in enumerate(class_indices):
        end = class_indices[i + 1][1] if i + 1 < len(class_indices) else len(lines)
        class_lines = lines[start:end]
        methods = parse_class_block(class_lines)
        for name, method, path, summary in methods:
            sections.append((class_name, name, method, path, summary))

print(f"### {module} (`{module}`)")
for class_name, name, method, path, summary in sections:
    line = f"- `{module}.{class_name}.{name}`"
    extras = []
    if method and path:
        extras.append(f"`{method.upper()} {path}`")
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
