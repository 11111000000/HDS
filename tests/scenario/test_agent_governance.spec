Scenario: Agent governance flow for the next HDS version
Checks:
- an agent change is represented as a Change Gate with one explicit intent;
- non-public changes may use Surface impact: (none) and lightweight Proof;
- [FROZEN] Surface changes require Pressure, Proof, and a Migration block;
- tools/change-gate-lint.sh is the executable gate for these message-level checks.
