# HDS Proof Quality

Purpose: define the minimum quality bar for Proof used by agents and maintainers.

## Principle

Proof is not evidence that a file exists. Proof is evidence that a public promise fails when the promise is broken.

## Minimum Bar

- A Proof references a reproducible command, test file, or CI job.
- A Proof is tied to a Surface item or invariant.
- A Proof would fail if the promised behavior, format, or compatibility rule is violated.
- A Proof does not silently weaken or delete an existing [FROZEN] guarantee.
- A Proof for [FROZEN] changes is paired with Pressure and a Migration block.

## Good Patterns

- Contract test for CLI output, exit code, and failure mode.
- Roundtrip/property test for stable payload formats.
- Scenario test for one vertical user path.
- Link or schema check for documentation contracts.

## Weak Patterns

- Checking only that a file exists.
- Checking only that a string appears in documentation.
- Updating tests to match changed behavior without explaining Pressure.
- Using a broad smoke test as the only Proof for a [FROZEN] contract.

## Agent Rule

When an agent proposes or edits Proof, it must be able to state which public promise would be broken if the Proof failed.
