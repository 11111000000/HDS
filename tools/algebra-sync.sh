#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
# Prefer Markdown source, fallback to Org
if [[ -f "$root/docs/hga-algebra.md" ]]; then
  src="$root/docs/hga-algebra.md"
elif [[ -f "$root/docs/hga-algebra.org" ]]; then
  src="$root/docs/hga-algebra.org"
else
  echo "Missing docs/hga-algebra.md or docs/hga-algebra.org" >&2
  exit 1
fi
dst="$root/docs/algebra/HDS-algebra.txt"
mkdir -p "$(dirname "$dst")"
cp "$src" "$dst"
echo "HGA SYNC: $src -> $dst"
