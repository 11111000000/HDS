Spec: .hds/agent-plugin.json defines the HDS agent plugin v2 manifest.
Checks:
- manifest version is `2`;
- manifest declares the canonical core protocol file;
- manifest declares the v2 loader file;
- manifest lists adapters for OpenCode, Claude Code, Cursor, and Codex;
- manifest preserves the two-cycle order: Surface + Proof, then Code + Verify + Update.
