# HDS v1.0 — Compact Holographic Specification (Holographic Development, concise)

Purpose
HDS ensures that at any moment a project has a minimal “slice of the whole” (a hologram) and that changes are driven by facts, keeping public meaning stable without bureaucratic overhead.

Minimal Artifacts (the hologram)
- Manifest (HOLO.md): current stage; 5–15 invariants (constitution); key decisions with status and exit criteria; purpose in 1–3 sentences.
- Surface (SURFACE.md): registry of external contracts (API/data formats/schemas/events/CLI/ops promises) with stability per item: [FROZEN] or [FLUID].
- Contract Tests (tests/contract/*): proofs for Frozen behavior and canon (determinism, roundtrip, compatibility).
- Vertical Scenario (tests/scenario/*): at least one end-to-end path (mocks allowed) proving forms work together.

Light Algebra (types and meanings)
- Stability = Frozen | Fluid
- DecisionStatus = Draft | Frozen   (Probation allowed as a textual note in HOLO)
- Pressure = Bug | Feature | Debt | Ops
- Invariant = textual law (“what must not be broken”); bound to Surface/Core; severity optional
- Proof = tests protecting invariants/behavior (contract, scenario, property, lint)
- Hologram (property): HOLO + SURFACE + contract tests + 1 scenario exist and are consistent

Definition of a Holographic State
State is holographic if one can reconstruct from HOLO.md + SURFACE.md + tests what is public, what is Frozen, what laws govern the system, and how those laws are verified (CI-passable tests).

Stages (modes of maturity; minimal gates, no heavy workflow)
- Context: Surface draft and 5–15 invariants; decisions Draft.
- Skeleton: public forms (types/signatures/schemas) exist; build/lint pass; stubs allowed.
- Reality Check: a vertical scenario exists and passes; decisions “seat” on reality (optional Probation note).
- Canon: identity/versions/serialization canon; property/roundtrip tests; key decisions Frozen.
- Core: core meaning covered by golden/scenario; periphery cannot alter core semantics.
- Integrate/Ops: integrations, migrations, observability, security aligned with Surface.

Laws (axioms)
- A1 Surface First: if external meaning changes, edit Surface first, then code.
- A2 Frozen Requires Proof: every [FROZEN] item has verifiable tests (CI).
- A3 One Change, One Intent: each change/PR has one dominant goal.
- A4 Pressure for Frozen: Frozen changes require explicit Pressure (Bug/Feature/Debt/Ops).
- A5 Decisions Need Exit: Frozen decisions carry exit criteria; if compatibility is affected, migration semantics are stated.
- A6 Core/Periphery Boundary (strong recommendation): Core (meaning) does not depend on IO; IO lives in adapters.

Change Protocol (fits into PR description)
Intent: one sentence (one goal)
Pressure: Bug | Feature | Debt | Ops
Surface impact: (none) | touches: <Surface item(s)> [FROZEN/FLUID]
Proof: tests: <files or new tests>
If touches [FROZEN], add Migration/Compatibility note (Old→New, strategy, window/versioning).

LLM Role (normative)
LLM operates within HOLO/Surface/Tests: propose Surface change first (if needed), then tests, then code. Frozen cannot be changed without Pressure and Proof. LLM updates the hologram when meaning really changes.

Implementation Checklist (no bureaucracy)
- HOLO.md exists; ≥5 invariants; stage set; key decisions with exit criteria.
- SURFACE.md exists; ≥1 [FROZEN] item; Proofs link to real tests.
- tests/contract/* contain proofs for all Frozen items referenced.
- tests/scenario/* contains ≥1 vertical path.
- CI runs holo-verify + surface-lint; fails on violations.

Rationale (why this stays compact)
- Only four artifacts are mandatory; everything else is optional or tool-generated.
- Invariants keep intent explicit; tests keep behavior reproducible.
- Surface bounds public meaning; hologram guarantees “whole in small.”
- Stages guide maturity without process bloat.
