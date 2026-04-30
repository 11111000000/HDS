Scenario: HDS agent plugin installer
Checks:
- a fresh directory can be provisioned with one installer command;
- the local install yields the complete adapter matrix plus loader and manifest;
- the generated adapters all point to the shared loader;
- the shared loader points to the canonical core and manifest.
