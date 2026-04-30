# AGENTS.md Across Agent Runtimes

`AGENTS.md` is the portable rule surface for repositories that want one local, file-based policy file.

## Role

- Declare the HDS workflow.
- Declare the Change Gate.
- Point to the seed/loader/core docs.
- Keep the file short enough to be loaded by default.

## HDS Meaning

For HDS, `AGENTS.md` is the shared entrypoint for repo-local behavior, but it should not duplicate the full protocol.

It should contain:
- the two-cycle order;
- the four Change Gate fields;
- the surface-first rule;
- the proof-before-code rule;
- the frozen-pressure-migration rule.

## Comparison

- OpenCode: `AGENTS.md` is primary local rules and may coexist with `opencode.json` and custom agents.
- Claude Code: `CLAUDE.md` is the fallback when `AGENTS.md` is absent, so `AGENTS.md` stays authoritative when present.
- Cursor: repo rules are usually file-based and can be mapped into `.cursor/rules/*.md`.
- Codex: repo-level instruction files can play the same role as `AGENTS.md` or a loader file.
