# OpenCode Analysis

## Typical Surfaces

- `AGENTS.md` for repository rules.
- `opencode.json` for instructions and agent config.
- `.opencode/agents/*.md` for custom agents.
- `.opencode/skills/*/SKILL.md` for optional reusable behavior.

## HDS Fit

OpenCode is the clearest fit for HDS because it already separates:
- repo rules (`AGENTS.md`)
- config (`opencode.json`)
- custom agent entrypoints (`.opencode/agents/*.md`)
- optional behavior modules (`skills`)

## Dialectical Risk

- If `AGENTS.md` repeats the full seed, the project gets duplication.
- If `opencode.json` and agent files each restate the same rules, the system drifts.

## HDS Recommendation

- Keep `AGENTS.md` short.
- Point `opencode.json` to the shared loader/seed.
- Keep `.opencode/agents/hds.md` as a thin adapter.
- Treat skills as optional, not canonical.
