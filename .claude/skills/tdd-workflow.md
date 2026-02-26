# TDD Workflow Skill

Test-Driven Development methodology adapted for AI-driven development.

## The t-wada TDD Cycle

### Red -> Green -> Refactor

1. **Red**: Write a failing test first
   - Test describes the desired behavior
   - Run the test -- it MUST fail (proves the test is meaningful)
   - If the test passes without implementation, the test is not testing anything new

2. **Green**: Write the minimum code to pass
   - Only write enough code to make the failing test pass
   - Do not add extra logic "just in case"
   - Do not optimize prematurely

3. **Refactor**: Improve structure while keeping tests green
   - Remove duplication
   - Improve naming
   - Extract helpers/utilities
   - All tests MUST remain green throughout refactoring

### Key Principles

- **Tests are the spec**: When following the `/next-phase` lifecycle, tests come FROM the test design, which comes FROM the spec. Tests are not invented.
- **Never change test expectations during refactor**: Test expectations are the contract. If a test needs to change, that is a spec change (go back to Step 2).
- **One behavior per test**: Each test verifies one specific behavior.
- **Fast feedback**: Tests should run fast. Mock external dependencies.

## TDD Techniques

### Assert First
Write the assertion first, then work backward to setup:
```
// Start with: expect(result).toBe(expected)
// Then add: const result = doSomething(input)
// Then add: const input = createInput(...)
```

### Triangulation
Use multiple examples to drive toward a general solution:
- First test: simple case with hardcoded result
- Second test: different input forces actual implementation
- Third test: edge case refines the solution

### Fake It Till You Make It
Start with the simplest possible implementation (even hardcoded), then generalize through triangulation.

### One Step Test
Choose the next test that requires the smallest incremental change to the implementation.

## TDD with Spec-Driven Development

When using the full `/next-phase` lifecycle:

```
Spec (invariants) -> Test Design (test cases) -> TDD (implementation)

TC-AUTH-001 (from test design)
  -> Red: Write test for AUTH-INV-001
  -> Green: Implement minimum to pass
  -> Refactor: Clean up, add code comment: // Implements AUTH-INV-001
```

## When to Apply TDD

| Scenario | TDD Approach |
|----------|-------------|
| New feature | Full Red/Green/Refactor from test design |
| Bug fix | Red: Write test that reproduces bug -> Green: Fix it -> Refactor |
| Refactor | Ensure test coverage first -> Refactor while keeping green |
| Spike/Prototype | TDD optional, but add tests before merging |

## Anti-Patterns to Avoid

- Writing tests AFTER implementation (test-after is not TDD)
- Writing too many tests before implementing (write one at a time)
- Making tests pass by hardcoding return values (except as temporary Green step)
- Testing implementation details instead of behavior
- Skipping the refactor phase
