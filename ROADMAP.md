# Roadmap

AI Dev Loop v1.0 is intentionally small.

## Current phase — Real-project validation

Priority: run the workflow on multiple real software projects.

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
