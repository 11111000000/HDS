Compatibility Policy

- [FROZEN] items maintain backward compatibility within major versions.
- Introduce v2 surfaces rather than silently changing v1 behavior.
- Proof reuse across [FROZEN] items is limited by default to <=2 references per Proof (configurable via env HDS_PROOF_REUSE_MAX).
