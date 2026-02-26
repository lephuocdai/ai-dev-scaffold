# {{PROJECT_NAME}}

{{PROJECT_DESCRIPTION}}

## Quick Start

```bash
{{QUICK_START_COMMANDS}}
```

## Architecture

{{ARCHITECTURE_OVERVIEW}}

## Common Commands

```bash
{{PACKAGE_MANAGER}} test          # Run all tests
{{PACKAGE_MANAGER}} lint          # Lint all packages
{{PACKAGE_MANAGER}} typecheck     # Type-check all packages
{{PACKAGE_MANAGER}} build         # Build all packages
```

## Development Methodology

This project follows the **AI-Driven Development Lifecycle**.

All features go through: `/next-phase [spec-name]`

Pipeline: **Spec -> Verify -> Test Design -> TDD -> Review -> Complete**

### Governance Levels

| Level | When | Extra Steps |
|-------|------|-------------|
| **Standard** | Normal features, bug fixes, refactoring | TDD + test design |
| **Security-Critical** | Auth, PII, payments, infra, DB schema | + Spec verification + threat analysis + security reviewer |

### Invariant ID Prefixes

Define prefixes relevant to your domain:

| Prefix | Domain |
|--------|--------|
| {{PREFIX_1}}-INV-NNN | {{DOMAIN_1}} |
| {{PREFIX_2}}-INV-NNN | {{DOMAIN_2}} |
| {{PREFIX_3}}-INV-NNN | {{DOMAIN_3}} |

### Documentation Structure

| Document | Location | Template |
|----------|----------|----------|
| PRD / Feature Spec | `01_specs/` | Free-form |
| Detailed Spec | `docs/specs/` | `docs/specs/README.md` |
| Verification | `docs/verification/` | `docs/verification/README.md` |
| Test Design | `docs/test-designs/` | `docs/test-designs/README.md` |
| ADR | `docs/decisions/` | `docs/decisions/README.md` |

### Current Phase

- Phase 1: [description] -- Status: Not Started

## GitHub Identity

Use `{{GITHUB_USERNAME}}` identity for all GitHub operations.
Repository: `{{GITHUB_REPO}}`

## Package Manager

This project uses **{{PACKAGE_MANAGER}}**. Do not use other package managers.
