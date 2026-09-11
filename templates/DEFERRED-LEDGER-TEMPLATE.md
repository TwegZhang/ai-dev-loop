# Deferred Engineering Memory

> Cross-iteration memory of unresolved engineering obligations and risks.
> This file is **not a mandatory backlog**. Items are remembered and re-evaluated at each relevant iteration.
> Generated iteration artifacts must be written in English.

## Status vocabulary

```text
Deferred
Promoted
Resolved
Obsolete
Escalated
```

## Categories

```text
DV — Deferred Verification
TD — Technical Debt
EG — Environment Gap
KR — Known Risk
```

## Triage actions for a new iteration

```text
PROMOTE       → schedule now
KEEP-DEFERRED → remember, do not schedule now
RESOLVE       → close with evidence
OBSOLETE      → no longer relevant
ESCALATE      → Human decision / current blocker
```

---

## {{TYPE}}-{{NNN}} {{TITLE}}

Type: {{TYPE_NAME}}
Status: Deferred

Found in: Iteration {{FOUND_IN}}
Last reviewed in: Iteration {{LAST_REVIEWED}}

Blocking current development: {{Yes_or_No}}
Required before: {{GATE_OR_NONE}}
Suggested trigger: {{TRIGGER_OR_NONE}}

### Reason

{{WHY_DEFERRED}}

### What is already known

{{KNOWN_FACTS}}

### Evidence

{{EVIDENCE}}

### Future action

{{FUTURE_ACTION}}

---

<!-- Add future records using the same schema. Update existing records instead of duplicating the same underlying issue. -->
