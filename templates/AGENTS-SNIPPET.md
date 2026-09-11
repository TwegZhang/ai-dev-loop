# AI Development Workflow — OMX-Lite Profile

Use this snippet when adopting the AI Dev Loop OMX-Lite Profile, whether hosted by OMX or plain Codex. It configures OMX-Lite iteration behavior; it does not select the Native Codex Profile.

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
