Scenario: HDS agent plugin matrix v2
Checks:
- OpenCode loads `.opencode/agents/hds.md` and points to `docs/hds-agent-loader.md`;
- Claude Code loads `CLAUDE.md` and points to `docs/hds-agent-loader.md`;
- Cursor loads `.cursor/rules/hds.md` and points to `docs/hds-agent-loader.md`;
- Codex loads `CODEX.md` and points to `docs/hds-agent-loader.md`;
- the loader points to `.hds/agent-plugin.json` and `docs/hds-agent-plugin.md`;
- the second cycle begins only after the first cycle is explicit.
