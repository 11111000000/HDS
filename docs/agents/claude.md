# Claude Code Analysis

## Typical Surfaces

- `CLAUDE.md` as the repository instruction file.
- Optional global `~/.claude/CLAUDE.md`.
- Optional skill files under `.claude/skills/*/SKILL.md`.

## HDS Fit

Claude Code works well as a fallback-compatible surface: if `AGENTS.md` is absent, `CLAUDE.md` becomes the local rule file.

## Dialectical Risk

- If `CLAUDE.md` duplicates the loader and core rules, it becomes another source of drift.
- If the repo has both `AGENTS.md` and `CLAUDE.md`, the two must not diverge on protocol shape.

## HDS Recommendation

- Keep `CLAUDE.md` as a thin adapter.
- Point it to the shared loader.
- Do not restate the two cycles in full.
