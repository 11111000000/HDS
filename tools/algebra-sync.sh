#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
src="$root/docs/hga-algebra.org"
dst="$root/docs/algebra/HDS-algebra.txt"
[[ -f "$src" ]] || { echo "Missing $src" >&2; exit 1; }
mkdir -p "$(dirname "$dst")"
cp "$src" "$dst"
echo "HGA SYNC: $src -> $dst"
