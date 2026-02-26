# Test Designs

Test cases derived from verified specifications with full traceability.

## Naming Convention

Same filename as the corresponding spec: `docs/specs/foo.md` -> `docs/test-designs/foo.md`

## Template

```markdown
# Test Design: {Feature Name}

| Field | Value |
|-------|-------|
| Spec | `docs/specs/{name}.md` |
| Verification | `docs/verification/{name}.md` |
| Date | YYYY-MM-DD |
| Total Cases | {N} (P0: {n}, P1: {n}, P2: {n}) |

## Test Cases

### TC-{PREFIX}-001: {Description}

| Field | Value |
|-------|-------|
| Priority | P0 / P1 / P2 |
| Spec Section | [FR-1](docs/specs/{name}.md#fr-1-requirement-name) |
| Invariant | [{PREFIX}-INV-001](docs/specs/{name}.md#prefix-inv-001-short-name) |
| Technique | Equivalence Partitioning / Boundary Value / State Transition / Error Guessing |

**Pre-conditions:**
- {Setup required}

**Steps:**
1. {Action}
2. {Action}

**Expected Result:**
- {Observable outcome}

---

### TC-{PREFIX}-002: {Description}

...

## Coverage Matrix

| Invariant | Test Cases | Covered |
|-----------|------------|---------|
| {PREFIX}-INV-001 | TC-{PREFIX}-001, TC-{PREFIX}-003 | Yes |
| {PREFIX}-INV-002 | TC-{PREFIX}-002 | Yes |
| ... | ... | ... |

## Test Techniques Applied

| Technique | Where Applied |
|-----------|--------------|
| Equivalence Partitioning | {Which inputs/domains} |
| Boundary Value Analysis | {Which numeric/string inputs} |
| State Transition Testing | {Which stateful features} |
| Error Guessing | {Which failure modes} |
| Security Testing | {Which attack vectors} (Security-Critical only) |

## Priority Summary

| Priority | Count | Description |
|----------|-------|-------------|
| P0 | {n} | Must implement -- core functionality, security invariants |
| P1 | {n} | Should implement -- edge cases, error paths |
| P2 | {n} | Nice to have -- boundary values, performance |
```

## Index

| Test Design | Spec | Cases | Date |
|------------|------|-------|------|
| (none yet) | | | |
