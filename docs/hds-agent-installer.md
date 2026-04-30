# HDS Agent Installer v2

Purpose: install the full HDS agent plugin matrix with one command.

Modes
- `install` / `local [directory]`: install the local matrix for OpenCode, Claude Code, Cursor, and Codex.
- `global`: install supported global configs for OpenCode and Claude Code.

Installed artifacts
- `AGENTS.md`
- `CLAUDE.md`
- `CODEX.md`
- `opencode.json`
- `.opencode/agents/hds.md`
- `.cursor/rules/hds.md`
- `.hds/agent-plugin.json`
- `docs/hds-agent-loader.md`
- `docs/hds-agent-plugin.md`

Rules
- Keep the installer additive.
- Keep the loader/core split intact.
- Do not duplicate the two-cycle protocol in adapter files.
