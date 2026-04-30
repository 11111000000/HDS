# SURFACE — Contract Surface for HDS repository

## Tooling (CLI promises)

- [FROZEN] holo-verify CLI (tools/holo-verify.sh)
  Proof: tests/contract/test_holo_verify_cli.spec

- [FLUID] surface-lint CLI (tools/surface-lint.sh)
  Proof: tests/contract/test_surface_lint_cli.spec

- [FLUID] docs-link-check CLI (tools/docs-link-check.sh)
  Proof: tests/contract/test_docs_link_check_cli.spec

- [FLUID] hds wrapper CLI (tools/hds.sh)
  Proof: tests/contract/test_hds_wrapper_cli.spec

- [FLUID] Agent Governance Guidance (Agent-Change-Gate)
  Spec: guidelines and programmatic validators for agent interactions with Change Gate and SURFACE. Includes: Intent specificity rules, Surface-diff validation, Proof-quality criteria, and examples for agents.
  Proof: tests/contract/test_agent_change_gate.spec, tests/scenario/test_agent_governance.spec

- [FLUID] change-gate-lint CLI (tools/change-gate-lint.sh)
  Proof: tests/contract/test_agent_change_gate.spec

- [FROZEN] HDS agent two-cycle protocol (docs/hds-agent-plugin.md)
  Proof: tests/contract/test_agent_two_cycle.spec

- [FLUID] HDS agent plugin loader v2 (docs/hds-agent-loader.md)
  Proof: tests/contract/test_agent_loader_v2.spec, tests/scenario/test_agent_plugin_matrix_v2.spec

- [FLUID] HDS agent plugin manifest v2 (.hds/agent-plugin.json)
  Proof: tests/contract/test_agent_plugin_manifest_v2.spec, tests/scenario/test_agent_plugin_matrix_v2.spec

- [FLUID] agent-plugin-lint CLI (tools/agent-plugin-lint.sh)
  Proof: tests/contract/test_agent_plugin_lint_cli.spec

- [FLUID] HDS agent installer CLI (tools/install-agent-plugin.sh)
  Proof: tests/contract/test_agent_plugin_installer_cli.spec, tests/scenario/test_agent_plugin_installer.spec

- [FLUID] OpenCode HDS adapter (.opencode/agents/hds.md)
  Proof: tests/scenario/test_agent_plugin_matrix_v2.spec

- [FLUID] Claude Code HDS adapter (CLAUDE.md)
  Proof: tests/scenario/test_agent_plugin_matrix_v2.spec

- [FLUID] Cursor HDS adapter (.cursor/rules/hds.md)
  Proof: tests/scenario/test_agent_plugin_matrix_v2.spec

- [FLUID] Codex HDS adapter (CODEX.md)
  Proof: tests/scenario/test_agent_plugin_matrix_v2.spec

- [FLUID] Runtime analysis docs (docs/agents/)
  Proof: tests/contract/test_agents_docs_rename.spec
