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

# 2) SURFACE has at least one [FROZEN] and each has a non-empty Proof path that exists
surface="$root/SURFACE.md"
[[ -f "$surface" ]] || fail "SURFACE.md missing"
frozen_lines="$(grep -n '\[FROZEN\]' "$surface" || true)"
[[ -n "$frozen_lines" ]] || fail "No [FROZEN] items in SURFACE.md"

missing=0
declare -A proof_counts=()

while IFS= read -r line; do
  lnnum="${line%%:*}"
  proof_line="$(tail -n +$((lnnum)) "$surface" | head -n 6 | grep -m1 -E 'Proof:\s*' || true)"
  if [[ -z "$proof_line" ]]; then
    echo "No Proof found near SURFACE line $lnnum: $line" >&2
    missing=$((missing+1))
    continue
  fi
  path="$(echo "$proof_line" | sed -E 's/.*Proof:\s*//')"
  # Count proof usage
  proof_counts["$path"]=$(( ${proof_counts["$path"]:-0} + 1 ))

  if [[ "$path" == tests/* ]]; then
    [[ -s "$root/$path" ]] || { echo "Missing or empty Proof file: $path" >&2; missing=$((missing+1)); }
  else
    [[ -e "$root/$path" ]] || { echo "Missing Proof artifact: $path" >&2; missing=$((missing+1)); }
  fi
done <<< "$frozen_lines"

[[ "$missing" -eq 0 ]] || fail "Missing Proof artifacts: $missing"

# Enforce: do not let one Proof be shared by too many [FROZEN] (threshold = 2)
threshold=2
for p in "${!proof_counts[@]}"; do
  c="${proof_counts[$p]}"
  if [[ "$c" -gt "$threshold" ]]; then
    fail "Proof reuse too high: '$p' is referenced by $c [FROZEN] items (max $threshold)"
  fi
done

# 3) Scenario existence (at least one non-empty scenario file)
shopt -s nullglob
scenarios=( "$root"/tests/scenario/* )
[[ ${#scenarios[@]} -ge 1 ]] || fail "No scenario tests found"
nonempty=0
for sc in "${scenarios[@]}"; do
  if [[ -s "$sc" ]]; then nonempty=$((nonempty+1)); fi
done
[[ "$nonempty" -ge 1 ]] || fail "All scenario tests are empty; add content"

# 4) DECISIONS Frozen must have Exit criteria
dec="$root/DECISIONS.md"
if [[ -f "$dec" ]]; then
  froz="$(grep -n 'Status:[[:space:]]*Frozen' "$dec" || true)"
  if [[ -n "$froz" ]]; then
    miss_exit=0
    while IFS= read -r l; do
      ln="${l%%:*}"
      blk="$(tail -n +$((ln)) "$dec" | head -n 8)"
      if ! grep -q -E '^ *Exit:' <<<"$blk"; then
        echo "DECISIONS: Frozen without Exit near line $ln" >&2
        miss_exit=$((miss_exit+1))
      fi
    done <<< "$froz"
    [[ "$miss_exit" -eq 0 ]] || fail "DECISIONS: $miss_exit Frozen decision(s) missing Exit"
  fi
fi

echo "HDS VERIFY: OK"
