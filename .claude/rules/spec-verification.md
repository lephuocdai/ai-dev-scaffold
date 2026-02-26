# Spec Verification Checklist

When reviewing or creating specifications, verify all of the following:

## Mandatory Checks (All Specs)

### 1. Invariant Uniqueness
- Every invariant has a unique ID following the project's naming convention
- No ID collisions with any existing spec in `docs/specs/`

### 2. No Contradictions
- Requirements do not contradict each other within the spec
- Requirements do not contradict any existing spec (Life to Date check)

### 3. Completeness
- Every item in the PRD/feature request maps to at least one invariant
- All error cases are enumerated (not just happy path)
- All boundary conditions are specified

### 4. Testability
- Every invariant can be verified by a test (has clear pass/fail criteria)
- Every pre/post condition is observable (not internal-only state)

### 5. Language Precision
- No "should" -- use "MUST" or "MUST NOT"
- No "might" or "may" -- use "MUST" or explicitly state "is not required to"
- No "usually" or "normally" -- state the exact condition
- All quantities are precise (not "a few", "some", "many")

## Security-Critical Checks (Additional)

### 6. State Machine Analysis
- All states are reachable from the initial state
- No deadlock states (states with no outgoing transitions that are not terminal)
- All transitions have defined triggers and guard conditions

### 7. STRIDE Threat Analysis
- All 6 STRIDE categories addressed for affected components
- Every identified threat has a specific mitigation
- Every mitigation maps to a spec invariant

### 8. Cross-Spec Consistency
- New invariants do not weaken existing security invariants
- Authentication/authorization invariants are consistent across all specs
- Data flow invariants are consistent (what one spec encrypts, another does not log in plaintext)

## How to Use

1. Run this checklist against every new spec before proceeding to test design
2. Document results in `docs/verification/{spec-name}.md`
3. If any check fails, fix the spec and re-verify
4. Never proceed to test design with a failing verification
