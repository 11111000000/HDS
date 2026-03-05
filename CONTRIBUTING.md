# Contributing Guide (HDS)

- Read HOLO.md and SURFACE.md first.
- For any PR, include: Intent, Pressure, Surface impact, Proof.
- If touching [FROZEN], include Migration/Compatibility note.
- Run: tools/holo-verify.sh before pushing.
- If you use an LLM, include the HDS LLM Seed (docs/hds-llm-seed-ru.md or docs/hds-llm-seed-en.md) in the context and respond using Org typed blocks (question/plan/answer/commands/verify).
- Docs format: prefer Markdown (.md). Org (.org) is allowed as a source where needed; tools use md-first with org fallback (spec/algebra/link-check).

