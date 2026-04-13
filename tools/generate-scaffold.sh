#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TARGET="${1:-.}"

init_scaffold() {
    local target="$1"
    local dir
    dir="$(cd "$target" && pwd)"
    echo "Initializing HDS scaffold in $dir..."
    mkdir -p "$dir"/.github "$dir"/templates "$dir"/tests/contract "$dir"/tests/scenario "$dir"/tools "$dir"/.opencode/agents "$dir"/docs

    cp -n "$SCRIPT_DIR"/../templates/HOLO.md "$dir"/HOLO.md 2>/dev/null || true
    cp -n "$SCRIPT_DIR"/../templates/SURFACE.md "$dir"/SURFACE.md 2>/dev/null || true
    cp -n "$SCRIPT_DIR"/../templates/PR_TEMPLATE.md "$dir"/.github/pull_request_template.md 2>/dev/null || true

    if [ ! -f "$dir"/opencode.json ]; then
        if [ -f "$SCRIPT_DIR"/../opencode.json ]; then
            cp -n "$SCRIPT_DIR"/../opencode.json "$dir"/opencode.json
        else
            cat > "$dir"/opencode.json << 'EOF'
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["docs/hds-llm-seed-en.md"]
}
EOF
        fi
    fi

    if [ ! -f "$dir"/.opencode/agents/hds.md ]; then
        if [ -f "$SCRIPT_DIR"/../.opencode/agents/hds.md ]; then
            cp -n "$SCRIPT_DIR"/../.opencode/agents/hds.md "$dir"/.opencode/agents/hds.md
        else
            cat > "$dir"/.opencode/agents/hds.md << 'EOF'
---
description: HDS-compliant agent that enforces Surface→Proof→Code→Verify workflow
mode: subagent
---

You are an HDS agent. Follow Surface→Proof→Code→Verify workflow.
Include Change Gate (Intent/Pressure/Surface impact/Proof) in every change.
EOF
        fi
    fi

    if [ ! -f "$dir"/AGENTS.md ]; then
        if [ -f "$SCRIPT_DIR"/../AGENTS.md ]; then
            cp -n "$SCRIPT_DIR"/../AGENTS.md "$dir"/AGENTS.md
        else
            cat > "$dir"/AGENTS.md << 'EOF'
# AGENTS.md — HDS Agent Configuration

For guidance, see docs/hds-llm-seed-ru.md or docs/hds-llm-seed-en.md
EOF
        fi
    fi

    if [ ! -f "$dir"/docs/hds-llm-seed-en.md ]; then
        if [ -f "$SCRIPT_DIR"/../docs/hds-llm-seed-en.md ]; then
            cp -n "$SCRIPT_DIR"/../docs/hds-llm-seed-en.md "$dir"/docs/hds-llm_seed-en.md
        fi
    fi

    # Copy verification scripts
    for script in holo-verify.sh surface-lint.sh docs-link-check.sh; do
        if [ -f "$SCRIPT_DIR"/../tools/"$script" ]; then
            cp -n "$SCRIPT_DIR"/../tools/"$script" "$dir/tools/" 2>/dev/null || true
            chmod +x "$dir/tools/$script" 2>/dev/null || true
        fi
    done

    echo "OK: scaffold initialized in $dir"
}

example_backend() {
    local target="$1"
    local dir
    dir="$(cd "$target" && pwd)"
    echo "Creating example-backend..."
    mkdir -p "$dir"/tests/contract "$dir"/tests/scenario
    cp -n "$SCRIPT_DIR"/../templates/HOLO.md "$dir"/HOLO.md 2>/dev/null || true
    cp -n "$SCRIPT_DIR"/../templates/SURFACE.md "$dir"/SURFACE.md 2>/dev/null || true
    : > "$dir"/tests/contract/example_contract.spec
    : > "$dir"/tests/scenario/example_scenario.spec
    echo "OK: example-backend created"
}

cmd="$1"
case "$cmd" in
    init) init_scaffold "${2:-.}" ;;
    example-backend) example_backend "examples/backend" ;;
    *) echo "Usage: $0 {init|example-backend}" >&2; exit 2 ;;
esac
