# Changelog

All notable changes to AI Dev Loop are documented here.

## [1.1.0] - 2026-09-11

### Added

- Additive Execution Profile architecture: Native Codex and OMX-Lite implement the canonical methodology; OMX Default is the upstream baseline/reference.
- Bilingual execution-profile selector comparing Human control capability, coordination complexity, environment uncertainty, verification rigidity, desired autonomy, and persistent orchestration state.
- Native Codex profile guides, Execution Plan and Goal templates, and an illustrative runtime-contract/web-integration Phase example.
- Native guidance for main-session/subagent coordination, optional Human-started CLI `/goal` sessions, worktree isolation, dependency boundaries, and Human Phase review followed by STOP.
- Profile-aware language validation and regression coverage.

### Clarified

- Existing policy, iteration skill, templates, and installation paths remain the OMX-Lite implementation; `omx|codex` selects the host/discovery path, not the execution profile.
- Phase maps to a Human-controlled Iteration; Goal maps to an outcome Lane or bounded Task and never replaces the Iteration Contract.
- The canonical hierarchy, Human judgment boundaries, completion distinctions, and engineering-memory semantics remain unchanged from v1.0.

## [1.0.0] - 2026-09-11

### Added

- Canonical model: `Project → Iteration → Lane → Task → Inner Loop`
- Four-view iteration planning: `Reality → Memory → Human Judgment → Contract`
- Human-controlled multi-pass project development
- OMX-Lite policy
- `$iteration` skill with `start`, `status`, `review`, and `close`
- Cross-iteration engineering memory:
  - Deferred Verification
  - Technical Debt
  - Environment Gap
  - Known Risk
- Re-evaluation semantics:
  - PROMOTE
  - KEEP-DEFERRED
  - RESOLVE
  - OBSOLETE
  - ESCALATE
- Iteration, result, and deferred-ledger templates
- Team Playbook and Human Project Development Guide
- 15-minute engineer SOP
- Cross-platform V1 example
- Host-specific installation guidance for OMX and plain Codex
- Package validation report
- Canonical-English and Simplified-Chinese companion documentation policy
- Repository language-policy validation and regression test scripts

### Core decisions

- Iteration Complete is not equivalent to Fully Verified or Release Ready.
- Remembered work is not automatically scheduled work.
- Only hard implementation dependencies block execution.
- Human controls iteration boundaries.
- OMX/Codex executes inside one iteration rather than owning the whole lifecycle.
