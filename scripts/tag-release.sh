#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
PYPROJECT="${ROOT_DIR}/pyproject.toml"

VERSION="${PACKAGE_VERSION:-}"
if [[ -z "${VERSION}" && -n "${1:-}" ]]; then
  VERSION="${1}"
fi

if [[ -z "${VERSION}" && -f "${PYPROJECT}" ]]; then
  VERSION="$(awk -F\" '/^version =/ {print $2; exit}' "${PYPROJECT}")"
fi

if [[ -z "${VERSION}" ]]; then
  echo "Error: version not provided and not found in pyproject.toml." >&2
  exit 1
fi

TAG="v${VERSION}"

if git rev-parse -q --verify "refs/tags/${TAG}" >/dev/null; then
  echo "Tag already exists: ${TAG}"
else
  git tag "${TAG}"
  echo "Created tag: ${TAG}"
fi

if [[ "${PUSH_TAGS:-0}" == "1" ]]; then
  git push origin "${TAG}"
fi
