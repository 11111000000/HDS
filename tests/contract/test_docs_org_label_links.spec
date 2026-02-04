Spec: docs-link-check supports Org links with labels
Expectation:
- Links of the form [[path/to/file.md][Some label]] under docs/ are validated by tools/docs-link-check.sh.
- The checker ignores the label part and verifies the left path segment exists (relative to docs/ or repo root).
- http/mailto/anchor-only links are ignored.
Rationale: Prevent silent greens when using Org-style links with labels in Markdown/Org docs.
