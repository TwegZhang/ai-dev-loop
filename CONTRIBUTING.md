# Contributing to AI Dev Loop

Thanks for helping improve AI Dev Loop.

## What this project is optimizing for

AI Dev Loop should remain:

- human-led at architecture and iteration boundaries;
- lightweight enough to start quickly;
- evidence-driven;
- tolerant of safe deferral;
- compatible with real engineering constraints;
- independent of any single Coding Agent product.

## Language policy

English is the canonical language for repository artifacts that control, execute, validate, or demonstrate the workflow. This includes:

- `policy/`;
- `skills/`;
- `templates/`;
- `examples/`;
- `integrations/`;
- `scripts/`;
- templates and examples under `profiles/`;
- iteration contracts, iteration results, and deferred engineering memory produced from the templates.

Human-facing project explanations may be maintained in both English and Simplified Chinese. Use the unsuffixed `.md` file as the canonical English document and `.zh-CN.md` as its Chinese companion. Keep reciprocal language links at the top of both files.

Profile READMEs and the execution-profile selector are bilingual Human-facing documentation. Profile templates and examples are English-only workflow artifacts; do not add Chinese companions for them. Preserve this distinction when extending `profiles/`.

Commands, paths, identifiers, status names, template fields, and normative workflow semantics must remain identical across language versions. When the two versions conflict, the canonical English document governs until the translation is reconciled.

Run `./scripts/test-language-policy.sh` before publishing changes to bilingual documentation or English-only artifacts.

## High-value contributions

We especially welcome:

- real-project case studies;
- iteration patterns that repeatedly work;
- failure modes with concrete evidence;
- improvements to `$iteration` interaction quality;
- better engineering-memory triage;
- integrations for additional Coding Agent tools;
- simplifications that remove unnecessary process;
- fixes to conflicting or stale documentation.

## Please avoid

Unless backed by repeated real-project evidence, avoid adding:

- large orchestration frameworks;
- many new task states;
- mandatory ceremonies;
- giant YAML schemas;
- automatic inheritance of all old debt;
- universal validation blockers;
- tool-specific assumptions in the methodology core.

## Design rule

Before adding a rule, ask:

> Does this help Human judgment, execution throughput, evidence quality, or cross-iteration memory enough to justify the extra process?

If not, prefer not to add it.

## Pull requests

A useful PR should explain:

1. the real problem observed;
2. the current behavior;
3. the proposed change;
4. why the change belongs in the core rather than a project-specific policy;
5. what becomes simpler or more reliable.

## Documentation consistency

When changing canonical concepts, check all affected layers:

```text
Research
Playbook
Human Guide
Profile Selector and Profile READMEs
Policy
Templates
Profile Templates
Skill
Examples
Profile Examples
Handoff
```

Run or update the package consistency checks when applicable.
