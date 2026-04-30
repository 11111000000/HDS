Spec: tools/agent-plugin-lint.sh exits 0 when the v2 agent plugin graph is consistent.
Checks:
- loader, manifest, and adapter files exist;
- adapters point to the same loader;
- loader points to the canonical core and manifest;
- manifest version is `2` and lists the adapter entrypoints.
