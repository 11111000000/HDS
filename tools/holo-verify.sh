#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"

fail() { echo "HDS VERIFY: $*" >&2; exit 1; }

# 1) HOLO invariants count >=5
holo="$root/HOLO.md"
[[ -f "$holo" ]] || fail "HOLO.md missing"
inv_count="$(grep -E '^[0-9]+\)' "$holo" | wc -l | tr -d ' ')"
if [[ "${inv_count:-0}" -lt 5 ]]; then
  fail "HOLO.md invariants < 5 (got ${inv_count:-0})"
fi

# 2) SURFACE has at least one [FROZEN] and each has Proof path that exists
surface="$root/SURFACE.md"
[[ -f "$surface" ]] || fail "SURFACE.md missing"
frozen_lines="$(grep -n '\[FROZEN\]' "$surface" || true)"
[[ -n "$frozen_lines" ]] || fail "No [FROZEN] items in SURFACE.md"

missing=0
# parse Proof lines following items; tolerate multiple items sharing one proof
while IFS= read -r line; do
  lnnum="${line%%:*}"
  # search for Proof line within next 5 lines
  proof_line="$(tail -n +$((lnnum)) "$surface" | head -n 6 | grep -m1 -E 'Proof:\s*' || true)"
  if [[ -z "$proof_line" ]]; then
    echo "No Proof found near SURFACE line $lnnum: $line" >&2
    missing=$((missing+1))
    continue
  fi
  path="$(echo "$proof_line" | sed -E 's/.*Proof:\s*//')"
  if [[ "$path" == tests/* ]]; then
    [[ -f "$root/$path" ]] || { echo "Missing Proof file: $path" >&2; missing=$((missing+1)); }
  else
    # If proof points to non-test artifact, at least ensure it exists
    [[ -e "$root/$path" ]] || { echo "Missing Proof artifact: $path" >&2; missing=$((missing+1)); }
  fi
done <<< "$frozen_lines"

[[ "$missing" -eq 0 ]] || fail "Missing Proof artifacts: $missing"

# 3) Scenario existence
shopt -s nullglob
scenarios=( "$root"/tests/scenario/* )
[[ ${#scenarios[@]} -ge 1 ]] || fail "No scenario tests found"

echo "HDS VERIFY: OK"
