# HDS Agent Plugin

## Dialectical analysis of agent formats

Thesis: each agent ecosystem has its own instruction surface.
- OpenCode: `AGENTS.md`, `opencode.json`, `.opencode/agents/*.md`
- Claude Code: `CLAUDE.md`
- Cursor: `.cursor/rules/*.md`
- Codex: `CODEX.md` or repo-level instructions loaded by the tool

Antithesis: copying the same HDS rules into every format creates drift, bloat, and inconsistent updates.

Synthesis: keep one canonical HDS core and make every adapter thin.

## Canonical two-cycle HDS

Cycle 1: Surface + Proof
- Pick one intent.
- Declare the public surface impact.
- Check whether the change is Frozen or Fluid.
- Name the proof before coding.

Cycle 2: Code + Verify + Update
- Implement the minimal code.
- Run verification.
- Update HOLO/Decisions only if public meaning changed.

Rules
- Do not start Cycle 2 until Cycle 1 is explicit.
- Do not repeat the full protocol unless the surface changed.
- If the change is [FROZEN], Pressure + Proof + Migration are required.
- Keep adapters thin; never duplicate the core in each format.

## Adapter contract

Every adapter should do only two things:
1. Point to this file.
2. Add the smallest amount of tool-specific syntax needed to load it.
