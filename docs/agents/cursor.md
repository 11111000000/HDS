# Cursor Analysis

## Typical Surfaces

- `.cursor/rules/*.md` for project rules.
- Rules can be referenced from config or loaded as files depending on the workspace setup.

## HDS Fit

Cursor is best treated as a rules-directory runtime: put the minimal adapter rule in `.cursor/rules/hds.md` and keep the real protocol elsewhere.

## Dialectical Risk

- Rules directories invite fragmentation if each rule file repeats the entire methodology.
- Multiple rule files can create conflicting instructions unless one file is the canonical pointer.

## HDS Recommendation

- Use one rule file for the HDS adapter.
- Point it to the shared loader.
- Keep any additional rules orthogonal and non-overlapping.
