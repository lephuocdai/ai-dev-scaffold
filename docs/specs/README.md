# Specifications

Detailed specifications with invariant IDs for traceability.

## Naming Convention

```
{feature-name}.md
```

The same filename MUST be used across `docs/specs/`, `docs/verification/`, and `docs/test-designs/`.

## Template

```markdown
# Spec: {Feature Name}

| Field | Value |
|-------|-------|
| Status | Draft / Verified / Implemented |
| Author | {author} |
| Date | YYYY-MM-DD |
| Governance | Standard / Security-Critical |
| PRD | `01_specs/{name}.md` (if applicable) |

## Overview

Brief description of what this feature does and why it exists.

## Invariants

### {PREFIX}-INV-001: {Short Name}

{Precise description of what MUST always be true.}

### {PREFIX}-INV-002: {Short Name}

{Precise description.}

## Functional Requirements

### FR-1: {Requirement Name}

**Pre-conditions:**
- {What must be true before this operation}

**Post-conditions:**
- {What must be true after this operation}

**Error cases:**
- {Input} -> {Expected error response}

**Boundary conditions:**
- {Edge case description} -> {Expected behavior}

### FR-2: {Requirement Name}

...

## Non-Functional Requirements

- Performance: {specific measurable criteria}
- Security: {specific requirements}

## Threat Analysis (Security-Critical only)

| STRIDE Category | Threat | Mitigation | Invariant |
|-----------------|--------|------------|-----------|
| Spoofing | ... | ... | {PREFIX}-INV-NNN |
| Tampering | ... | ... | ... |
| Repudiation | ... | ... | ... |
| Info Disclosure | ... | ... | ... |
| Denial of Service | ... | ... | ... |
| Elevation of Privilege | ... | ... | ... |
```

## Writing Guidelines

1. **No ambiguity**: Use "MUST", "MUST NOT", "SHALL". Never use "should", "might", "usually".
2. **Testable conditions**: Every requirement must be verifiable by a test.
3. **Unique invariant IDs**: Use the prefix convention defined in CLAUDE.md.
4. **Cross-reference**: Link to related specs, PRDs, and ADRs.

## Index

| Spec | Status | Invariants | Date |
|------|--------|------------|------|
| (none yet) | | | |
```
