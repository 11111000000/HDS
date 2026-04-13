# Changelog

- v1.5.0: HDS OpenCode integration - complete agent configuration for OpenCode/Claude Code. Added AGENTS.md with Change Gate and HDS workflow; opencode.json with seed instructions; .opencode/agents/hds.md for @hds agent invocation; docs/opencode/ with agent, skills, rules, and integration documentation. Updated generate-scaffold.sh to copy verification scripts (holo-verify.sh, surface-lint.sh, docs-link-check.sh) into new projects. Added install-opencode-configs.sh for local and global installation. Removed Skills from canonical HDS path (now reference-only).

- v1.4.0: HDS LLM Seed v1.4 - enhanced kernel and governance with stronger invariants, bootstrap workflow, and detailed change gate requirements.

- v1.3.3: Add English and Chinese translations for key docs: hds-spec, narrative-philosophy, overview, and hds-essentials (docs/*.en.md, docs/*.cn.md). Minor proofreading and link alignment across these files.

- v1.3.2: Align docs with format-agnostic policy; remove leftover “Org typed blocks only” mentions (README, llm-seed-guide). Add README.en.md and README.cn.md; polish headings and minor typos; clarify how to use the five-section response structure (Markdown by default) without format lock-in.

- v1.3.1: Drop Org typed blocks requirement (HDS is format-agnostic; Markdown by default). Updated RU/EN LLM Seeds, LLM guide, protocol, README/CONTRIBUTING/quickstart to use a five-section response structure (Questions/Plan/Answer/Verify/Commands) without format lock-in.

- v1.3.0: Strengthened HDS LLM Seed (RU/EN): strict Org typed blocks schema, mandatory Migration Block for Frozen changes, mandatory test↔surface header markers, baseline invariants, and Spec→Surface algorithm; updated README and llm-seed-guide; minor formatting and typo fixes across docs.

- v1.2.0: Refined HDS LLM Seed (RU/EN) with Org typed blocks I/O, Migration Block, baseline invariants, and Spec→Surface algorithm; added detailed usage guide; improved formatting across docs (especially README) for consistent Markdown headings and better readability.

- v1.1.0: Added HDS LLM Seed (RU/EN), usage guide, and updated docs (README, LLM protocol, Quickstart, Contributing) to integrate the seed.

- v1.0.0: Initial recursive HDS repository scaffold with specs, algebra, tools, tests, CI.

