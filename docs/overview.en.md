# HDS Overview — The whole in the small (practical introduction)

## Problem
Modern development, especially with LLMs, has sped up but lost form: public meaning drifts, tests don’t capture intent, patches go wide. HDS (Holographic Development Specification) offers a simple frame where “the whole is visible in the part”: at any moment there is a minimal project hologram — manifest, surface, proofs, and one vertical scenario.

## Key concepts
Hologram — a minimal slice from which you can reconstruct the whole: HOLO.md (ethics and laws), SURFACE.md (boundaries and promises), Proof (tests), and one vertical scenario (viability).  
Contract Surface — registry of external promises (API, formats, schemas, events, CLI, ops). Each item is tagged by stability: [FROZEN] — compatibility canon; [FLUID] — exploration zone. Frozen changes only under Pressure (fact) and with Proof (tests).  
Core/Periphery — meaning (Core) is IO‑agnostic; periphery are adapters/integrations. This yields antifragility: the world may change, the core remains.  
Decisions — key choices with Exit criteria. Not dogma, but a pact revisited by facts.

## Two‑speed loop
Fluid — fast changes without breaking Frozen. Frozen/Core — slow changes under Pressure with tests and migrations. This preserves both speed and identity.

## How this becomes practice
- Manifest (HOLO.md): one living file — current stage, 5–15 invariants, key decisions (with Exit), RealityCheck scenario.
- Surface (SURFACE.md): short registry of contracts with stability markers and Proof links.
- Tests — contract for Frozen (determinism, round‑trip, compatibility) and at least one vertical scenario (e2e or mocked).
- PR protocol — four lines: Intent, Pressure, Surface impact, Proof. If Frozen is touched — migration/compatibility note.

## Stages (maturity, no rituals)
Context → Skeleton → RealityCheck → Canon → Core → Integrate → Ops. The stage is recorded in HOLO.md and sets what counts as a “sufficient hologram” now.

## Links
- Normative spec: docs/hds-spec.en.md
- Compact spec (RU): docs/hdf-compact-spec.md
- Algebra (formal model, RU): docs/hga-algebra.md
- Essentials (EN): docs/hds-essentials.en.md
- Quickstart (RU): docs/quickstart-5min.md
