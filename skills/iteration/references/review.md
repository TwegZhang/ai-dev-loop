# Review — iteration contract quality gate

Use for `$iteration review [id|path]`.

Return `APPROVED` or `REVISE`.

Review only the smallest set of high-value issues.

Check:

1. **Over-orchestration** — too many lanes; worker micro-steps promoted to orchestration tasks.
2. **Fake dependencies** — preferred order or later validation modeled as hard blockers.
3. **Fidelity confusion** — declared fidelity and required evidence belong to different lifecycle stages.
4. **Missing Human boundary** — architecture/contract decisions silently delegated; no explicit stop boundary.
5. **Memory loss** — relevant prior deferred items ignored; important promoted/continue-deferred decisions not visible.
6. **Weak exit criteria** — vague "high quality/robust/complete" claims without observable evidence.
7. **Throughput failure** — non-critical environment setup or validation becomes the critical path unnecessarily.

For `REVISE`, give the smallest correction set.

Do not rewrite an approved Human contract unless asked.
