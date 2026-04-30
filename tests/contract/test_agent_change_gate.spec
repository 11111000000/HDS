Spec: change-gate-lint.sh validates the Change Gate shape for agent-authored changes.
Checks:
- requires Intent:, Pressure:, Surface impact:, and Proof: fields;
- accepts only Pressure values: Bug, Feature, Debt, Ops;
- requires Surface impact to be either (none) or touches: <SurfaceItem> [FROZEN|FLUID];
- requires Proof to reference tests or tools;
- requires a Migration block when Surface impact touches [FROZEN].
