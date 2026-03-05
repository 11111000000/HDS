# HDS — Holographic Development Specification (recursive)

## What it is

Holographic Development (HDS) keeps a minimal “slice of the whole” at all times: a manifest of meaning (HOLO), a contract surface (SURFACE), Proof (tests), and one vertical scenario. This repository is the specification of HDS and a working demonstration: it is organized by HDS itself with Surface/Decisions/Proof/CI.

## Why

- Keep public meaning stable without bureaucracy.
- Drive changes by reproducible facts (tests/migrations), not narratives.
- Maintain speed via a two-speed loop: fast Fluid and slow Frozen/Core.

## Core artifacts (the hologram)

- HOLO.md — Manifest: Stage, 5–15 invariants (laws), key decisions with Exit criteria.
- SURFACE.md — Contract surface: public promises with stability tags [FROZEN]/[FLUID] and Proof links.
- tests/contract/* — Contract tests for Frozen (determinism, roundtrip, compatibility).
- tests/scenario/* — One vertical scenario (end-to-end or mocked).

## Specifications and documents

- Normative spec: docs/hds-spec.md
- Compact spec: docs/hdf-compact-spec.md
- Essentials: docs/hds-essentials.md
- Algebra (HGA): docs/hga-algebra.md and export docs/algebra/HDS-algebra.txt
- Proof policy: docs/proof-policy.md
- Stages & gates: docs/stages-and-gates.md
- Change protocol & LLM: docs/change-gate.md, docs/llm-protocol.md
- HDS LLM Seed (prompt): docs/hds-llm-seed-ru.md, docs/hds-llm-seed-en.md
- Seed guide: docs/llm-seed-guide.md
- Patterns/anti-patterns: docs/patterns-anti-patterns.md
- Glossary/FAQ: docs/glossary.md, docs/faq.md
- Overview/philosophy: docs/overview.md, docs/narrative-philosophy.md
- Roadmap: docs/roadmap.md

## Quickstart (5 steps)

1) Update HOLO.md: Stage, 5–15 invariants (laws), key decisions with Exit criteria.  
2) Describe SURFACE.md: contract items with [FROZEN]/[FLUID] and Proof links.  
3) Add Proof: contract tests for Frozen and one vertical scenario.  
4) Run checks: ./tools/hds.sh all  
   (or separately: ./tools/holo-verify.sh && ./tools/surface-lint.sh && ./tools/docs-link-check.sh)  
5) Open a PR with 4 lines: Intent, Pressure (Bug/Feature/Debt/Ops), Surface impact, Proof.

If you touch [FROZEN], add a Migration/Compatibility note (Old→New, strategy, deprecation window/versioning).

## Using the HDS LLM Seed

### Where:
  - RU: docs/hds-llm-seed-ru.md
  - EN: docs/hds-llm-seed-en.md
  - Full guide: docs/llm-seed-guide.md

### How to run (short):
  1) Put the Seed file (RU/EN) in the LLM context.
  2) Provide domain input (spec/user path).
  3) Expect five sections: Questions → Plan (with Change Gate) → Answer (patch/materialization) → Verify (report) → Commands (to run checks).
  4) Always follow: Surface → Tests (Proof) → Code → Verify → Update HOLO/Decisions.

### Output structure:
  - Five sections: Questions, Plan, Answer, Verify, Commands.
  - Every Plan contains the Change Gate (Intent/Pressure/Surface impact/Proof). If it touches [FROZEN], add a Migration Block (Impact/Strategy/Window-Version/Data/Backfill/Rollback/Tests Keep&Add).

## Tools and CI

- Checks: tools/holo-verify.sh, tools/surface-lint.sh, tools/docs-link-check.sh
- Wrapper: tools/hds.sh — single entrypoint (verify/lint/links/spec/all)
- CI: .github/workflows/ci.yml — runs all checks; fails on violations.
- Config: Proof reuse threshold via env HDS_PROOF_REUSE_MAX (see policies/compatibility.md).

## Examples

- Minimal CLI: examples/cli (SURFACE + contract and scenario tests)
- Minimal backend skeleton: examples/backend

## How to write a PR (Lite protocol)

- Intent: one sentence (one goal)  
- Pressure: Bug | Feature | Debt | Ops  
- Surface impact: touches SURFACE item(s) or none  
- Proof: which tests will prove the change

If you touch [FROZEN], add a Migration/Compatibility note (Old→New, strategy, window/versioning).

## License and contributions

- License: LICENSE (MIT)
- Contributing: CONTRIBUTING.md (follow Surface First and the 4-line PR protocol)
- Code of Conduct: CODE_OF_CONDUCT.md
