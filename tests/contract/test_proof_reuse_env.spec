Spec: Proof reuse threshold is configurable via environment
Expectation:
- tools/holo-verify.sh reads HDS_PROOF_REUSE_MAX (default 2).
- If a single Proof path is referenced by more than HDS_PROOF_REUSE_MAX [FROZEN] items, verification fails.
- Increasing HDS_PROOF_REUSE_MAX allows legitimate shared proofs without code changes.
Rationale: Align tool behavior with policies/compatibility.md and enable explicit reuse policy control.
