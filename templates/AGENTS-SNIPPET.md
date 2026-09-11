# AI Development Workflow

Before planning or executing an iteration, read:

- `policy/OMX-LITE-POLICY.md` (or the project copy)
- `ARCHITECTURE.md`
- relevant specs
- the active `iterations/iteration-XX.md`

When using the `$iteration` skill, also use previous iteration results and `engineering/deferred.md` as cross-iteration engineering memory.

Core rules:

- Human owns project direction and iteration boundaries.
- Only hard implementation dependencies block.
- Prefer outcome lanes over micro-tasks.
- Safe non-critical validation may be deferred and recorded.
- Generated iteration artifacts must be written in English.
- Iteration complete does not mean release ready.
- Stop and return control to Human at the iteration boundary.
