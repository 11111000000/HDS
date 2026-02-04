#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

# Collect Markdown-style links: [text](path)
md_links=$(grep -Rho '\[[^]]*\]\(([^)#]+)\)' "$root/docs" 2>/dev/null | sed -E 's/.*\]\(([^)#]+)\).*/\1/')

# Collect Org-style links: [[path]] and [[path][label]] (extract the left part)
org_links=$(grep -RhoE '\[\[[^]]+\](\[[^]]*\])?\]' "$root/docs" 2>/dev/null \
  | sed -E -e 's/^\[\[//' -e 's/\]\[.*\]\]$//' -e 's/\]\]$//')

missing=0

check_link() {
  local lnk="$1"
  # skip http(s) and mailto and anchors
  [[ "$lnk" =~ ^https?:// ]] && return 0
  [[ "$lnk" =~ ^mailto: ]] && return 0
  [[ "$lnk" =~ ^# ]] && return 0
  # strip anchor if present
  lnk="${lnk%%#*}"
  # empty after stripping -> ok
  [[ -z "$lnk" ]] && return 0
  # try relative to docs/, then repo root
  if [[ -e "$root/docs/$lnk" || -e "$root/$lnk" ]]; then
    return 0
  else
    echo "DOCS LINK-CHECK: broken link -> $lnk" >&2
    missing=$((missing+1))
  fi
}

# shellcheck disable=SC2068
for l in ${md_links[@]:-}; do
  check_link "$l"
done

# shellcheck disable=SC2068
for l in ${org_links[@]:-}; do
  check_link "$l"
done

if [[ "$missing" -gt 0 ]]; then
  echo "DOCS LINK-CHECK: $missing broken link(s)" >&2
  exit 1
fi

echo "DOCS LINK-CHECK: OK"
