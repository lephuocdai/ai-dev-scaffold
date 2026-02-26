# Verification Reports

Formal verification proving specs are consistent, complete, and contradiction-free.

## Naming Convention

Same filename as the corresponding spec: `docs/specs/foo.md` -> `docs/verification/foo.md`

## Template

```markdown
# Verification: {Feature Name}

| Field | Value |
|-------|-------|
| Spec | `docs/specs/{name}.md` |
| Date | YYYY-MM-DD |
| Governance | Standard / Security-Critical |
| Result | PASS / FAIL |

## Checks

### 1. Unique Invariant IDs
- [ ] All invariant IDs are unique within this spec
- [ ] No ID conflicts with existing specs
- Result: PASS / FAIL
- Notes: {details}

### 2. Contradiction Check
- [ ] No internal contradictions between requirements
- [ ] No contradictions with existing specs (Life to Date)
- Result: PASS / FAIL
- Notes: {details}

### 3. Completeness Check
- [ ] All PRD items covered by at least one invariant
- [ ] All error cases enumerated
- [ ] All boundary conditions specified
- Result: PASS / FAIL
- Notes: {details}

### 4. Testability Check
- [ ] Every invariant is testable (clear pass/fail criteria)
- [ ] Every pre/post condition is observable
- Result: PASS / FAIL
- Notes: {details}

### 5. Language Check
- [ ] No ambiguous terms ("should", "might", "usually")
- [ ] All quantities specified precisely
- Result: PASS / FAIL
- Notes: {details}

### 6. State Machine Analysis (if applicable)
- [ ] All states reachable from initial state
- [ ] No deadlock states
- [ ] All transitions have defined triggers and guards
- Result: PASS / FAIL / N/A
- Notes: {details}

### 7. STRIDE Threat Analysis (Security-Critical only)
- [ ] All 6 STRIDE categories addressed
- [ ] Each threat has a mitigation
- [ ] Each mitigation maps to an invariant
- Result: PASS / FAIL / N/A
- Notes: {details}

### 8. Life to Date (cross-spec consistency)
- [ ] No conflicts with: {list all existing specs}
- Result: PASS / FAIL
- Notes: {details}

## Summary

| Check | Result |
|-------|--------|
| Unique IDs | PASS/FAIL |
| Contradictions | PASS/FAIL |
| Completeness | PASS/FAIL |
| Testability | PASS/FAIL |
| Language | PASS/FAIL |
| State Machine | PASS/FAIL/N/A |
| STRIDE | PASS/FAIL/N/A |
| Life to Date | PASS/FAIL |

**Overall**: PASS / FAIL

## Action Items (if FAIL)

- [ ] {What needs to be fixed in the spec}
```

## Index

| Verification | Spec | Result | Date |
|-------------|------|--------|------|
| (none yet) | | | |
