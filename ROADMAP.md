# Roadmap

AI Dev Loop v1.1.0 adds execution profiles while keeping the canonical methodology small and stable.

## Current phase — Real-project validation

Priority: compare Native Codex and OMX-Lite on real software projects, using OMX Default as an upstream baseline/reference rather than reimplementing it here. Record the installed runtime and mode so comparisons do not treat all upstream workflows as identical.

Use the [selector's six dimensions](docs/06-Choosing-an-Execution-Profile.md): Human control capability, coordination complexity, environment uncertainty, verification rigidity, desired autonomy, and persistent orchestration state. Test exceptions as well as typical fits: strict verification in a single native Goal, uncertain environments in either profile, and bounded native work inside a complex project.

Collect evidence on:

- Human intervention frequency;
- lane granularity;
- hard vs fake blockers;
- deferred-item growth and resolution;
- architecture drift;
- integration rework;
- tool/coordination overhead;
- verification claims that later fail;
- time from approved iteration to working software.

Compare useful outcomes and evidence at comparable fidelity, not just task counts or automation volume. Record why a profile was selected, its setup and coordination cost, whether Human review boundaries held, and whether a different profile would have reduced friction. Reconsider profile fit at reviewed iteration boundaries.

## Likely v1.x work

Only when supported by real usage:

- simplify `$iteration` interview further;
- improve carry-over triage;
- better status summaries;
- more examples;
- integrations for additional Coding Agent hosts;
- lightweight initialization tooling;
- checks for stale/dead deferred items.

## Possible future work

Explore only if repeated evidence supports it:

- optional project dashboard;
- automated iteration metrics;
- adapter layer for additional coding tools;
- release-gate helper;
- migration helpers for existing projects.

## Explicit non-goals

Do not turn AI Dev Loop into:

- a multi-agent runtime;
- an issue tracker;
- a replacement for GitHub/Jira/Linear;
- a Scrum framework;
- an all-purpose autonomous software factory;
- a deep OMX fork without evidence that usage-layer adaptation is insufficient.

## Decision rule

> First discover the workflow through real projects. Then automate only the repeated friction.
