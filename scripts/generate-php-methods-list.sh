#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${ROOT_DIR}/generation.yaml"
CLIENTS_DIR="${ROOT_DIR}/clients/php"
README_FILE="${ROOT_DIR}/docs/php/README.md"

START_MARKER="<!-- PHP_METHODS_LIST_START -->"
END_MARKER="<!-- PHP_METHODS_LIST_END -->"

if [[ ! -f "${CONFIG_FILE}" ]]; then
  echo "Error: config not found: ${CONFIG_FILE}" >&2
  exit 1
fi

if [[ ! -d "${CLIENTS_DIR}" ]]; then
  echo "Error: php clients directory not found: ${CLIENTS_DIR}" >&2
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
  echo "Error: no php client modules found in ${CLIENTS_DIR}" >&2
  exit 1
fi

render_module_section() {
  local module="$1"
  local api_dir="${CLIENTS_DIR}/${module}/lib/Api"

  if [[ ! -d "${api_dir}" ]]; then
    return
  fi

  local api_files=()
  while IFS= read -r file; do
    api_files+=("${file}")
  done < <(ls -1 "${api_dir}"/*.php 2>/dev/null | sort)

  if [[ "${#api_files[@]}" -eq 0 ]]; then
    return
  fi

  "${PYTHON_BIN}" - <<'PY' "${module}" "${api_files[@]}"
import re
import sys

module = sys.argv[1]
files = sys.argv[2:]

def extract_block(lines, start_idx):
    block = []
    brace_count = 0
    in_block = False
    for i in range(start_idx, len(lines)):
        line = lines[i]
        if "{" in line:
            brace_count += line.count("{")
            in_block = True
        if in_block:
            block.append(line)
        if "}" in line and in_block:
            brace_count -= line.count("}")
            if brace_count == 0:
                break
    return block

def extract_docstring(lines, idx):
    line_idx = idx - 1
    while line_idx >= 0 and not lines[line_idx].strip():
        line_idx -= 1
    if line_idx < 0 or not lines[line_idx].strip().endswith("*/"):
        return ""
    end = line_idx
    start = end - 1
    while start >= 0:
        if lines[start].strip().startswith("/**"):
            break
        start -= 1
    if start < 0:
        return ""
    contents = []
    for line in lines[start + 1 : end]:
        content = line.strip()
        if content.startswith("*"):
            content = content[1:].strip()
        if not content or content.startswith("@"):
            continue
        contents.append(content)
    if not contents:
        return ""
    if contents[0].startswith("Operation ") and len(contents) > 1:
        return contents[1]
    return contents[0]

def parse_request_block(block):
    method = None
    path = None
    for line in block:
        if path is None:
            match = re.search(r"\$resourcePath\s*=\s*'([^']+)'", line)
            if not match:
                match = re.search(r'\$resourcePath\s*=\s*"([^"]+)"', line)
            if match:
                path = match.group(1)
        if method is None:
            match = re.search(r"new Request\(\s*'([A-Z]+)'", line)
            if not match:
                match = re.search(r'new Request\(\s*"([A-Z]+)"', line)
            if match:
                method = match.group(1)
        if method is None:
            match = re.match(r"\s*['\"]([A-Z]+)['\"]\s*,\s*$", line)
            if match:
                method = match.group(1)
        if method is None:
            match = re.search(r"\$method\s*=\s*'([A-Z]+)'", line)
            if not match:
                match = re.search(r'\$method\s*=\s*"([A-Z]+)"', line)
            if match:
                method = match.group(1)
        if method and path:
            break
    return method, path

methods = []
request_map = {}

for api_file in files:
    with open(api_file, "r", encoding="utf-8") as fh:
        lines = fh.readlines()

    class_name = None
    for idx, line in enumerate(lines):
        class_match = re.match(r"\s*class\s+(\w+)\b", line)
        if class_match:
            class_name = class_match.group(1)
        func_match = re.match(r"\s*(public|protected)\s+function\s+(\w+)\s*\(", line)
        if not func_match:
            continue
        name = func_match.group(2)
        block = extract_block(lines, idx)
        if name.endswith("Request"):
            method, path = parse_request_block(block)
            request_map[name[: -len("Request")]] = (method, path)
            continue
        if name.startswith("__"):
            continue
        if name.endswith("WithHttpInfo") or name.endswith("WithHttpInfoAsync"):
            continue
        if name.endswith("Async"):
            continue
        summary = extract_docstring(lines, idx)
        methods.append((class_name, name, summary))

print(f"### {module} (`{module}`)")
for class_name, name, summary in methods:
    method, path = request_map.get(name, (None, None))
    if not method or not path:
        continue
    line = f"- `{module}.{class_name}.{name}`"
    extras = [f"`{method} {path}`"]
    if summary:
        extras.append(summary)
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
