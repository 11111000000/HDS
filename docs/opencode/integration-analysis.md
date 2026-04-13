# OpenCode Integration Analysis

Analysis of HDS integration with OpenCode and evaluation of seed effectiveness.

---

## 1. OpenCode Mechanics Summary

### 1.1 How OpenCode Reads Instructions

| Mechanism | File | Priority | Loading |
|-----------|------|-----------|---------|
| Rules | `AGENTS.md` | Local first | Auto on start |
| Rules | `CLAUDE.md` | Fallback | If no AGENTS.md |
| Global rules | `~/.config/opencode/AGENTS.md` | Lowest | Auto on start |
| Global rules | `~/.claude/CLAUDE.md` | Fallback | If no global AGENTS.md |
| Instructions | `opencode.json` → `instructions` | Configurable | Merged with rules |

### 1.2 Agent System

OpenCode supports:
- **Primary agents** (Build, Plan) — main conversation handlers
- **Subagents** (General, Explore) — invoked via `@` mention
- **Custom agents** — defined in `opencode.json` or `.opencode/agents/*.md`
- **Skills** — reusable behavior in `.opencode/skills/*/SKILL.md` (available in OpenCode, but not part of the HDS canonical setup)

### 1.3 Tool: Skill

OpenCode provides a native `skill` tool that loads skills on-demand:
- Project: `.opencode/skills/<name>/SKILL.md`
- Global: `~/.config/opencode/skills/<name>/SKILL.md`
- Claude-compatible: `.claude/skills/<name>/SKILL.md`

For HDS, treat skills as optional examples only. The canonical HDS path is `AGENTS.md` + `opencode.json` + `.opencode/agents/hds.md`.

---

## 2. Current HDS Integration Evaluation

### 2.1 What Exists

| Component | Status | Location |
|-----------|--------|----------|
| AGENTS.md | Created | `/AGENTS.md` |
| Seed files | Exist | `docs/hds-llm-seed-ru.md`, `docs/hds-llm-seed-en.md` |
| Scaffold | Updated | `tools/generate-scaffold.sh` |
| OpenCode docs | Saved | `docs/opencode/` |

### 2.2 Current AGENTS.md Content

The current AGENTS.md contains:
- Quick start reference to seed files
- HDS workflow summary
- Change Gate requirements
- Verification commands
- Output format structure

### 2.3 Gap Analysis

| Gap | Severity | Impact |
|-----|----------|--------|
| Seed not in AGENTS.md directly | High | Agent may not load full seed context |
| No custom OpenCode agent defined | Medium | Can't invoke HDS-specific behavior |
| No skill defined for HDS workflow | Low | Acceptable: HDS uses agent path canonically |
| `/init` not optimized for HDS | Low | Agent discovers manually |

---

## 3. Seed Effectiveness Analysis

### 3.1 What Works Well

**Strengths:**
1. Self-contained — seed has all axioms, algebra, templates
2. Portable — works with any LLM/agent (not OpenCode-specific)
3. Structured — includes Change Gate, Migration Block, Failure loop
4. Output format — explicit 5-section structure

**Workflow alignment:**
- OpenCode workflow: Analysis → Plan → Execute → Verify
- HDS workflow: Surface → Proof → Code → Verify → Update
- These are compatible (Surface maps to Analysis/Plan)

### 3.2 Problems

**Problem 1: Context Loading**
- AGENTS.md references seed but doesn't embed it
- Agent must manually read seed files (not automatic)
- No `instructions` in `opencode.json` to reference seed

**Problem 2: No HDS-specific Agent**
- Can't invoke `@hds` to get HDS-compliant behavior
- No custom prompt to enforce HDS rules
- Agent might bypass Change Gate requirements

**Problem 3: No Skill for HDS**
- This is no longer a problem for the canonical setup
- Skills remain optional examples, not required HDS plumbing

**Problem 4: Verification Commands**
- AGENTS.md lists verification commands
- But they might not exist in all projects
- No fallback for projects without tools

### 3.3 Constraint Compatibility

| Constraint | OpenCode Support | Notes |
|------------|-----------------|-------|
| Change Gate format | ✅ Supported | Any format (text/YAML/JSON) |
| Surface → Proof → Code | ✅ Implicit | Agent can follow this sequence |
| One Change — One Intent | ⚠️ Requires enforcement | Must be in prompt |
| [FROZEN] rule | ⚠️ Requires enforcement | Must be in prompt |
| Output format (5 sections) | ⚠️ Requires enforcement | Must be in prompt |

---

## 4. Recommendations

### 4.1 Embed Seed in AGENTS.md

Option A: Full embedding (verbose, reliable)
```markdown
<!-- Embed full seed or key sections -->
```

Option B: Reference with instructions (cleaner)
```markdown
For HDS methodology, see: docs/hds-llm-seed-en.md
CRITICAL: Follow the Change Gate in every change request.
```

Option C: Use `opencode.json` instructions
```json
{
  "instructions": ["docs/hds-llm-seed-en.md"]
}
```

### 4.2 Define Custom HDS Agent

Create `.opencode/agents/hds.md`:
```markdown
---
description: HDS-compliant agent that enforces Surface→Proof→Code workflow
mode: subagent
prompt: You are an HDS agent. Always follow Surface→Proof→Code order...
tools:
  write: true
  edit: true
  bash: true
---
```

### 4.3 Create HDS Skill

Create `.opencode/skills/hds-workflow/SKILL.md` only as an optional example, not as canonical HDS plumbing:
```markdown
---
name: hds-workflow
description: Enforce HDS workflow (Surface→Proof→Code→Verify)
---
## Workflow
1. Read SURFACE.md or create one
2. Identify Change Gate requirements
3. If [FROZEN] touched: require Migration Block
4. Create Proof before code
5. Run verification
```

### 4.4 Update Scaffold

Add to scaffold:
```bash
# Add to opencode.json
echo '{"instructions": ["docs/hds-llm-seed-en.md"]}' > opencode.json

# Create HDS agent
mkdir -p .opencode/agents
# ... create hds.md
```

---

## 5. Proposed Implementation

### Option A: Minimal (Recommended)

Update `AGENTS.md` to include Change Gate + key rules inline, reference seed:

```markdown
# HDS Agent Rules

## Change Gate (required for every change)
- Intent: <one sentence>
- Pressure: Bug | Feature | Debt | Ops  
- Surface impact: (none) | touches: <item> [FROZEN/FLUID]
- Proof: tests/paths

## Workflow
Surface → Proof → Code → Verify → Update HOLO/Decisions

## Critical Rules
1. Surface First: External promises start in SURFACE.md
2. Frozen Requires Proof: Every [FROZEN] has tests
3. One Change — One Intent: One PR = one goal

For full methodology, see: docs/hds-llm-seed-en.md
```

### Option B: Full Integration

1. Add seed to `opencode.json` instructions
2. Create HDS subagent
3. Update scaffold to include canonical path only

---

## 6. Verification

Test integration by:
1. Create fresh project with scaffold
2. Run `opencode`
3. Ask: "Add a new feature"
4. Check if Change Gate appears in plan
5. Check if Proof is mentioned before code

---

## 7. Files Summary

| File | Purpose |
|------|---------|
| `AGENTS.md` | Main agent rules (updated) |
| `docs/hds-llm-seed-en.md` | Full seed (exists) |
| `tools/generate-scaffold.sh` | Scaffold (updated) |
| `docs/opencode/agents.md` | OpenCode agent docs |
| `docs/opencode/skills.md` | OpenCode skill docs (reference only; non-canonical for HDS) |
| `docs/opencode/rules.md` | OpenCode rules docs |
