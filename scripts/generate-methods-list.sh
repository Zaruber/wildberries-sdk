#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CONFIG_FILE="${ROOT_DIR}/generation.yaml"
SPECS_DIR="${ROOT_DIR}/specs"
README_FILE="${ROOT_DIR}/README.md"

START_MARKER="<!-- METHODS_LIST_START -->"
END_MARKER="<!-- METHODS_LIST_END -->"

if [[ ! -f "${CONFIG_FILE}" ]]; then
  echo "Error: config not found: ${CONFIG_FILE}" >&2
  exit 1
fi

if [[ ! -f "${README_FILE}" ]]; then
  echo "Error: README not found: ${README_FILE}" >&2
  exit 1
fi

if ! command -v ruby >/dev/null 2>&1; then
  echo "Error: ruby is required to parse YAML specs." >&2
  exit 1
fi

read_specs() {
  awk '
    $1=="specs:" {inside=1; next}
    inside && $0 ~ /^[^[:space:]]/ {inside=0}
    inside && $1=="-" {print $2}
  ' "${CONFIG_FILE}"
}

resolve_spec_path() {
  local spec="$1"

  if [[ "${spec}" =~ ^https?:// ]]; then
    echo "${SPECS_DIR}/$(basename "${spec%%\?*}")"
    return
  fi

  if [[ "${spec}" = /* ]]; then
    echo "${spec}"
    return
  fi

  echo "${ROOT_DIR}/${spec}"
}

spec_paths=()
while IFS= read -r spec; do
  [[ -z "${spec}" ]] && continue
  spec_path="$(resolve_spec_path "${spec}")"
  [[ -f "${spec_path}" ]] && spec_paths+=("${spec_path}")
done < <(read_specs)

if [[ "${#spec_paths[@]}" -eq 0 ]]; then
  while IFS= read -r spec_path; do
    [[ -n "${spec_path}" ]] && spec_paths+=("${spec_path}")
  done < <(ls -1 "${SPECS_DIR}"/*.yaml 2>/dev/null | sort)
fi

if [[ "${#spec_paths[@]}" -eq 0 ]]; then
  echo "Error: no spec files found in ${SPECS_DIR}" >&2
  exit 1
fi

render_spec_section() {
  local spec_path="$1"

  ruby -ryaml -e '
    method_order = {
      "get" => 0, "post" => 1, "put" => 2, "patch" => 3,
      "delete" => 4, "head" => 5, "options" => 6, "trace" => 7
    }
    spec_path = ARGV[0]
    spec = YAML.load_file(spec_path) || {}
    title = spec.dig("info", "title").to_s.gsub(/\s+/, " ").strip
    title = File.basename(spec_path) if title.empty?
    paths = spec["paths"] || {}
    ops = []
    paths.each do |path, item|
      next unless item.is_a?(Hash)
      item.each do |method, operation|
        next unless method_order.key?(method)
        next unless operation.is_a?(Hash)
        summary = (operation["summary"] || operation["description"]).to_s
        summary = summary.gsub(/\s+/, " ").strip
        operation_id = operation["operationId"].to_s.gsub(/\s+/, " ").strip
        ops << [path, method, summary, operation_id]
      end
    end
    ops.sort_by! { |path, method, *_| [path, method_order[method]] }
    puts "### #{title} (`#{File.basename(spec_path)}`)"
    ops.each do |path, method, summary, operation_id|
      line = "- `#{method.upcase} #{path}`"
      extras = []
      extras << summary unless summary.empty?
      extras << "(#{operation_id})" unless operation_id.empty?
      line << " — #{extras.join(" ")}" unless extras.empty?
      puts line
    end
  ' "${spec_path}"
}

methods_list=""
for spec_path in "${spec_paths[@]}"; do
  section="$(render_spec_section "${spec_path}")"
  if [[ -n "${methods_list}" ]]; then
    methods_list+=$'\n\n'
  fi
  methods_list+="${section}"
done

ensure_markers() {
  if ! grep -Fq "${START_MARKER}" "${README_FILE}" || ! grep -Fq "${END_MARKER}" "${README_FILE}"; then
    local tmp_file
    tmp_file="$(mktemp)"
    awk -v start="${START_MARKER}" -v end="${END_MARKER}" '
      !inserted && /^##[[:space:]]/ { print start; print end; inserted=1 }
      { print }
      END { if (!inserted) { print start; print end } }
    ' "${README_FILE}" > "${tmp_file}"
    mv "${tmp_file}" "${README_FILE}"
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
