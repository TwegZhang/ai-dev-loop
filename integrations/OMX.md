# OMX Integration

AI Dev Loop currently has first-class usage guidance for Oh My Codex (OMX).

## Positioning

AI Dev Loop does **not** treat OMX as the owner of the whole project lifecycle.

OMX is used as:

> **Iteration Execution Coordinator**

Human defines:

```text
Project direction
Architecture
Iteration goal
Fidelity
Scope
Stop boundary
```

OMX/Codex executes inside that boundary.

## Recommended surfaces

Use the lightest tool that fits the current iteration:

| Situation | Suggested OMX/Codex mode |
|---|---|
| One clear bounded task/lane | solo |
| Implementation decomposition still needed | `$plan` |
| One durable long-running execution spine | `$ultragoal` |
| Multiple truly parallel lanes with meaningful coordination value | `$team` |

Do not choose `$team` merely because the overall project is large.

## Project-level policy

Copy:

```text
policy/OMX-LITE-POLICY.md
```

into the target project (recommended under `policy/` or repo root), and reference it from `AGENTS.md`.

## `$iteration` skill

Canonical source:

```text
skills/iteration/
```

For OMX project-scoped usage, copy it to the active OMX project skill directory described by your OMX setup.

Current project guidance in this repository uses:

```text
.codex/skills/iteration/
```

See `docs/05-Project-Setup.md` for host/path notes.

## Why the policy exists

OMX tends toward disciplined orchestration. AI Dev Loop constrains that strength to a bounded development pass:

- only hard dependencies block;
- verification may be deferred when the current fidelity allows it;
- micro-steps stay inside worker loops;
- unresolved work becomes engineering memory rather than mandatory immediate tasks;
- OMX stops at the iteration boundary.

## When to consider changing OMX itself

Do not fork OMX merely because its default workflow is more rigid than desired.

First try:

```text
Policy
+
Iteration Contract
+
$iteration skill
```

Consider OMX core changes only after repeated real-project evidence shows a hard runtime/state-machine behavior that cannot be expressed or avoided at the usage layer.
