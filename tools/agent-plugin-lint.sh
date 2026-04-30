#!/usr/bin/env bash
set -euo pipefail

root="$(cd "$(dirname "$0")/.." && pwd)"
manifest="$root/.hds/agent-plugin.json"
loader="$root/docs/hds-agent-loader.md"
core="$root/docs/hds-agent-plugin.md"

fail() { echo "AGENT PLUGIN LINT: $*" >&2; exit 1; }

[[ -f "$manifest" ]] || fail "manifest missing"
[[ -f "$loader" ]] || fail "loader missing"
[[ -f "$core" ]] || fail "core missing"

grep -q '"version":[[:space:]]*2' "$manifest" || fail "manifest version must be 2"
grep -q '"core":[[:space:]]*"docs/hds-agent-plugin.md"' "$manifest" || fail "manifest core path mismatch"
grep -q '"loader":[[:space:]]*"docs/hds-agent-loader.md"' "$manifest" || fail "manifest loader path mismatch"

for path in ".opencode/agents/hds.md" "CLAUDE.md" ".cursor/rules/hds.md" "CODEX.md"; do
  [[ -f "$root/$path" ]] || fail "adapter missing: $path"
  grep -q 'docs/hds-agent-loader.md' "$root/$path" || fail "adapter does not point to loader: $path"
done

grep -q '.hds/agent-plugin.json' "$loader" || fail "loader does not point to manifest"
grep -q 'docs/hds-agent-plugin.md' "$loader" || fail "loader does not point to core"

echo "AGENT PLUGIN LINT: OK"
