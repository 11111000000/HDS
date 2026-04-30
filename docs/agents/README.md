# HDS Agent Format Analysis

Purpose: collect the plugin and `AGENTS` surfaces used by common agent runtimes and reduce them to a single HDS loading model.

## Common Dialectic

- Thesis: each runtime has its own instruction surface.
- Antithesis: copying the full HDS protocol into every surface creates drift and duplication.
- Synthesis: one canonical HDS core, one shared loader, thin adapters per runtime.

## Agent Types

- OpenCode: `docs/agents/opencode.md`
- Claude Code: `docs/agents/claude.md`
- Cursor: `docs/agents/cursor.md`
- Codex: `docs/agents/codex.md`
- Common `AGENTS.md` contract: `docs/agents/agents.md`

## HDS Rule

Every adapter should do the minimum needed to load the shared loader. The loader then enforces the two cycles:
1. Surface + Proof
2. Code + Verify + Update
