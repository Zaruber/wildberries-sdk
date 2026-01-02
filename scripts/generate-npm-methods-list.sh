#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${ROOT_DIR}/generation.yaml"
CLIENTS_DIR="${ROOT_DIR}/clients/npm"
README_FILE="${ROOT_DIR}/docs/npm/README.md"

START_MARKER="<!-- NPM_METHODS_LIST_START -->"
END_MARKER="<!-- NPM_METHODS_LIST_END -->"

if [[ ! -f "${CONFIG_FILE}" ]]; then
  echo "Error: config not found: ${CONFIG_FILE}" >&2
  exit 1
fi

if [[ ! -d "${CLIENTS_DIR}" ]]; then
  echo "Error: npm clients directory not found: ${CLIENTS_DIR}" >&2
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
  base="$(basename "${spec}" .yaml)"
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
  echo "Error: no npm client modules found in ${CLIENTS_DIR}" >&2
  exit 1
fi

render_module_section() {
  local module="$1"
  local api_dir="${CLIENTS_DIR}/${module}/src/apis"

  if [[ ! -d "${api_dir}" ]]; then
    return
  fi

  local api_files=()
  while IFS= read -r file; do
    case "$(basename "${file}")" in
      index.ts) continue ;;
    esac
    api_files+=("${file}")
  done < <(ls -1 "${api_dir}"/*.ts 2>/dev/null | sort)

  if [[ "${#api_files[@]}" -eq 0 ]]; then
    return
  fi

  "${PYTHON_BIN}" - <<'PY' "${module}" "${api_files[@]}"
import re
import sys

module = sys.argv[1]
files = sys.argv[2:]

def extract_summary(comment_lines):
    summary = ""
    for line in comment_lines:
        stripped = line.strip()
        if stripped.startswith("/**") or stripped.startswith("*/"):
            continue
        if stripped.startswith("*"):
            stripped = stripped[1:].strip()
        if not stripped or stripped.startswith("@"):
            continue
        summary = stripped
    return summary

def parse_file(path):
    with open(path, "r", encoding="utf-8") as f:
        lines = f.readlines()

    current_class = None
    methods = []
    i = 0
    while i < len(lines):
        line = lines[i]
        class_match = re.match(r"^export class (\w+)\b", line)
        if class_match:
            current_class = class_match.group(1)

        if line.strip().startswith("/**"):
            comment_lines = [line]
            i += 1
            while i < len(lines):
                comment_lines.append(lines[i])
                if "*/" in lines[i]:
                    i += 1
                    break
                i += 1

            while i < len(lines) and lines[i].strip() == "":
                i += 1

            if i >= len(lines):
                break

            method_match = re.match(r"\s*async (\w+)\(", lines[i])
            if not method_match:
                continue

            method_name = method_match.group(1)
            if not method_name.endswith("Raw"):
                continue

            base_name = method_name[:-3]
            summary = extract_summary(comment_lines)

            block_lines = [lines[i]]
            i += 1
            while i < len(lines):
                if re.match(r"\s*async \w+\(", lines[i]):
                    break
                if re.match(r"^export class \w+\b", lines[i]):
                    break
                block_lines.append(lines[i])
                i += 1

            http_method = None
            path = None
            for block_line in block_lines:
                if path is None:
                    match = re.search(r"urlPath\s*=\s*`([^`]+)`", block_line)
                    if match:
                        path = match.group(1)
                if http_method is None:
                    match = re.search(r"method:\s*['\"]([A-Z]+)['\"]", block_line)
                    if match:
                        http_method = match.group(1)
                if path and http_method:
                    break

            if current_class:
                methods.append((current_class, base_name, http_method, path, summary))
            continue

        i += 1

    return methods

all_methods = []
for file_path in files:
    all_methods.extend(parse_file(file_path))

print(f"### {module} (`{module}`)")
for class_name, method_name, http_method, path, summary in all_methods:
    line = f"- `{module}.{class_name}.{method_name}`"
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
