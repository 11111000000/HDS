Spec: Algebra export drift detection
Expectation:
- tools/algebra-sync.sh exports docs/hga-algebra.md (md-first, org fallback) to docs/algebra/HDS-algebra.txt.
- CI fails if the exported artifact differs from the source until sync is re-run and committed.
Rationale: Keep formal algebra export in sync; prevent stale artifacts.
