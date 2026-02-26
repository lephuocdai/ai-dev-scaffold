# {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## Quick Start

```bash
{{QUICK_START_COMMANDS}}
```

## Architecture

{{ARCHITECTURE_OVERVIEW}}

## Tech Stack

{{TECH_STACK}}

## Common Commands

```bash
{{DEV_SERVER_CMD}}        # Start dev server
{{TEST_CMD}}              # Run all tests
{{LINT_CMD}}              # Lint all code
{{TYPECHECK_CMD}}         # Type-check
{{BUILD_CMD}}             # Build for production
```

## Development Methodology

This project follows the **AI-Driven Development Lifecycle**.

All features go through: `/next-phase [spec-name or task description]`

```
Vision -> Research -> Roadmap -> Spec -> Verify -> Test Design -> TDD -> Review -> Complete
```

### 6-Step Development Lifecycle (mandatory, no step skipping)

| Step | Name | Description |
|------|------|-------------|
| 1 | Planning | Roadmap check + Plan Mode design + user approval |
| 2 | Implementation | 4-stage pipeline: Spec -> Verify (iterate) -> Test Design -> TDD |
| 3 | Build & Verify | Build + all tests + lint + type-check + security audit |
| 4 | Commit & Review | Implementation commit + independent review team |
| 5 | Review Fix | Address all findings + re-test + commit |
| 6 | Complete | Roadmap update + commit |

### Governance Levels

| Level | When | Extra Steps |
|-------|------|-------------|
| **Standard** | Normal features, bug fixes, refactoring | TDD + test design |
| **Security-Critical** | Auth, PII, payments, infra, DB schema | + Spec verification + STRIDE threat analysis + security reviewer |

### Invariant ID Prefixes

Define prefixes relevant to your domain:

| Prefix | Domain |
|--------|--------|
| {{PREFIX_1}}-INV-NNN | {{DOMAIN_1}} |
| {{PREFIX_2}}-INV-NNN | {{DOMAIN_2}} |
| {{PREFIX_3}}-INV-NNN | {{DOMAIN_3}} |

### Documentation Structure

All documents for the same feature share the **same filename** across directories.

| Document | Location | Template |
|----------|----------|----------|
| Implementation Plan | `docs/plans/` | `docs/plans/README.md` |
| Detailed Spec | `docs/specs/` | `docs/specs/README.md` |
| Verification Report | `docs/verification/` | `docs/verification/README.md` |
| Test Design | `docs/test-designs/` | `docs/test-designs/README.md` |
| ADR | `docs/decisions/` | `docs/decisions/README.md` |
| Deep Research | `docs/research/` | `docs/research/README.md` |

### Traceability Chain

```
Code line
  -> Test case ID (TC-PREFIX-NNN) in code comment
Test Design (docs/test-designs/)
  -> References spec section + invariant ID
Spec (docs/specs/)
  -> Invariant IDs defined here, threat model links
Verification Report (docs/verification/)
  -> Consistency proof against all existing specs
Plan (docs/plans/)
  -> Roadmap item reference, acceptance criteria
Roadmap (roadmap.md)
  -> Strategic vision decisions
```

All document cross-references MUST be clickable Markdown links, not backtick-only references.

### Current Phase

- Phase {{N}}: {{DESCRIPTION}} -- Status: Not Started

## Roadmap

See [roadmap.md](./roadmap.md) for the full development roadmap.

## Project-Specific Rules

### Language

- Code, variables, comments: English
- Documents, commit messages: {{LANGUAGE}}

### Package Manager

This project uses **{{PACKAGE_MANAGER}}**. Do not use other package managers.

### GitHub Identity

Use `{{GITHUB_USERNAME}}` identity for all GitHub operations.
Repository: `{{GITHUB_REPO}}`

### Safety Rules

- Never force push to main/master
- Never commit secrets or credentials
- Never skip pre-commit hooks
- Never proceed to test design with a failing spec verification
