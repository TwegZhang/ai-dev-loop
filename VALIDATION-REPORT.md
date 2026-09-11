# Public Repo Validation Report

Overall: **PASS**

This v1.1.0 report records validation of the integrated repository package. It does not claim runtime validation of either profile on a real project, publication, or release readiness for a downstream product.

## Required file inventory

```text
README.md
README.zh-CN.md
LICENSE
CONTRIBUTING.md
CHANGELOG.md
ROADMAP.md
SECURITY.md
HANDOFF.md
VERSION
MANIFEST.md
VALIDATION-REPORT.md
.gitignore
docs/01-Research-Report.md
docs/01-Research-Report.zh-CN.md
docs/02-Team-Playbook.md
docs/02-Team-Playbook.zh-CN.md
docs/03-Project-Development-Guide.md
docs/03-Project-Development-Guide.zh-CN.md
docs/04-15min-SOP.md
docs/04-15min-SOP.zh-CN.md
docs/05-Project-Setup.md
docs/05-Project-Setup.zh-CN.md
docs/06-Choosing-an-Execution-Profile.md
docs/06-Choosing-an-Execution-Profile.zh-CN.md
profiles/native-codex/README.md
profiles/native-codex/README.zh-CN.md
profiles/native-codex/EXECUTION-PLAN-TEMPLATE.md
profiles/native-codex/GOAL-TEMPLATE.md
profiles/native-codex/examples/README.md
profiles/native-codex/examples/EXECUTION-PLAN.md
profiles/native-codex/examples/goals/goal-runtime-contract.md
profiles/native-codex/examples/goals/goal-web-integration.md
profiles/native-codex/examples/phase-01-result.md
profiles/omx-lite/README.md
profiles/omx-lite/README.zh-CN.md
policy/OMX-LITE-POLICY.md
templates/ITERATION-TEMPLATE.md
templates/ITERATION-RESULT-TEMPLATE.md
templates/DEFERRED-LEDGER-TEMPLATE.md
templates/AGENTS-SNIPPET.md
skills/iteration/SKILL.md
skills/iteration/references/start.md
skills/iteration/references/close.md
skills/iteration/references/memory.md
skills/iteration/references/review.md
skills/iteration/references/status.md
integrations/OMX.md
examples/README.md
examples/cross-platform-v1/iteration-01.md
examples/cross-platform-v1/iteration-01-result.md
examples/cross-platform-v1/deferred-after-iteration-01.md
examples/cross-platform-v1/iteration-02.md
scripts/install-into-project.sh
scripts/validate-language.sh
scripts/test-language-policy.sh
```

Final result: all 55 required paths are present. `MANIFEST.md` covers every repository file except itself, script executability is preserved, the full license text is present, and `VERSION` is `1.1.0`.

## Coherence review required for PASS

- Research, Playbook, Human Guide, SOP, selector, profiles, Policy, Templates, Skill, Examples, and Handoff preserve Project → Iteration → Lane → Task → Inner Loop and Reality → Memory → Human Judgment → Contract.
- Native Codex and OMX-Lite implement the same methodology; OMX Default is an upstream strict baseline/reference, not reimplemented here.
- The selector covers Human control capability, coordination complexity, environment uncertainty, verification rigidity, desired autonomy, and persistent orchestration state, with exceptions and use cases.
- Native Phase maps to Human-controlled Iteration; Goal maps to outcome Lane or bounded Task and never replaces its Iteration Contract.
- Native launch defaults to one main session coordinating available subagents; independent CLI `/goal` sessions are optionally Human-started. No custom orchestrator, state machine, DAG, or mailbox is introduced.
- Hard dependencies and write ownership govern parallelism; Git worktrees are the implementation default with documented exceptions.
- Phase review covers completion, evidence, TD, DV, EG, KR, engineering learning, and Human decisions, followed by STOP. New phases require refreshed Reality + Memory and Human judgment.
- Policy = constraints, Templates = schemas, Skill = interaction/automation. Existing OMX-Lite skill modes, progressive disclosure, policy semantics, artifact English rule, installer arguments, and paths remain compatible.
- `codex` is an OMX-Lite installer host choice, not selection of the Native Codex Profile.
- Iteration Complete ≠ Fully Verified ≠ Release Ready; Remembered ≠ Scheduled Now. Previous results and deferred memory inform Human judgment without automatic scheduling.
- Profile READMEs and selector have reciprocal bilingual links; English-only profile templates/examples contain no Chinese text. Illustrative example results are not presented as actual test evidence.
- No stale `plans/v1-lanes` primary flow or OMX `$ralph` command dependency is introduced. Repository links and official Native capability references are valid.

## Reproducible language checks

```bash
./scripts/validate-language.sh
./scripts/test-language-policy.sh
bash -n scripts/install-into-project.sh scripts/validate-language.sh scripts/test-language-policy.sh
```

The regression script checks the current repository and isolated negative fixtures for missing required pairs, incorrect reciprocal links, Chinese text in English-only locations, and file-enumeration failures. It verifies the exact `Generated artifact: English only.` rule in both Native templates and that the existing iteration-artifact English rule survives OMX-Lite installation.

## Validation evidence

Validated on 2026-09-11 against the final integrated tree:

- `./scripts/validate-language.sh`: PASS.
- `./scripts/test-language-policy.sh`: PASS, including negative fixtures for bilingual pairs and Chinese text in Native templates and nested examples.
- Bash syntax and executable-bit checks for all three scripts: PASS.
- Full local Markdown link and anchor review: PASS.
- OMX-Lite installer smoke tests for both `omx` and `codex` hosts in isolated temporary projects: PASS; the installed policy, three copied iteration templates, and skill assets match the repository sources. `AGENTS-SNIPPET.md` remains a manually referenced adoption aid, matching the stable v1.0 installer contract.
- Required inventory and `MANIFEST.md` SHA-256 alignment: PASS.
- `VERSION`, changelog/readme release metadata, and full license checks: PASS.
- `git diff --check`: PASS.
- Independent architecture review of the complete Execution Profile diff: PASS; no material conflict, omission, custom Native orchestrator, or unsupported Codex capability claim was found.

Compatibility limitation: the generic system `quick_validate.py` rejects the existing `argument-hint` field in `skills/iteration/SKILL.md`. This field predates v1.1.0 and remains valid under the installed OMX skill authoring contract, so it was preserved for backward compatibility. The generic validator result is not reported as a pass and does not establish a runtime defect.

## Release decision

Target: **ai-dev-loop v1.1.0**. The repository package is internally consistent and ready for real-project profile validation. Publishing, downstream release readiness, and proof of profile effectiveness are separate outcomes; this document does not claim they have occurred.
