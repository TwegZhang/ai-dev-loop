# OMX-Lite Operating Policy v1.0

> Team/project policy for using OMX inside a human-controlled iterative development process.

This policy implements the **OMX-Lite Profile** of AI Dev Loop. Its stable v1.0 path and operating rules remain unchanged. OMX Default is the upstream baseline/reference, not a runtime reimplemented by this policy.

## Position

OMX is an **Iteration Execution Coordinator**, not the owner of the full project lifecycle.

Human controls:

- product direction and V1 scope;
- architecture and important technical trade-offs;
- iteration boundaries and fidelity;
- release decisions.

OMX controls disciplined execution **inside the current approved iteration**.

## Artifact language

Generated iteration artifacts must be written in English. This includes Iteration Contracts, Iteration Results, and records in Deferred Engineering Memory.

Human interaction and Human-facing project explanations may use the Human's preferred language. Keep machine-facing workflow assets, commands, paths, identifiers, status names, and generated project artifacts in English.

## Six policy rules

### P1. Global throughput over local workflow completeness

Optimize useful project progress. Do not create work merely to make a task graph look complete.

### P2. Only hard implementation dependencies block

A dependency is blocking only when:

> Without A, B cannot meaningfully begin or produce a valid implementation outcome.

Preferred ordering, later platform validation, unavailable test devices, signing/notarization, manual QA, polish, and performance checks are not blocking unless the current iteration claim genuinely requires them.

### P3. Plan outcomes, not engineering micro-steps

Prefer a small number of independently meaningful outcome lanes.

Worker-internal actions such as linting, adding a test, preparing a mock, retrying a build, reading logs, or performing routine debugging normally stay inside the lane.

Default target: **3–7 outcome lanes per iteration** when parallelism is useful.

### P4. Defer safely, record honestly

When meaningful implementation can continue, non-critical unavailable work may be deferred.

Always distinguish:

```text
Implemented
Verified
Partially Verified
Not Verified
Deferred
Assumed
```

Never report unperformed validation as passed.

### P5. Human interruption is reserved for high-value decisions

Escalate only for:

1. architecture change;
2. public/shared contract change;
3. material scope change;
4. irreversible/high-cost decision;
5. evidence that invalidates the current iteration itself.

Routine implementation, reversible local choices, test failures, next-best verification, and safe deferral should normally be solved or recorded without Human interruption.

### P6. Stop at the iteration boundary

When the iteration exit criteria are met:

1. stop expanding scope;
2. produce the iteration result;
3. reconcile cross-iteration engineering memory;
4. surface Human decisions;
5. stop and return control to Human.

Do not automatically continue into later lifecycle stages.

## Completion semantics

Keep these separate:

```text
Iteration Complete
≠ Fully Verified
≠ Release Ready
```

"Complete" means the implementation outcome meets the **fidelity declared by the current Iteration Contract**.

## Deferred engineering memory

Use `engineering/deferred.md` (or the project-equivalent path) for unresolved items with future decision/validation value.

Categories:

```text
DV — Deferred Verification
TD — Technical Debt
EG — Environment Gap
KR — Known Risk
```

A deferred item is **engineering memory, not an automatically scheduled backlog**.

Each future iteration re-evaluates relevant items as:

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

## Engineering learning

Do not dump every discovery into `deferred.md`.

Route lasting information according to meaning:

```text
temporary iteration finding   → iteration result
lasting architecture fact     → ARCHITECTURE.md
important choice + rationale  → DECISIONS.md
future unresolved obligation  → engineering/deferred.md
```

## Default decision test

When unsure whether something should block current work, ask:

> Can useful implementation continue without creating unacceptable architecture or correctness risk?

If yes:

```text
continue + record the gap
```

If no:

```text
block or escalate
```

## One-line rule

> Move fast inside the current iteration, stay strict on architecture and truth, defer what is safely deferrable, preserve important engineering memory, and return control to Human at the iteration boundary.
