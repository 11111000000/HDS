#!/usr/bin/env bash
set -euo pipefail

MSG_FILE=${1:-/dev/stdin}

fail() { echo "CHANGE GATE LINT: $*" >&2; exit 1; }

[[ -r "$MSG_FILE" ]] || fail "message file is not readable: $MSG_FILE"

content=$(<"$MSG_FILE")

missing=0
for field in "Intent:" "Pressure:" "Surface impact:" "Proof:"; do
  if ! grep -q "$field" <<< "$content"; then
    echo "CHANGE GATE LINT: missing field '$field'" >&2
    missing=1
  fi
done

[[ "$missing" -eq 0 ]] || fail "Change Gate is incomplete"

intent=$(grep -m1 '^Intent:' <<< "$content" | sed -E 's/^Intent:[[:space:]]*//')
pressure=$(grep -m1 '^Pressure:' <<< "$content" | sed -E 's/^Pressure:[[:space:]]*//')
surface=$(grep -m1 '^Surface impact:' <<< "$content" | sed -E 's/^Surface impact:[[:space:]]*//')
proof=$(grep -m1 '^Proof:' <<< "$content" | sed -E 's/^Proof:[[:space:]]*//')

[[ ${#intent} -ge 12 ]] || fail "Intent is too vague; use one specific sentence"

case "$pressure" in
  Bug|Feature|Debt|Ops) ;;
  *) fail "Pressure must be one of: Bug, Feature, Debt, Ops" ;;
esac

if [[ "$surface" != "(none)" && ! "$surface" =~ ^touches:[[:space:]].+\[(FROZEN|FLUID)\] ]]; then
  fail "Surface impact must be '(none)' or 'touches: <SurfaceItem> [FROZEN|FLUID]'"
fi

if ! grep -Eq 'tests:|tools/|tests/' <<< "$proof"; then
  fail "Proof must reference tests or tools"
fi

if grep -q "\[FROZEN\]" <<< "$content"; then
  grep -q '^Migration:' <<< "$content" || fail "[FROZEN] impact requires Migration block"
fi

echo "CHANGE GATE LINT: OK"
