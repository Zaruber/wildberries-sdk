#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
VERSION="${GO_VERSION:-${PACKAGE_VERSION:-${1:-}}}"
PUSH_TAGS="${PUSH_TAGS:-0}"

if [[ -z "${VERSION}" ]]; then
  if [[ -f "${ROOT_DIR}/pyproject.toml" ]]; then
    VERSION="$(awk -F\" '/^version =/ {print $2; exit}' "${ROOT_DIR}/pyproject.toml")"
  fi
fi

if [[ -z "${VERSION}" ]]; then
  echo "Error: version is required (GO_VERSION, PACKAGE_VERSION, or arg)." >&2
  exit 1
fi

if [[ "${VERSION}" != v* ]]; then
  VERSION="v${VERSION}"
fi

if ! command -v git >/dev/null 2>&1; then
  echo "Error: git is required to create tags." >&2
  exit 1
fi

if [[ ! -d "${ROOT_DIR}/clients/go" ]]; then
  echo "Error: go clients directory not found: ${ROOT_DIR}/clients/go" >&2
  exit 1
fi

shopt -s nullglob
mods=("${ROOT_DIR}"/clients/go/*/go.mod)
shopt -u nullglob

if [[ "${#mods[@]}" -eq 0 ]]; then
  echo "Error: no go.mod files found under clients/go" >&2
  exit 1
fi

tags_created=0
for mod in "${mods[@]}"; do
  name="$(basename "$(dirname "${mod}")")"
  tag="clients/go/${name}/${VERSION}"
  if git rev-parse -q --verify "refs/tags/${tag}" >/dev/null; then
    echo "Tag exists: ${tag}"
  else
    git tag "${tag}"
    echo "Tagged: ${tag}"
    tags_created=1
  fi
done

if [[ "${PUSH_TAGS}" == "1" && "${tags_created}" -eq 1 ]]; then
  git push origin --tags
fi
