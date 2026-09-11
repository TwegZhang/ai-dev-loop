# AI Dev Loop

[&#31616;&#20307;&#20013;&#25991;](README.zh-CN.md)

> **Human-led, iterative, parallel software development with AI coding agents.**

AI Dev Loop is a lightweight development methodology for real software projects using Coding Agents. **Methodology > Tooling**: execution profiles apply the same Human-controlled lifecycle.

```text
               AI DEV LOOP
          Canonical Methodology
                  │
        ┌─────────┴─────────┐
        ▼                   ▼
 Native Codex Profile   OMX-Lite Profile
      lightweight          structured

             OMX Default
          upstream baseline
```

Start with [Choosing an Execution Profile](docs/06-Choosing-an-Execution-Profile.md), then use the sibling [Native Codex Profile](profiles/native-codex/README.md) or [OMX-Lite Profile](profiles/omx-lite/README.md).

It is designed for teams that want to:

- keep product and architecture decisions human-led;
- use AI Coding Agents for high-throughput implementation;
- parallelize work without turning the project into an over-orchestrated task machine;
- defer non-blocking validation and technical debt without losing track of it;
- repeatedly turn working software into new evidence for the next development pass.

It is **not** an Agent framework, a replacement for Git, a new Scrum methodology, or an OMX fork.

---

## The core loop

```text
Human Architecture / Product Direction
                ↓
        Human-controlled Iteration
                ↓
     Reality → Memory → Judgment → Contract
                ↓
       Selected Profile Execution
                ↓
        Working Software + Evidence
                ↓
   Iteration Result + Engineering Memory
                ↓
               STOP
                ↓
       Human Observe / Replan
                ↓
          Next Iteration
```

Two distinctions are fundamental:

```text
Iteration Complete ≠ Fully Verified ≠ Release Ready
Remembered ≠ Scheduled Now
```

---

## Why this exists

AI Coding is very good at implementing bounded work quickly. It is less good at deciding:

- what the project should optimize for;
- which trade-offs matter long term;
- whether a missing environment should block development;
- whether old unfinished work still deserves attention;
- when one development pass should stop and a human should re-evaluate reality.

AI Dev Loop gives those decisions an explicit place.

The result is a development model where:

> **Human judgment controls direction and iteration boundaries; AI execution fills the space inside those boundaries.**

---

## Five levels

```text
Project → Iteration → Lane → Task → Inner Loop
```

| Level | Primary owner | Purpose |
|---|---|---|
| Project | Human | Product, architecture, V1, release |
| Iteration | Human | Goal, fidelity, priority, stop boundary |
| Lane | Human + planner | Parallelizable engineering outcome |
| Task | AI | Bounded engineering result |
| Inner Loop | AI | Implement → test → fix → verify |

---

## Four views for starting an iteration

```text
Reality
  ↓
Memory
  ↓
Human Judgment
  ↓
Iteration Contract
```

### Reality
What is actually true now?

### Memory
What did previous iterations discover, defer, or leave unresolved?

### Human Judgment
Given reality and memory, what is worth doing now?

### Contract
What bounded development pass should the Coding Agents execute?

---

## Quick start

### 1. Select an execution profile

Read [Choosing an Execution Profile](docs/06-Choosing-an-Execution-Profile.md) and [Project Setup](docs/05-Project-Setup.md).

For [Native Codex](profiles/native-codex/README.md), start from its Execution Plan and Goal templates:

```text
Execution Plan → Human-approved Phase ≈ Iteration → bounded Goals
→ worktrees / native subagents when useful → integration + evidence
→ result + deferred memory → STOP → Human review
```

Native does not require the `$iteration` skill or OMX runtime. For [OMX-Lite](profiles/omx-lite/README.md), install the policy, templates, and skill with the helper:

```bash
./scripts/install-into-project.sh /path/to/your/project omx
```

Supported install targets:

```text
omx   → .codex/skills/iteration/
codex → .agents/skills/iteration/
```

Both arguments install OMX-Lite assets. `codex` selects a plain Codex host and skill discovery path; it does **not** select the Native Codex Profile. The script also copies the policy and templates.

### 2. Start one OMX-Lite iteration

Inside your target project:

```text
$iteration
```

The skill reads current repository reality, previous iteration results, deferred engineering memory, and current Human observations.

It recommends the next bounded pass and asks only for high-value Human decisions.

### 3. Execute OMX-Lite with the lightest tool that fits

Typical options:

```text
solo
$plan
$ultragoal
$team
```

### 4. Close the OMX-Lite iteration

```text
$iteration close
```

This creates:

```text
iterations/iteration-XX-result.md
engineering/deferred.md
```

Then stop, run the software, observe reality, and decide the next iteration.

---

## Repository map

```text
.
├── README.md
├── README.zh-CN.md
├── LICENSE
├── CONTRIBUTING.md
├── CHANGELOG.md
├── ROADMAP.md
├── HANDOFF.md
├── VERSION
│
├── docs/
│   ├── 01-Research-Report.md
│   ├── 01-Research-Report.zh-CN.md
│   ├── 02-Team-Playbook.md
│   ├── 02-Team-Playbook.zh-CN.md
│   ├── 03-Project-Development-Guide.md
│   ├── 03-Project-Development-Guide.zh-CN.md
│   ├── 04-15min-SOP.md
│   ├── 04-15min-SOP.zh-CN.md
│   ├── 05-Project-Setup.md
│   ├── 05-Project-Setup.zh-CN.md
│   ├── 06-Choosing-an-Execution-Profile.md
│   └── 06-Choosing-an-Execution-Profile.zh-CN.md
│
├── profiles/
│   ├── native-codex/  # Profile, Execution Plan / Goal templates, example
│   └── omx-lite/      # Profile and existing asset entry points
│
├── policy/
│   └── OMX-LITE-POLICY.md
│
├── templates/
│   ├── ITERATION-TEMPLATE.md
│   ├── ITERATION-RESULT-TEMPLATE.md
│   ├── DEFERRED-LEDGER-TEMPLATE.md
│   └── AGENTS-SNIPPET.md
│
├── skills/
│   └── iteration/
│       ├── SKILL.md
│       └── references/
│
├── integrations/
│   └── OMX.md
│
├── examples/
│   ├── README.md
│   └── cross-platform-v1/
│
└── scripts/
    ├── install-into-project.sh
    ├── validate-language.sh
    └── test-language-policy.sh
```

Human-facing project explanations use canonical English `.md` files with optional Simplified Chinese `.zh-CN.md` companions. Machine-facing artifacts and generated project outputs remain English-only.

---

## Recommended reading path

### Leader / Architect

```text
docs/01-Research-Report.md
→ docs/02-Team-Playbook.md
→ docs/03-Project-Development-Guide.md
→ docs/06-Choosing-an-Execution-Profile.md
→ selected profiles/*/README.md
```

### Engineer joining an active project

```text
docs/04-15min-SOP.md
→ selected execution profile
→ project ARCHITECTURE.md
→ active iteration
```

### Tool / workflow maintainer

```text
HANDOFF.md
→ docs/06-Choosing-an-Execution-Profile.md
→ profiles/
→ policy/
→ skills/iteration/
→ VALIDATION-REPORT.md
```

---

## Engineering memory

Cross-iteration unresolved work lives in:

```text
engineering/deferred.md
```

Typical categories:

```text
DV — Deferred Verification
TD — Technical Debt
EG — Environment Gap
KR — Known Risk
```

Items are remembered but not automatically scheduled.

Each relevant iteration can re-evaluate them as:

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

This is how the workflow avoids both forgetting debt and becoming trapped by backlog gravity.

---

## Example

OMX-Lite iteration and deferred-memory behavior:

```text
examples/cross-platform-v1/
```

The example demonstrates:

```text
Iteration 01 — Feature Complete
→ Windows validation is unavailable
→ implementation continues
→ validation is recorded as deferred
→ Human runs the system
→ reconnect/upgrade issues become more important
→ Iteration 02 promotes those integration issues
→ Windows validation remains remembered but intentionally deferred
```

Native Codex planning, bounded Goals, worktree ownership, integration, and Phase STOP:

```text
profiles/native-codex/examples/
```

---

## Tool philosophy

AI Dev Loop is deliberately **tool-aware but tool-independent**.

The [Native Codex Profile](profiles/native-codex/README.md) uses Execution Plans, Phases, and bounded Goals. The [OMX-Lite Profile](profiles/omx-lite/README.md) retains the policy and `$iteration` skill for Codex/OMX hosts. [OMX Default](integrations/OMX.md) is an upstream reference, not a third canonical lifecycle or a guarantee that every upstream mode implements these boundaries.

The methodology itself is built around stable concepts:

```text
Human-controlled Iteration
Outcome Lane
Hard Dependency
Deferred Engineering Memory
Human Gate
Evidence
Stop Boundary
```

Tools may change. These concepts should remain useful.

---

## Status

Current version:

```text
v1.1.0
```

v1.1.0 adds execution profiles on top of the stable v1.0 methodology baseline. The canonical five layers, four Views, Human Gate, deferred memory, and STOP boundary remain unchanged.

The next phase is to use the workflow on multiple real V1 projects and improve it from evidence rather than adding more process theory.

---

## License

Apache License 2.0. See `LICENSE`.
