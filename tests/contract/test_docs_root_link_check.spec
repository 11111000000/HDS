Spec: docs-link-check covers root Markdown files (README.md, HOLO.md, SURFACE.md, CONTRIBUTING.md)
Expectation:
- tools/docs-link-check.sh scans both docs/* and selected root files for Markdown and Org-style links.
- Valid local links in README.md/HOLO.md/SURFACE.md/CONTRIBUTING.md resolve; broken ones fail the check.
Rationale: Prevent “silent greens” for top-level documentation.
