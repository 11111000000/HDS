#!/usr/bin/env bash
set -euo pipefail

cmd="${1:-}"
case "$cmd" in
  init)
    echo "Scaffold exists if this script is present. See templates/* for HOLO/SURFACE/PR.";;
  example-backend)
    mkdir -p examples/backend/tests/{contract,scenario}
    cp -n templates/HOLO.md examples/backend/HOLO.md || true
    cp -n templates/SURFACE.md examples/backend/SURFACE.md || true
    : > examples/backend/tests/contract/example_contract.spec
    : > examples/backend/tests/scenario/example_scenario.spec
    echo "OK: examples/backend created";;
  *)
    echo "Usage: $0 {init|example-backend}" >&2; exit 2;;
esac
