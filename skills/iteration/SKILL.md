---
name: iteration
description: Plan, inspect, review, or close one human-controlled software-development iteration using current repository reality, previous iteration results, deferred engineering memory, and human priority decisions. Use for the next development pass, carry-over triage, iteration status, iteration-plan review, or iteration close/handoff.
argument-hint: "[start|status|review|close] [goal, iteration-id, or path]"
---

# Iteration

Manage **one bounded development pass** inside a larger human-led project.

This is the **OMX-Lite Profile** iteration skill, discoverable through either an OMX or plain Codex host. Installing it for the `codex` host does not select the Native Codex Profile; its modes and iteration-boundary behavior are the same on both hosts.

This skill is a Human judgment interface and iteration boundary manager. It is **not** a replacement for OMX planning/execution runtimes.

```text
Reality + Memory
      ↓
Human Judgment
      ↓
Iteration Contract
      ↓
OMX/Codex Execution
      ↓
Result + Updated Memory
      ↓
STOP → Human
```

## Six invariants

1. **Reality first** — plan from current code/evidence and Human observations, not an old task graph.
2. **Memory without backlog gravity** — remember previous debt/gaps, but never auto-schedule them.
3. **Human owns the iteration** — AI recommends; Human decides goal, fidelity, priority, scope, and key trade-offs.
4. **Outcomes, not micro-tasks** — prefer a small number of meaningful lanes.
5. **Defer safely, record honestly** — non-blocking gaps may be deferred; evidence claims must remain truthful.
6. **Stop at the boundary** — close the pass and return control instead of drifting into later lifecycle work.

## Modes

| Invocation | Purpose | Read |
|---|---|---|
| `$iteration` / `start` | Create the next iteration through four views | `references/start.md`, `references/memory.md` |
| `status` | Read-only current iteration summary | `references/status.md` |
| `review` | Detect over-orchestration / policy violations in a draft or current iteration | `references/review.md`, `references/memory.md` |
| `close` | Persist evidence-backed result and reconcile engineering memory | `references/close.md`, `references/memory.md` |

Read only the reference files needed for the selected mode.

## Policy source

If a project copy of `OMX-LITE-POLICY.md` exists (for example `policy/OMX-LITE-POLICY.md` or repo-root `OMX-LITE-POLICY.md`), read and follow it.

Do not duplicate the full policy into generated artifacts.

## Artifact language

Generated iteration artifacts must be written in English. Human interaction may use another language, but Iteration Contracts, Iteration Results, Deferred Engineering Memory, commands, paths, identifiers, status names, and template fields remain English.

## Preferred project inputs

Use when present:

1. applicable `AGENTS.md`;
2. OMX-Lite policy;
3. `ARCHITECTURE.md` / `DECISIONS.md`;
4. relevant specs;
5. current/latest iteration contract;
6. latest relevant iteration result;
7. `engineering/deferred.md`;
8. relevant source/tests/Git evidence;
9. **current Human observations from real runs**.

Do not ask Human for facts recoverable from these sources.

## Human gates

Interrupt Human only for:

- architecture change;
- public/shared contract change;
- material scope change;
- irreversible/high-cost decision;
- evidence invalidating the iteration itself.

Routine debugging, local reversible choices, test failures, next-best verification, and safe deferral should normally be handled without Human interruption.

## Dependency rule

Only hard implementation dependencies block:

> Without A, B cannot meaningfully begin or produce a valid implementation outcome.

Later validation, unavailable platform/device environments, preferred order, polish, and manual QA do not block unless the current fidelity/claim requires them.

## Completion rule

Keep separate:

```text
Iteration Complete
≠ Fully Verified
≠ Release Ready
```

Never claim unperformed validation passed.

## Execution handoff

After `start`, recommend the lightest appropriate execution surface:

- one bounded task/lane → solo Codex/OMX;
- implementation decomposition still unclear → `$plan`;
- one durable execution spine → `$ultragoal`;
- multiple truly parallel lanes with real coordination value → `$team`.

Do not use `$team` merely because the project is large.

Do not automatically execute after `start` unless Human asks.

Do not automatically start the next iteration after `close`.

## Canonical artifacts

Prefer:

```text
iterations/iteration-XX.md
iterations/iteration-XX-result.md
engineering/deferred.md
```

If `templates/ITERATION-TEMPLATE.md` exists, use it as the iteration contract schema.

If `templates/ITERATION-RESULT-TEMPLATE.md` exists, use it as the close-result schema.

If `templates/DEFERRED-LEDGER-TEMPLATE.md` exists, use its record schema.

## Final rule

> Reality and engineering memory inform Human judgment. Human defines the iteration. OMX executes inside that boundary. Execution creates new reality and memory. The next iteration is replanned from that evidence, never mechanically inherited from the previous task graph.

Task: {{ARGUMENTS}}
