# New Project Setup Guide

[English](05-Project-Setup.md) | [&#31616;&#20307;&#20013;&#25991;](05-Project-Setup.zh-CN.md)

## 1. Recommended Project Structure

```text
repo/
├── AGENTS.md
├── ARCHITECTURE.md
├── DECISIONS.md
├── specs/
├── policy/
│   └── OMX-LITE-POLICY.md
├── templates/
│   ├── ITERATION-TEMPLATE.md
│   ├── ITERATION-RESULT-TEMPLATE.md
│   └── DEFERRED-LEDGER-TEMPLATE.md
├── iterations/
└── engineering/
    └── deferred.md
```

## 2. Copy the Policy and Templates

Copy from this workflow package:

```bash
mkdir -p policy templates iterations engineering
cp <workflow>/policy/OMX-LITE-POLICY.md policy/
cp <workflow>/templates/*.md templates/
cp templates/DEFERRED-LEDGER-TEMPLATE.md engineering/deferred.md
```

Remove or replace the example records in `deferred.md`.

## 3. Install the `$iteration` Skill

The single source in this workflow package is:

```text
skills/iteration/
```

### OMX Project Scope (the Default for This Workflow)

The current OMX project setup uses the project's `./.codex/` as its scoped Codex home and installs project skills into:

```text
.codex/skills/
```

Therefore:

```bash
mkdir -p .codex/skills
cp -R <workflow>/skills/iteration .codex/skills/
```

Then launch Codex through OMX and verify the installation through the skill list or `$iteration`.

### Plain Codex Repo-Local Setup

The repo-local discovery path for checked-in skills listed in OpenAI's current Codex documentation is:

```text
.agents/skills/
```

A plain Codex repository can therefore use:

```bash
mkdir -p .agents/skills
cp -R <workflow>/skills/iteration .agents/skills/
```

### Do Not Install Both Copies

Skill discovery and `CODEX_HOME` conventions have changed across Codex/OMX versions.

The principle is:

> **This repository's `skills/iteration/` is the single source; choose only one discovery location that actually takes effect in the working project.**

Avoid placing the same skill in both `.codex/skills/iteration` and `.agents/skills/iteration` to prevent duplicates and version drift.

## 4. Reference the Policy in `AGENTS.md`

You can copy the core content from `templates/AGENTS-SNIPPET.md`.

Make sure the Agent knows:

```text
Human owns iteration boundaries
OMX executes inside the current iteration
deferred memory is not an automatic backlog
```

## 5. First Use

If the architecture already exists:

```text
$iteration start
```

If the architecture is still highly ambiguous, first use OMX's requirements/planning capabilities (such as deep interview / planning). Establish the Architecture/Spec before entering an Iteration.

## 6. End the First Iteration

```text
$iteration close
```

Check that these files were produced:

```text
iterations/iteration-01-result.md
engineering/deferred.md
```

The Human then runs the system before starting the next iteration.

## 7. Verify the Skill Installation

If `$iteration` does not appear:

- Check the skill root used by the actual host.
- Check the `SKILL.md` frontmatter.
- Restart Codex if the host has not refreshed automatically.
- In an OMX environment, run `omx doctor` to check its scoped setup.

## 8. Version Notes

Skill/OMX/Codex discovery paths and commands can change.

The methodology's assets should be grounded in:

```text
Iteration
Reality / Memory / Judgment / Contract
Outcome Lane
Hard Dependency
Deferred Memory
Human Gate
Stop Boundary
```

They should not depend on the internal implementation of a particular tool version.
