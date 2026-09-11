# Cross-iteration engineering memory

`engineering/deferred.md` is selective cross-iteration engineering memory, **not a mandatory backlog**.

Primary classes:

```text
DV — Deferred Verification
TD — Technical Debt
EG — Environment Gap
KR — Known Risk
```

Use `templates/DEFERRED-LEDGER-TEMPLATE.md` when available.

## Re-evaluation actions

### PROMOTE
Bring into the current iteration because:
- its trigger matches current fidelity;
- it blocks the claim intended this round;
- it now harms core integration;
- delaying it materially increases rework/risk.

### KEEP-DEFERRED
Remember but do not schedule because:
- its trigger has not arrived;
- useful implementation can continue safely;
- environment cost is high relative to learning value;
- it naturally belongs to platform validation/hardening/release.

### RESOLVE
Close only with evidence.

### OBSOLETE
Close because current architecture/scope makes the item irrelevant.

### ESCALATE
Bring to Human when architecture/contract, material risk, iteration validity, or an arrived `Required before` gate is involved.

## No backlog gravity

```text
12 remembered items
→ re-evaluate
→ maybe 2 promoted
→ 8 remain deferred
→ 1 resolved
→ 1 obsolete
```

Never transform "remembered" into "scheduled now" automatically.

## Visibility

Do not show every historical item every round.

Surface only items relevant to:
- current/proposed fidelity;
- current risk;
- Human observation;
- an arriving trigger/gate;
- the proposed iteration.

## Engineering learning routing

Execution may discover facts that are important but not debt.

Route by meaning:

```text
temporary one-pass finding    → iteration result
lasting architecture fact     → ARCHITECTURE.md
important decision/rationale  → DECISIONS.md
future unresolved obligation  → deferred.md
```

Avoid turning `deferred.md` into a catch-all knowledge dump.
