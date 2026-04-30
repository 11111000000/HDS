#!/usr/bin/env bash
set -euo pipefail
root="$(cd "$(dirname "$0")/.." && pwd)"

usage() {
  cat >&2 <<EOF
HDS wrapper CLI
Usage: $0 {verify|lint|links|spec|gate|all}
  verify  -> tools/holo-verify.sh
  lint    -> tools/surface-lint.sh
  links   -> tools/docs-link-check.sh
  spec    -> tools/spec-version-check.sh
  gate    -> tools/change-gate-lint.sh <message-file>
  all     -> verify + lint + links + spec (in order)
Env:
  HDS_PROOF_REUSE_MAX   Proof reuse threshold (default 2), respected by holo-verify.sh
EOF
}

cmd="${1:-all}"
case "$cmd" in
  verify) bash "$root/tools/holo-verify.sh";;
  lint)   bash "$root/tools/surface-lint.sh";;
  links)  bash "$root/tools/docs-link-check.sh";;
  spec)   bash "$root/tools/spec-version-check.sh";;
  gate)   bash "$root/tools/change-gate-lint.sh" "${2:-/dev/stdin}";;
  all)
    bash "$root/tools/holo-verify.sh"
    bash "$root/tools/surface-lint.sh"
    bash "$root/tools/docs-link-check.sh"
    bash "$root/tools/spec-version-check.sh"
    echo "HDS WRAPPER: OK"
    ;;
  *) usage; exit 2;;
esac
