Spec: tools/hds.sh (HDS wrapper) consolidates verify/lint/links/spec/gate checks
Expectation:
- Running 'bash tools/hds.sh all' executes holo-verify, surface-lint, docs-link-check, spec-version-check in sequence and exits 0 on success.
- Subcommands map 1:1:
  * verify -> tools/holo-verify.sh
  * lint   -> tools/surface-lint.sh
  * links  -> tools/docs-link-check.sh
  * spec   -> tools/spec-version-check.sh
  * gate   -> tools/change-gate-lint.sh
- agent-plugin-lint is available as a standalone tool for the v2 plugin graph.
- The wrapper does not introduce side effects beyond those tools.
Rationale: Reduce cognitive load; single entrypoint mirrors CI gates.
