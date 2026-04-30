# HDS Agent Loader v2

This file is the shared loader between agent-specific adapters and the canonical HDS core.

Load order:
1. Read `.hds/agent-plugin.json`.
2. Read `docs/hds-agent-plugin.md`.
3. Follow exactly two sequential cycles:
   - Cycle 1: Surface + Proof
   - Cycle 2: Code + Verify + Update

Loader rules:
- Do not start Cycle 2 until Cycle 1 is explicit.
- Do not duplicate the full HDS protocol in adapter files.
- If the change touches `[FROZEN]`, require Pressure + Proof + Migration.
- Keep the patch minimal and keep one dominant intent.
