#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
HDS_ROOT="$SCRIPT_DIR/.."

copy_local_matrix() {
  local dir="$1"

  mkdir -p "$dir"/.opencode/agents "$dir"/.cursor/rules "$dir"/.hds "$dir"/docs "$dir"/tools

  cp -n "$HDS_ROOT/AGENTS.md" "$dir/AGENTS.md" 2>/dev/null || true
  cp -n "$HDS_ROOT/CLAUDE.md" "$dir/CLAUDE.md" 2>/dev/null || true
  cp -n "$HDS_ROOT/CODEX.md" "$dir/CODEX.md" 2>/dev/null || true
  cp -n "$HDS_ROOT/opencode.json" "$dir/opencode.json" 2>/dev/null || true
  cp -n "$HDS_ROOT/.opencode/agents/hds.md" "$dir/.opencode/agents/hds.md" 2>/dev/null || true
  cp -n "$HDS_ROOT/.cursor/rules/hds.md" "$dir/.cursor/rules/hds.md" 2>/dev/null || true
  cp -n "$HDS_ROOT/.hds/agent-plugin.json" "$dir/.hds/agent-plugin.json" 2>/dev/null || true
  cp -n "$HDS_ROOT/docs/hds-agent-loader.md" "$dir/docs/hds-agent-loader.md" 2>/dev/null || true
  cp -n "$HDS_ROOT/docs/hds-agent-plugin.md" "$dir/docs/hds-agent-plugin.md" 2>/dev/null || true

  for script in holo-verify.sh surface-lint.sh docs-link-check.sh hds.sh change-gate-lint.sh agent-plugin-lint.sh; do
    if [ -f "$HDS_ROOT/tools/$script" ]; then
      cp -n "$HDS_ROOT/tools/$script" "$dir/tools/" 2>/dev/null || true
      chmod +x "$dir/tools/$script" 2>/dev/null || true
    fi
  done
}

install_global() {
  echo "Installing HDS agent plugin globally..."

  mkdir -p "$HOME/.config/opencode/agents" "$HOME/.claude"
  cp -n "$HDS_ROOT/opencode.json" "$HOME/.config/opencode/opencode.json" 2>/dev/null || true
  cp -n "$HDS_ROOT/.opencode/agents/hds.md" "$HOME/.config/opencode/agents/hds.md" 2>/dev/null || true
  cp -n "$HDS_ROOT/CLAUDE.md" "$HOME/.claude/CLAUDE.md" 2>/dev/null || true

  echo "OK: global configs installed"
}

install_local() {
  local target="${1:-.}"
  local dir
  mkdir -p "$target"
  dir="$(cd "$target" && pwd)"

  echo "Installing HDS agent plugin locally in $dir..."
  copy_local_matrix "$dir"
  echo "OK: local plugin matrix installed"
}

cmd="${1:-install}"
case "$cmd" in
  global) install_global ;;
  local) install_local "${2:-.}" ;;
  install) install_local "${2:-.}" ;;
  *) echo "Usage: $0 {global|local [directory]|install [directory]}" >&2; exit 2 ;;
esac
