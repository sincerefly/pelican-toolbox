#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 1 ]]; then
  echo "Usage: $0 <version>"
  echo "Example: $0 1.2.3"
  exit 1
fi

version="$1"
if [[ ! "$version" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Invalid version: $version"
  echo "Expected format: X.Y.Z (example: 1.2.3)"
  exit 1
fi

tag="v${version}"

if git rev-parse "$tag" >/dev/null 2>&1; then
  echo "Tag already exists: $tag"
  exit 1
fi

git tag -a "$tag" -m "release: $tag"

echo "Created tag: $tag"
echo "Next: git push origin main --tags"
