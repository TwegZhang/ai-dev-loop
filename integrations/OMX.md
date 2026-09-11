# OMX Integration

This document describes the **OMX-Lite Profile** implementation of AI Dev Loop using Oh My Codex (OMX).

## Positioning

AI Dev Loop's canonical methodology supports both the [Native Codex Profile](../profiles/native-codex/README.md) and [OMX-Lite Profile](../profiles/omx-lite/README.md). Both preserve Project → Iteration → Lane → Task → Inner Loop and Reality → Memory → Human Judgment → Contract. Use the [profile selector](../docs/06-Choosing-an-Execution-Profile.md) to compare execution needs.

**OMX-Lite** is bounded AI Dev Loop usage of OMX through policy, contracts, and the iteration skill. **OMX Default** is the upstream strict baseline/reference, not another implementation maintained here. Depending on the selected upstream mode, its strengths can include persistent coordination, structured execution, and explicit verification gates; those mechanisms can also add setup, state management, and coordination overhead. Check the installed mode's actual behavior rather than assuming every OMX workflow has the same rigidity or autonomy.

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

The existing installer accepts `omx|codex` as **host/discovery choices for the same OMX-Lite assets**. `omx` installs the skill under `.codex/skills/iteration/`; `codex` installs it under `.agents/skills/iteration/` for plain Codex. The `codex` argument does not select the Native Codex Profile. Policy, templates, and project artifact paths stay the same.

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
