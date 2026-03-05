# HDS Essentials — the essence of holographic development (normative, concise)

## What is HDS
Holographic development keeps “the whole in the small”: at any time the project has a minimal slice (a hologram) from which one can recover public meaning, laws, and how they are verified. The hologram is not bureaucracy but a reality map: Manifest (HOLO), Contract Surface, Proof (tests), one vertical scenario.

## Key notions
- HOLO (Manifest): one living file (HOLO.md) — current stage, 5–15 invariants (laws), key decisions with Exit criteria. If code contradicts HOLO — it’s a bug in code; if HOLO is stale — the project loses shape.
- Contract Surface (SURFACE.md): external contract (API/forms/schemas/CLI/events/ops). Each item is tagged: [FROZEN] — canon; changes only via Pressure+Proof+migration; [FLUID] — experimentation zone, must not break Frozen.
- Invariants & Proof: invariants are laws (“what must not be broken”); Proof — tests (contract/scenario/property/lint) that make laws verifiable in CI. The law is intent; the test is a reproducible fact.
- Core/Periphery: core meaning is IO‑agnostic; periphery are adapters/integrations. This yields antifragility: the world changes, the core stays.
- Two‑Speed: fast loop (Fluid/Periphery) and slow loop (Frozen/Core/Stable). Speed without drift.

## Stages (maturity modes, no heavy process)
- Context: draft Surface and invariants; decisions Draft.
- Skeleton: forms (types/signatures/schemas) exist; build passes.
- Reality Check: one vertical scenario (mocks allowed).
- Canon: identity/version/serialization canon; property/round‑trip; some decisions Frozen.
- Core: core meaning covered by golden/scenario; periphery cannot change core semantics.
- Integrate/Ops: integrations/migrations/observability/security aligned with Surface.

## Four HDS axioms
- Surface First: external meaning changes → edit SURFACE.md first, then code.
- Frozen Requires Proof: every [FROZEN] has verifiable tests (in CI).
- One Change, One Intent: one change — one goal.
- Pressure for Frozen: Frozen changes only under Bug/Feature/Debt/Ops with explicit Proof and, if needed, migration.

## Change protocol (fits a PR)
Intent — one sentence; Pressure — Bug/Feature/Debt/Ops; Surface impact — which SURFACE items and their stability; Proof — which tests will confirm. If [FROZEN] is touched, add Migration/Compatibility note.

## LLM role
LLM acts within the hologram: reads HOLO.md and SURFACE.md, changes Surface first (if meaning changes), then adds/edits tests, then code. Forbidden to change Frozen without Pressure and Proof. Recommended order: Intent → Pressure → Surface impact → Proof.

## Hologram criterion (Holo)
The repo state is holographic if: HOLO.md exists and has ≥5 invariants; SURFACE.md exists and has ≥1 [FROZEN] with valid Proof; there is ≥1 vertical scenario (tests/scenario/*); verification tools pass (tools/holo-verify.sh). See docs/hds-spec.en.md and docs/hdf-compact-spec.md for details; start with docs/quickstart-5min.md.
