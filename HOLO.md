# HOLO — Holographic Manifest (for HDS repository)

Stage: Canon

Purpose:
A specification repository describing HDS (Holographic Development): algebra, laws, methodology, and tools. It demonstrates holography by example (the repo is organized holographically).

Invariants (Constitution):
1) Surface First: any external promise is recorded and versioned in SURFACE.md before code changes.
2) Frozen Requires Proof: every [FROZEN] surface item has contract tests (Proof).
3) One Change — One Intent: each change has one dominant goal and its verification.
4) Core/Periphery: meaning (algebra/laws) is separated from tools/IO.
5) Freeze by Maturity: decisions/surface are frozen only after a Reality Check.
6) Refutation/Pressure: Frozen changes only under Pressure (Bug/Feature/Debt/Ops) with a test.
7) Bureaucracy Must Compile: all checks are automated by scripts/CI; no manual rituals.

Decisions (key choices):
- D-001 HDS File Surface Format
  Status: Frozen
  Choice: SURFACE.md — a flat Markdown registry ([FROZEN]/[FLUID] + Proof links).
  Exit: a format change is allowed only if a migrator exists and compatibility is preserved.
  Proof: tests/contract/test_surface_links.spec

- D-002 Evidence Form
  Status: Frozen
  Choice: Normative Evidence — tests (contract/scenario/property); invariants are textual laws.
  Exit: Evidence may be extended when reproducible metrics appear.
  Proof: tests/scenario/test_vertical_minimum.spec

Reality Check (vertical scenario):
tests/scenario/test_vertical_minimum.spec — verifies: (a) a [FROZEN] SurfaceItem exists, (b) a corresponding contract test exists, (c) holo-verify passes.

Operational notes:
Method compatibility: minor versions are additive without breaking laws; major versions may change axioms with migration of artifacts (docs/templates/tools).
Note: Canon here = canon of methodology (process/tools/contracts), proven by tests and tools within this repository.
