---
description: Verify spec consistency and completeness
argument-hint: '[spec filename]'
---

# Verify Spec Command

**Usage:** `/verify-spec [spec-filename]`

**Purpose:** Run formal consistency and completeness checks on a specification.

## Execution Flow

### 1. Load the Spec

Read the spec file from `docs/specs/$ARGUMENTS`

If file not found, search `docs/specs/` for matching filenames.

### 2. Run Verification Checks

Perform ALL checks from the verification template (`docs/verification/README.md`):

#### Standard Checks (always)
1. **Unique Invariant IDs** -- No duplicates within spec or across all `docs/specs/*.md`
2. **Contradiction Check** -- No internal contradictions between requirements
3. **Completeness Check** -- All PRD items covered, all error/boundary cases specified
4. **Testability Check** -- Every invariant and condition is observable and testable
5. **Language Check** -- No ambiguous terms ("should", "might", "usually", "normally")

#### Security-Critical Checks (if spec governance = Security-Critical)
6. **State Machine Analysis** -- All states reachable, no deadlocks
7. **STRIDE Threat Analysis** -- All 6 categories addressed, mitigations mapped to invariants
8. **Life to Date** -- No conflicts with ANY existing spec in `docs/specs/`

### 3. Generate Report

Create `docs/verification/{same-filename}.md` using the template.

### 4. Report Results

```
Verification: {spec-name}
Result: PASS / FAIL

Checks:
  1. Unique IDs:      PASS/FAIL
  2. Contradictions:   PASS/FAIL
  3. Completeness:     PASS/FAIL
  4. Testability:      PASS/FAIL
  5. Language:         PASS/FAIL
  6. State Machine:    PASS/FAIL/N/A
  7. STRIDE:           PASS/FAIL/N/A
  8. Life to Date:     PASS/FAIL

Action Items: {list if any FAIL}
```

### 5. If FAIL

List specific issues and suggest fixes for the spec. Do NOT proceed to test design until all checks pass.

## Start Command Execution

Now verify the spec: `$ARGUMENTS`
