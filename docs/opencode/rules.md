# OpenCode Rules (AGENTS.md)

Set custom instructions for OpenCode.

You can provide custom instructions by creating an `AGENTS.md` file. It contains instructions that will be included in the LLM's context to customize its behavior for your specific project.

---

## Initialize

To create a new `AGENTS.md` file, run `/init` command in OpenCode.

> **Tip**: You should commit your project’s `AGENTS.md` file to Git.

`/init` scans the important files in your repo, may ask targeted questions, and creates `AGENTS.md` with project-specific guidance.

It focuses on:
- build, lint, and test commands
- command order and verification steps
- architecture and repo structure
- project-specific conventions
- references to existing instruction sources

If you already have an `AGENTS.md`, `/init` will improve it in place.

---

## Example

```markdown
# My Project
This is a TypeScript monorepo with bun workspaces.

## Project Structure
- `packages/` - Workspace packages
- `infra/` - Infrastructure definitions

## Code Standards
- Use TypeScript with strict mode
- Shared code goes in `packages/core/`

## Commands
- Build: bun run build
- Test: bun test
- Lint: bun lint
```

---

## Types

### Project rules

Place `AGENTS.md` in your project root. These only apply when working in this directory or its sub-directories.

### Global rules

Global rules at `~/.config/opencode/AGENTS.md`. Applied across all OpenCode sessions.

### Claude Code Compatibility

OpenCode supports Claude Code conventions as fallbacks:
- **Project**: `CLAUDE.md` (if no `AGENTS.md` exists)
- **Global**: `~/.claude/CLAUDE.md`
- **Skills**: `~/.claude/skills/`

To disable:

```bash
export OPENCODE_DISABLE_CLAUDE_CODE=1
export OPENCODE_DISABLE_CLAUDE_CODE_PROMPT=1
export OPENCODE_DISABLE_CLAUDE_CODE_SKILLS=1
```

---

## Precedence

When OpenCode starts, it looks for rule files in this order:

1. **Local files** - `AGENTS.md`, `CLAUDE.md` (traversing up from current directory)
2. **Global file** - `~/.config/opencode/AGENTS.md`
3. **Claude Code file** - `~/.claude/CLAUDE.md` (unless disabled)

The first matching file wins in each category.

---

## Custom Instructions

Specify custom instruction files in `opencode.json`:

```json
{
  "$schema": "https://opencode.ai/config.json",
  "instructions": ["CONTRIBUTING.md", "docs/guidelines.md", ".cursor/rules/*.md"]
}
```

You can also use remote URLs:

```json
{
  "instructions": ["https://raw.githubusercontent.com/my-org/shared-rules/main/style.md"]
}
```

Remote instructions are fetched with a 5 second timeout.

---

## Referencing External Files

### Using opencode.json

```json
{
  "instructions": ["docs/development-standards.md", "test/testing-guidelines.md"]
}
```

### Manual in AGENTS.md

```markdown
For TypeScript guidelines see @docs/typescript-guidelines.md
For React patterns see @docs/react-patterns.md
```

OpenCode will load referenced files on demand.

---

## Integration with HDS

For HDS projects, the `AGENTS.md` should reference:
- `docs/hds-llm-seed-en.md` or `docs/hds-llm-seed-ru.md` for methodology
- Verification commands: `./tools/holo-verify.sh`, `./tools/surface-lint.sh`
- Project structure (HOLO.md, SURFACE.md, tests/contract, tests/scenario)