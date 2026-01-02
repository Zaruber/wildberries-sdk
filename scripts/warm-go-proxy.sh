#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${GO_PROXY_VERSION:-${PACKAGE_VERSION:-${1:-}}}"
PROXY="${GO_PROXY:-https://proxy.golang.org}"

if [[ -z "${VERSION}" ]]; then
  if [[ -f "${ROOT_DIR}/pyproject.toml" ]]; then
    VERSION="$(awk -F\" '/^version =/ {print $2; exit}' "${ROOT_DIR}/pyproject.toml")"
  fi
fi

if [[ -z "${VERSION}" ]]; then
  echo "Error: version is required (GO_PROXY_VERSION, PACKAGE_VERSION, or arg)." >&2
  exit 1
fi

if [[ "${VERSION}" != v* ]]; then
  VERSION="v${VERSION}"
fi

if ! command -v go >/dev/null 2>&1; then
  echo "Error: go is required to warm the proxy." >&2
  exit 1
fi

shopt -s nullglob
mods=("${ROOT_DIR}"/clients/go/*/go.mod)
shopt -u nullglob

if [[ "${#mods[@]}" -eq 0 ]]; then
  echo "Error: no go.mod files found under clients/go" >&2
  exit 1
fi

for mod in "${mods[@]}"; do
  module="$(awk 'NR==1 && $1=="module" {print $2; exit}' "${mod}")"
  if [[ -z "${module}" ]]; then
    echo "Skip missing module in ${mod}" >&2
    continue
  fi
  echo "Warming ${module}@${VERSION}"
  GOPROXY="${PROXY}" go list -m -mod=mod "${module}@${VERSION}"
done
