---
description: Orchestrate the AI-driven development lifecycle
argument-hint: '[spec-name or task description]'
---

# Next Phase Command

**Usage:** `/next-phase [spec-name or task description]`

**Purpose:** Orchestrate the full AI-driven development lifecycle: Plan -> Spec -> Verify -> Test Design -> TDD -> Review -> Complete

## Governance Level Determination

Before starting, determine the governance level:

| Level | When | Extra Steps |
|-------|------|-------------|
| **Standard** | Normal features, bug fixes, refactoring | TDD + test design |
| **Security-Critical** | Auth, PII, payments, infra, database schema | + Spec verification + threat analysis + security reviewer |

**Determine by checking**: Does this task touch authentication, authorization, PII data, API keys, database credentials, payment flows, or infrastructure configuration? If yes -> Security-Critical.

## 7-Step Lifecycle

### Step 1: Planning (Plan Mode)

Enter Plan Mode and draft an implementation plan:

1. Read the relevant spec/PRD from `01_specs/` or `docs/specs/`
2. Identify affected files (routes, services, components, tests)
3. Draft plan with:
   - Scope of changes
   - Affected modules
   - New public APIs (if any)
   - Test strategy
   - Governance level justification

**Human gate**: User must approve plan before proceeding.

### Step 2: Spec Detailing

Transform the plan into a detailed specification:

1. Create `docs/specs/{name}.md` using the template in `docs/specs/README.md`
2. Define invariants with unique IDs using the project's prefix convention (see CLAUDE.md)
3. For each functional requirement, define:
   - Pre-conditions
   - Post-conditions
   - Error cases
   - Boundary conditions
4. Use unambiguous language (no "should", "might", "usually" -- only "MUST", "MUST NOT")

**Security-Critical**: Also include threat analysis section referencing STRIDE categories.

### Step 3: Spec Verification

Verify the spec for consistency and completeness:

#### Standard Governance
- [ ] All invariants have unique IDs
- [ ] All pre/post conditions are testable
- [ ] All error cases enumerated
- [ ] No ambiguous language
- [ ] No contradictions within the spec

#### Security-Critical Governance (additional)
- [ ] No contradictions with ALL existing specs in `docs/specs/`
- [ ] State machine analysis (if stateful): all states reachable, no deadlocks
- [ ] Threat analysis covers all STRIDE categories for affected components
- [ ] Security invariants map to specific mitigations

Create `docs/verification/{same-name}.md` with verification results.

**Iterate with Step 2** until zero ambiguity is achieved.

### Step 4: Test Design

Derive test cases from the verified spec:

1. Create `docs/test-designs/{same-name}.md` using the template in `docs/test-designs/README.md`
2. Apply test techniques:
   - Equivalence partitioning for all inputs
   - Boundary value analysis for numeric/string inputs
   - State transition testing for stateful features
   - Error guessing for common failure modes
   - Security testing for Security-Critical items
3. Each test case MUST trace to:
   - A spec section (link to `docs/specs/{name}.md#section`)
   - An invariant ID (link to `docs/specs/{name}.md#invariant-id`)
4. Assign priorities:
   - **P0**: Must implement -- core functionality, security invariants
   - **P1**: Should implement -- edge cases, error paths
   - **P2**: Nice to have -- boundary values, performance
5. Create coverage matrix: every invariant mapped to test cases

### Step 5: TDD Implementation

Implement based on the test design:

1. Follow t-wada TDD cycle:
   - **Red**: Write failing test from test design (reference TC-{PREFIX}-{NNN})
   - **Green**: Minimum implementation to pass
   - **Refactor**: Improve structure while keeping tests green
2. All P0 test cases MUST be implemented
3. Add code comments referencing invariants: `// Implements AUTH-INV-001`
4. If spec changes needed during implementation -> return to Step 2

**Quality gates** (must all pass before proceeding):
- All tests green
- Linting: zero errors
- Type checking: zero errors

### Step 6: Code Review

Review the implementation:

#### Standard Governance
Launch 1 code review agent focusing on:
- Code quality (readability, DRY, KISS, SLAP)
- Test quality (meaningful tests, proper assertions)
- Project pattern consistency
- Type safety

#### Security-Critical Governance (additional)
Launch 1 additional security review agent focusing on:
- Authentication/authorization correctness
- PII protection (encryption, logging exclusion)
- Injection prevention (SQL, command, XSS)
- OWASP Top 10 compliance

Address all Critical and High findings before proceeding.

### Step 7: Completion

1. **Create ADR** if architectural decisions were made:
   - `docs/decisions/{NNN}-{topic}.md` using template in `docs/decisions/README.md`
2. **Update spec status** to "Implemented"
3. **Commit** with conventional format:
   ```
   feat(scope): description

   Implements invariants: AUTH-INV-001, AUTH-INV-002
   Spec: docs/specs/{name}.md
   Test Design: docs/test-designs/{name}.md
   ```
4. **Update CLAUDE.md** if development rules changed

## Important Notes

- **Never skip steps.** If a spec changes during implementation, go back to Step 2.
- **Invariant IDs are permanent.** Once assigned, never reuse or reassign.
- **Same filename across docs.** `docs/specs/foo.md`, `docs/verification/foo.md`, `docs/test-designs/foo.md` must share the same name for traceability.
- **P0 test cases are mandatory.** Do not proceed to Step 6 without all P0 tests passing.

## Start Command Execution

Now, following the 7-step lifecycle above, begin executing the development phase for: `$ARGUMENTS`
