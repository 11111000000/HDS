Surface: HDS agent two-cycle protocol
Stability: FROZEN

Spec: one shared core file defines the HDS agent protocol for OpenCode, Claude Code, Cursor, and Codex.

Checks:
- the protocol has exactly two sequential cycles;
- Cycle 1 is Surface + Proof;
- Cycle 2 is Code + Verify + Update;
- the canonical core remains in `docs/hds-agent-plugin.md`;
- adapters do not duplicate the full protocol and instead rely on the shared loader;
- [FROZEN] changes still require Pressure + Proof + Migration.
