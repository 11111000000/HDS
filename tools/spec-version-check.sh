#!/usr/bin/env bash
set -euo pipefail
spec_ver="$(grep -Eo 'HDS v[0-9]+\.[0-9]+' docs/hds-spec.md | head -n1 || true)"
if [[ -z "$spec_ver" ]]; then
  spec_ver="$(grep -Eo 'HDS v[0-9]+\.[0-9]+' docs/hds-spec.org | head -n1 || true)"
fi
cmp_ver="$(grep -Eo 'HDS v[0-9]+\.[0-9]+' docs/hdf-compact-spec.md | head -n1 || true)"
[[ -z "$spec_ver" || -z "$cmp_ver" ]] && { echo "SPEC VER: unable to detect"; exit 0; }
if [[ "$spec_ver" != "$cmp_ver" ]]; then
  echo "SPEC VER MISMATCH: $spec_ver vs $cmp_ver" >&2; exit 1
fi
echo "SPEC VER: OK ($spec_ver)"
