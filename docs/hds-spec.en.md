# HDS v1.0 — Compact Holographic Specification (normative)

1) Purpose
HDS fixes minimal laws and artifacts so a project always has a “slice of the whole” (a hologram), and changes are driven by verifiable facts without blurring public meaning.

2) Minimal artifacts (the core)
- Manifest: HOLO.md — current Stage, 5–15 invariants, key decisions (with exit criteria).
- Surface: SURFACE.md — registry of external contracts (API/formats/schemas/CLI/events/ops), each item tagged [FROZEN]/[FLUID] with Proof links.
- Contract tests: tests/contract/* — protect Frozen behavior/canon (round-trip, determinism, compatibility).
- Vertical scenario: tests/scenario/* — at least one end-to-end path proving viability.

3) Entities (light algebra)
- Stability = Frozen | Fluid (Stable may appear as a textual note)
- DecisionStatus = Draft | Frozen (Probation allowed as a note in HOLO.md)
- Pressure = Bug | Feature | Debt | Ops (legitimate reasons for change)
- Invariant — textual law (“what must not be broken”), tied to Surface/Core
- Proof — test(s) confirming an invariant or contract

4) Definition of a Hologram (Holo-State)
The state is holographic if from HOLO.md + SURFACE.md + contract tests + a vertical scenario one can reconstruct boundaries (what is public), laws (invariants/decisions), and their verification (CI-passable tests).

5) Stages (maturity modes)
- Context — draft Surface and invariants; decisions Draft.
- Skeleton — forms (types/signatures/schemas) exist; build passes; stubs allowed.
- RealityCheck — one vertical scenario; decisions “seat on reality.”
- Canon — identity/version/serialization canon (property/round‑trip tests); some decisions Frozen.
- Core — core meaning covered by golden/scenario; periphery does not alter the core.
- Integrate — integrations/adapters; core meaning preserved.
- Ops — migrations/observability/security aligned with Surface.

6) Laws (axioms)
- A1 Surface First — external meaning changes are first recorded in SURFACE.md, then implemented.
- A2 Frozen Requires Proof — any [FROZEN] has verifiable Proof (contract tests).
- A3 One Change — One Intent — each change carries one dominant goal.
- A4 Pressure Required for Frozen — Frozen changes require Bug/Feature/Debt/Ops with explicit Proof and (if needed) migration.
- A5 Decisions Need Exit — a Frozen decision in HOLO.md contains exit criteria; compatibility/migration are described.
- A6 Core/Periphery Boundary — Core is IO-agnostic; periphery must not change core meaning (strong recommendation).

7) Change protocol (PR format — 4 lines)
Intent: one sentence (one goal)
Pressure: Bug | Feature | Debt | Ops
Surface impact: (none) | touches: <SurfaceItem(s)> [FROZEN/FLUID]
Proof: tests: <files or new tests>
If [FROZEN] is touched, add a Migration/Compatibility note (Old→New, strategy, window/versioning).

8) Role of LLM and CI
- LLM operates within Surface/HOLO/Tests: edit SURFACE.md first (if needed), then tests, then code. [FROZEN] changes without Pressure/Proof are invalid.
- CI enforces the hologram: holo-verify (HOLO/SURFACE/tests alignment), surface-lint (syntax/format), contract + scenario tests.

9) Adoption criterion
HDS is considered adopted if: HOLO/SURFACE are maintained; ≥1 [FROZEN] with Proof; ≥1 vertical scenario; changes follow the 4-line PR; CI fails on hologram law violations.

Links
- Normative spec (RU source): docs/hds-spec.md
- Compact spec: docs/hdf-compact-spec.md
- LLM protocol: docs/llm-protocol.md
- Proof policy: docs/proof-policy.md
- Stages & gates: docs/stages-and-gates.md
