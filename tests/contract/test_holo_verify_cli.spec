Spec: holo-verify.sh exits 0 when the repository is holographic:
- HOLO.md exists and lists >=5 invariants;
- SURFACE.md contains at least one [FROZEN] item with a valid non-empty Proof file;
- tests/scenario/* contains at least one non-empty scenario file.
