# Phase Review Verification Enforcement (Always Active)

This rule has NO path filter — it applies to EVERY conversation turn involving phase reviews.

## STOP-AND-VERIFY: Before Declaring Any Phase Review Verdict

When conducting a phase review or evaluating phase completion, you MUST complete ALL verification steps before declaring a verdict. A verdict declared without actual execution of verification steps is invalid.

### Mandatory verification tiers

The following verification tiers MUST be executed. If any applicable tier cannot be executed, you MUST resolve the blocking condition before proceeding — never skip or defer.

#### Tier 1: Unit Tests + Lint + Typecheck

- **Command**: `{{TEST_CMD}}` / `{{LINT_CMD}}` / `{{TYPECHECK_CMD}}`
- **Applies to**: All phases
- **If failing**: Fix before proceeding. Test failures block verdicts.

#### Tier 2: Integration Tests (if applicable)

- **Command**: `{{INTEGRATION_TEST_CMD}}`
- **Applies to**: Phases with database access, external service integration
- **If infrastructure unavailable**: Ask the user to start required services. Never skip with "infrastructure unavailable" if you haven't attempted to resolve it.

#### Tier 3: Performance Benchmarks (if quality gate active)

- **Command**: `{{BENCHMARK_CMD}}`
- **Applies to**: After the performance benchmark quality gate activates (see roadmap.md)
- **If timeout**: Increase timeout and retry. Do NOT stop and move on.
- **Never**: Write "results will be documented separately" — this is deferral, not verification.

#### Tier 4: E2E Tests (if quality gate active)

- **Command**: `{{E2E_TEST_CMD}}`
- **Applies to**: After the E2E quality gate activates (see roadmap.md)
- **If tests have never been run**: Run them — bugs found on first execution are valuable findings.
- **Never**: Declare tests "created but not executed" as acceptable — creation without execution is not verification.

### Verdict rules

- **PASS**: ALL applicable tiers executed successfully, results documented
- **PASS with observations**: All applicable tiers executed, non-blocking issues found
- **FAIL**: Any tier has blocking failures
- **INVALID**: Any applicable tier was not executed — a verdict CANNOT be issued

### What "not executed" means

A tier is "not executed" if:
- The command was never run
- The command timed out and was stopped without retry
- The command ran without required credentials or infrastructure
- The results were described as "deferred" or "to be documented separately"

### Escalation protocol

If a verification tier genuinely cannot be executed after attempting all resolution steps:
1. Document the specific blocking reason
2. Document all resolution attempts made
3. Ask the user for guidance — do NOT make the decision to skip unilaterally
4. Record the user's decision in the review document

### Phase review document location

Phase review reports MUST be saved to:
- `docs/phase-reviews/phase-{N}-review.md`

### Phase review coverage

The review MUST cover:
1. Architecture consistency across all phase items
2. Quality & testing assessment (invariant coverage, test case status)
3. Performance assessment (benchmarks if applicable)
4. Traceability chain integrity
5. Process & workflow evaluation
6. Next phase outlook with roadmap recommendations
7. Observations summary with severity ratings and recommended actions

### Why this rule exists

A phase review that doesn't actually verify is not a review — it's a checklist with unchecked boxes marked as done. Verification failures (timeout, missing credentials) are problems to solve before proceeding, not acceptable reasons to defer.

### Trigger keywords

This rule activates when the conversation contains ANY of:
- "phase review", "phase completion review"
- "verdict", "PASS", "FAIL" in the context of phase assessment
- Writing to `docs/phase-reviews/`
