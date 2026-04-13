#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HDS_ROOT="$SCRIPT_DIR/.."

install_global() {
    local target="${HOME}/.config/opencode"
    local agents_dir="$target/agents"
    echo "Installing HDS OpenCode configs globally..."
    mkdir -p "$agents_dir"
    
    cp -n "$HDS_ROOT/opencode.json" "$target/opencode.json" 2>/dev/null || true
    cp -n "$HDS_ROOT/.opencode/agents/hds.md" "$agents_dir/hds.md" 2>/dev/null || true
    
    echo "OK: Global configs installed"
    echo "  - $target/opencode.json (if not exists)"
    echo "  - $agents_dir/hds.md (if not exists)"
}

install_local() {
    local target="${1:-.}"
    local dir
    dir="$(cd "$target" && pwd)"
    
    echo "Installing HDS OpenCode configs locally in $dir..."
    mkdir -p "$dir"/.opencode/agents "$dir"/tools
    
    cp -n "$HDS_ROOT/opencode.json" "$dir/opencode.json" 2>/dev/null || true
    cp -n "$HDS_ROOT/.opencode/agents/hds.md" "$dir/.opencode/agents/hds.md" 2>/dev/null || true
    cp -n "$HDS_ROOT/AGENTS.md" "$dir/AGENTS.md" 2>/dev/null || true
    
    # Copy verification scripts
    for script in holo-verify.sh surface-lint.sh docs-link-check.sh; do
        if [ -f "$HDS_ROOT/tools/$script" ]; then
            cp -n "$HDS_ROOT/tools/$script" "$dir/tools/" 2>/dev/null || true
            chmod +x "$dir/tools/$script" 2>/dev/null || true
        fi
    done
    
    echo "OK: Local configs installed in $dir"
}

cmd="${1:-install}"
case "$cmd" in
    global) install_global ;;
    local) install_local "${2:-.}" ;;
    install) install_local "${2:-.}" ;;
    *) echo "Usage: $0 {global|local [directory]|install [directory]}" >&2; exit 2 ;;
esac
