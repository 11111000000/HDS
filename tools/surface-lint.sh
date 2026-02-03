#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"
surface="$root/SURFACE.md"
[[ -f "$surface" ]] || { echo "SURFACE.md missing" >&2; exit 2; }

# Lint ensures each [FROZEN]/[FLUID] line has a name and optional path in parentheses
bad=0
while IFS= read -r line; do
  if [[ "$line" =~ ^-[[:space:]]+\[(FROZEN|FLUID)\][[:space:]]+[^()]+(\([^)]*\))?[[:space:]]*$ ]]; then
    :
  else
    echo "SURFACE LINT: suspicious line: $line" >&2
    bad=$((bad+1))
  fi
done < <(grep -E '^\-\s*\[(FROZEN|FLUID)\]' "$surface" || true)

if [[ "$bad" -gt 0 ]]; then
  echo "SURFACE LINT: $bad issues" >&2
  exit 1
fi

echo "SURFACE LINT: OK"
