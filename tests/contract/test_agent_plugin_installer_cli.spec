Spec: tools/install-agent-plugin.sh installs the full HDS agent matrix.
Checks:
- `install` / `local` creates `AGENTS.md`, `CLAUDE.md`, `CODEX.md`, `opencode.json`, `.opencode/agents/hds.md`, `.cursor/rules/hds.md`, `.hds/agent-plugin.json`, `docs/hds-agent-loader.md`, and `docs/hds-agent-plugin.md`;
- `global` installs supported OpenCode and Claude Code global configs;
- the installer remains additive and does not remove the existing OpenCode wrapper path.
