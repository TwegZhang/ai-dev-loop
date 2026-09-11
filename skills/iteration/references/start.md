# Start — four-view iteration planning

Use for `$iteration` or `$iteration start`.

Goal: create one Human-approved, bounded Iteration Contract with minimal ceremony.

## View 1 — Reality

Inspect before asking questions.

Build a concise evidence-backed view of:

- implemented capabilities;
- integration state;
- verification already performed;
- important missing validation;
- architecture/public-contract state;
- recent material changes;
- current Human observations;
- facts still genuinely uncertain.

Do not perform expensive platform/environment validation merely to create this view.

Show a short summary such as:

```text
Reality
✓ Runtime core implemented
✓ local build/unit tests pass
△ cancel flow incomplete
? Windows clean install not yet validated

Architecture: no approved drift
Human observation: upgrade flow feels unreliable
```

## View 2 — Memory

Read `references/memory.md`, the latest relevant iteration result, and `engineering/deferred.md`.

Triage only relevant open items as:

```text
PROMOTE
KEEP-DEFERRED
RESOLVE
OBSOLETE
ESCALATE
```

Never inherit all old unresolved work into the next iteration.

Example:

```text
Carry-over
PROMOTE: TD-002 reconnect handling — now harms integration
KEEP-DEFERRED: DV-001 Windows install — trigger is Platform Validation
RESOLVE: EG-002 staging access — environment is now available
```

## View 3 — Human Judgment

Use **propose-first, ask-second**.

Do not ask a blank "what next?" when evidence supports a recommendation.

Ask one focused question at a time. State:

1. recovered facts;
2. recommended next pass;
3. the decision required.

Typical Human decisions:

- iteration intent;
- fidelity;
- unusual carry-over promotion/defer choices;
- scope boundary;
- architecture/contract trade-off.

Useful fidelity vocabulary:

```text
Prototype
Architecture Proof
Code Complete
Feature Complete
Integration Complete
Platform Validation
Hardening
Release Candidate
```

Stop interviewing as soon as the pass is sufficiently bounded.

## View 4 — Contract

Generate the next `iterations/iteration-XX.md`.

If available, populate `templates/ITERATION-TEMPLATE.md`.

The contract must explicitly include:

- Goal / context / priority
- Human observations that matter
- In scope / out of scope
- Fidelity target + meaning
- Hard constraints
- Allowed local autonomy
- Promoted carry-over
- Continue deferred
- Allowed deferrals
- Hard dependencies
- Expected outcome lanes
- Verification expected now
- Verification explicitly deferred
- Exit criteria
- Human gates
- Stop condition

### Lane rule

Prefer 3–7 outcome lanes only when that parallelism is useful.

Do not pre-expand routine test/debug/mock/environment actions into top-level tasks.

### Dependency rule

Keep the blocking DAG sparse. Only genuine implementation blockers belong.

### Fidelity rule

Exit criteria must match the selected fidelity. A Feature Complete iteration must not accidentally require Release Candidate evidence.

### Approval

Before writing, show a compact draft:

```text
Iteration:
Goal:
Fidelity:
Lanes:
Promoted carry-over:
Continue deferred:
Hard dependencies:
Exit criteria:
```

Ask Human to approve or modify.

After approval:

1. write the contract;
2. report its path;
3. recommend solo / `$plan` / `$ultragoal` / `$team`;
4. stop unless Human explicitly asks to execute.
