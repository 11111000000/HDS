# AGENTS.md — HDS Agent Configuration

This file configures how AI agents (OpenCode, Claude Code, etc.) work with this repository.

## Quick Start

**For new projects**: Copy `docs/hds-llm-seed-ru.md` or `docs/hds-llm-seed-en.md` into your LLM context.

**For changes in this repo**: Follow the HDS workflow below.

---

## HDS Workflow (mandatory)

When asked to make changes, you MUST follow this ritual:

```
1. Surface (public contracts) → 2. Proof (tests) → 3. Code → 4. Verify → 5. Update HOLO/Decisions
```

### Change Gate (required for every change)

Every change MUST include:
- **Intent**: One sentence describing the goal
- **Pressure**: Bug | Feature | Debt | Ops
- **Surface impact**: (none) | touches: <SurfaceItem> [FROZEN/FLUID]
- **Proof**: tests that validate the intent

If touching [FROZEN] items → add Migration Block.

### Rules (non-negotiable)

1. **A1 Surface First**: External promises start in `SURFACE.md`, then tests, then code
2. **A2 Frozen Requires Proof**: Every [FROZEN] surface item has reproducible Proof (tests)
3. **A3 One Change — One Intent**: One PR = one dominant goal
4. **A4 Pressure for Frozen**: Touching [FROZEN] requires Pressure + Proof + Migration
5. **A5 Decisions Need Exit**: Frozen decisions have exit criteria in `HOLO.md`
6. **A6 Core/Periphery**: Core meaning is IO-agnostic; effects live in adapters

If any rule is violated → stop, explain, propose correction.

### Failure Handling

On any FAIL:
1. Classify: Surface drift | Test gap | Code defect
2. Fix in order: Surface → Tests → Code (minimal)
3. Don't widen Intent; rerun Verify

---

## Seed Reference

For detailed guidance, see:
- Russian: `docs/hds-llm-seed-ru.md`
- English: `docs/hds-llm-seed-en.md`

Both contain:
- Axioms A1–A6
- Change Gate + Migration Block
- Minimal algebra and invariants
- Bootstrap workflow
- Templates (HOLO, SURFACE, Proof)

---

## Verification Commands

Run these after any change:
```bash
./tools/holo-verify.sh    # HOLO consistency
./tools/surface-lint.sh   # SURFACE format
./tools/docs-link-check.sh # Links
```

Tests:
- `tests/contract/*.spec` — contract tests for [FROZEN] items
- `tests/scenario/*.spec` — vertical scenario tests

---

## Project Structure

```
/
├── SURFACE.md          # Public contracts registry
├── HOLO.md             # Holographic manifest (stage, invariants, decisions)
├── docs/
│   ├── hds-llm-seed-ru.md   # Seed (RU)
│   ├── hds-llm-seed-en.md   # Seed (EN)
│   └── hds-spec.md          # Full specification
├── templates/
│   ├── HOLO.md              # Template
│   └── SURFACE.md           # Template
├── tools/
│   ├── generate-scaffold.sh # Scaffold tool
│   ├── holo-verify.sh        # Verification
│   └── surface-lint.sh       # Lint
└── tests/
    ├── contract/            # Contract tests (Proof)
    └── scenario/            # Scenario tests
```

---

## Output Format

When responding, structure output as:
1. **Questions** — Clarifying questions (if needed)
2. **Plan** — Change Gate + approach
3. **Answer** — Files/patch
4. **Verify** — How to check
5. **Commands** — Shell commands to run

---

## Agent Behavior

- **DO**: Follow HDS ritual, use Change Gate, create Proof before code
- **DON'T**: Skip steps, widen Intent, touch [FROZEN] without Migration Block
- **IF VIOLATED**: Refuse and propose HDS-compliant plan
