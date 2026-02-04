Spec: HOLO Decisions (SSoT) enforce Exit
Expectation:
- tools/holo-verify.sh parses HOLO.md Decisions section.
- For every 'Status: Frozen' decision, an 'Exit:' line is present nearby (same block).
- If any Frozen decision lacks Exit, holo-verify fails with a descriptive message.
Rationale: A5 "Decisions Need Exit" must compile against the single source of truth (HOLO.md).
