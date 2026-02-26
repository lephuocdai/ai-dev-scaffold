---
description: Generate test design from verified spec
argument-hint: '[spec filename]'
---

# Test Design Command

**Usage:** `/test-design [spec-filename]`

**Purpose:** Derive comprehensive test cases from a verified specification.

## Pre-requisites

- Spec exists at `docs/specs/{name}.md`
- Verification exists at `docs/verification/{name}.md` with PASS result

If verification does not exist or is FAIL, run `/verify-spec` first.

## Execution Flow

### 1. Load Spec and Verification

Read both files. Extract all invariants, requirements, error cases, and boundary conditions.

### 2. Apply Test Techniques

For each requirement and invariant, apply:

| Technique | When to Apply |
|-----------|--------------|
| Equivalence Partitioning | All inputs with distinct valid/invalid classes |
| Boundary Value Analysis | Numeric inputs, string lengths, array sizes |
| State Transition Testing | Features with state machines or workflows |
| Error Guessing | Common failure modes, null/empty/overflow |
| Security Testing | Auth, injection, PII exposure (Security-Critical) |

### 3. Generate Test Cases

For each test case, define:
- **ID**: `TC-{PREFIX}-{NNN}`
- **Priority**: P0 (must) / P1 (should) / P2 (nice-to-have)
- **Spec traceability**: Clickable link to spec section + invariant ID
- **Technique**: Which test technique generated this case
- **Pre-conditions, Steps, Expected Result**

### 4. Build Coverage Matrix

Create a matrix mapping every invariant to its test cases. Flag any invariant with zero test cases.

### 5. Write Output

Create `docs/test-designs/{same-filename}.md` using the template in `docs/test-designs/README.md`.

### 6. Report Summary

```
Test Design: {name}
Total Cases: {N} (P0: {n}, P1: {n}, P2: {n})
Coverage: {M}/{M} invariants covered (100%)

Ready for TDD implementation.
```

## Start Command Execution

Now generate test design for: `$ARGUMENTS`
