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

## 6-Step Lifecycle

### Step 1: Planning (Plan Mode)

Enter Plan Mode and draft an implementation plan:

1. Read the roadmap (`roadmap.md`) to understand the current project state
2. Read relevant existing specs from `docs/specs/` to understand what already exists
3. Draft plan with:
   - Scope of changes
   - Affected modules and files
   - New public APIs (if any)
   - Test strategy
   - Governance level justification
   - Acceptance criteria (clear, testable)
4. Save plan to `docs/plans/{name}.md`

**Human gate**: User MUST approve plan before proceeding.

### Step 2: Implementation Pipeline

Execute the 4-stage pipeline. Each stage gates the next.

#### Stage 2a: Spec Detailing

Launch a **spec-writer** sub-agent (Task tool, subagent_type: general-purpose):

1. Create `docs/specs/{name}.md` using the template in `docs/specs/README.md`
2. Define invariants with unique IDs using the project's prefix convention (see CLAUDE.md)
3. For each functional requirement, define:
   - Pre-conditions
   - Post-conditions
   - Error cases with exact error responses
   - Boundary conditions
4. Use unambiguous language (no "should", "might", "usually" -- only "MUST", "MUST NOT")
5. **Security-Critical**: Also include STRIDE threat analysis section

#### Stage 2b: Spec Verification (iterates with 2a)

Launch a **formal-verifier** sub-agent (Task tool, subagent_type: general-purpose):

**Standard Governance checks:**
- [ ] All invariants have unique IDs (no collisions with `docs/specs/*.md`)
- [ ] All pre/post conditions are testable
- [ ] All error cases enumerated
- [ ] No ambiguous language
- [ ] No internal contradictions

**Security-Critical Governance (additional):**
- [ ] No contradictions with ALL existing specs in `docs/specs/` (Life to Date)
- [ ] State machine analysis (if stateful): all states reachable, no deadlocks
- [ ] STRIDE threat analysis covers all 6 categories for affected components
- [ ] Security invariants map to specific mitigations

Create `docs/verification/{same-name}.md` with verification results.

**Loop**: If FAIL, return to Stage 2a. Iterate until zero ambiguity.

#### Stage 2c: Test Design

Launch a **test-architect** sub-agent (Task tool, subagent_type: general-purpose):

1. Create `docs/test-designs/{same-name}.md` using the template
2. Apply test techniques:
   - Equivalence partitioning for all inputs
   - Boundary value analysis for numeric/string inputs
   - State transition testing for stateful features
   - Error guessing for common failure modes
   - Security testing for Security-Critical items
3. Each test case MUST trace to a spec section and invariant ID (clickable links)
4. Assign priorities: P0 (must) / P1 (should) / P2 (nice-to-have)
5. Create coverage matrix: every invariant mapped to test cases

#### Stage 2d: TDD Implementation

Launch a **tdd-practitioner** sub-agent (Task tool, subagent_type: general-purpose):

1. Follow t-wada TDD cycle:
   - **Red**: Write failing test from test design (reference TC-{PREFIX}-{NNN})
   - **Green**: Minimum implementation to pass
   - **Refactor**: Improve structure while keeping tests green
2. All P0 test cases MUST be implemented
3. Add code comments referencing invariants: `// Implements {PREFIX}-INV-NNN`
4. If spec changes needed during implementation -> return to Stage 2a

**Quality gates** (must all pass before proceeding):
- All tests green
- Linting: zero errors
- Type checking: zero errors

### Step 3: Build & Verify

Run full build and verification:

```bash
# Run the project's build, test, lint, and type-check commands
# (Refer to CLAUDE.md "Common Commands" section)
```

For Security-Critical: also run security audit (dependency scanning, secret detection, dangerous pattern scanning).

### Step 4: Commit & Review

1. **Commit** with traceability format:
   ```
   feat(scope): description

   Implements invariants: {PREFIX}-INV-001, {PREFIX}-INV-002
   Spec: docs/specs/{name}.md
   Test Design: docs/test-designs/{name}.md
   ```

2. **Review**: Launch review sub-agents:

   **Standard Governance** - 1 code review agent:
   - Code quality (readability, DRY, KISS, SLAP)
   - Test quality (meaningful tests, proper assertions)
   - Project pattern consistency
   - Type safety

   **Security-Critical Governance** - additionally 1 security review agent:
   - Authentication/authorization correctness
   - PII protection
   - Injection prevention (SQL, command, XSS)
   - OWASP Top 10 compliance

### Step 5: Review Fix

Address all Critical and High findings:
1. Fix issues
2. Re-run all tests
3. Commit fixes with: `fix(scope): address review findings for {name}`

### Step 6: Completion

1. **Create ADR** if architectural decisions were made:
   - `docs/decisions/{NNN}-{topic}.md` using template
2. **Update spec status** to "Implemented"
3. **Update roadmap.md** -- mark item complete, add notes
4. **Commit**: `docs(scope): complete {name} - update roadmap and specs`
5. **Update CLAUDE.md** if development rules or phase changed

## Important Rules

- **Never skip steps.** If a spec changes during implementation, go back to Stage 2a.
- **Invariant IDs are permanent.** Once assigned, never reuse or reassign.
- **Same filename across docs.** `docs/specs/foo.md`, `docs/verification/foo.md`, `docs/test-designs/foo.md` MUST share the same name.
- **P0 test cases are mandatory.** Do not proceed to Step 4 without all P0 tests passing.
- **All cross-references MUST be clickable Markdown links.**

## Start Command Execution

Now, following the 6-step lifecycle above, begin executing the development phase for: `$ARGUMENTS`
