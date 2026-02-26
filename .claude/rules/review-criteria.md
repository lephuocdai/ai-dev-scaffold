# Code Review Criteria

## Priority Levels

- **Critical** - Must be fixed before merge
- **High** - Should be fixed, may require changes
- **Medium** - Recommended improvements
- **Low** - Nice to have, optional

## 1. Architecture & Design (Critical)

- [ ] Single responsibility -- each module does one thing well
- [ ] Clear separation of concerns (UI / business logic / data access)
- [ ] Dependencies are explicit and minimal

## 2. Type Safety (Critical)

- [ ] No `any` types (use `unknown` if truly unknown)
- [ ] Interfaces/types are properly defined
- [ ] API responses have type definitions

## 3. Code Quality (High)

### Readability
- [ ] Variable/function names are descriptive
- [ ] Functions are appropriately sized (<50 lines)
- [ ] Complex logic has explanatory comments
- [ ] Consistent code style

### DRY (Don't Repeat Yourself)
- [ ] No duplicated logic
- [ ] Constants extracted (no magic numbers/strings)

### KISS (Keep It Simple)
- [ ] Simplest solution that works
- [ ] No premature optimization
- [ ] No over-engineering

## 4. SLAP - Single Level of Abstraction (High)

- [ ] Each function operates at a single abstraction level
- [ ] No mixing of high-level orchestration with low-level details
- [ ] Helper functions extracted for lower-level operations

## 5. High Cohesion / Low Coupling (High)

- [ ] Each module has a single, clear responsibility
- [ ] Dependencies are explicit (imports, parameters)
- [ ] No hidden dependencies on global state
- [ ] Can be tested in isolation

## 6. Error Handling (High)

- [ ] Errors handled gracefully at boundaries
- [ ] User-friendly error messages
- [ ] No silently swallowed errors

## 7. Testing (Medium)

- [ ] Critical paths have test coverage
- [ ] Tests are meaningful (not just for coverage)
- [ ] Tests follow given/when/then pattern
- [ ] Edge cases covered

## 8. Security (Critical for Security-Critical governance)

- [ ] No secrets in code or logs
- [ ] Input validation at boundaries
- [ ] No injection vulnerabilities (SQL, XSS, command)
- [ ] Authentication/authorization properly enforced

## 9. Traceability (Medium)

- [ ] Implementation references invariant IDs in comments
- [ ] Test cases reference test design IDs
- [ ] Changes align with the spec

## 10. Positive Feedback (Required)

Every review MUST include positive observations:
- [ ] Identify at least one good pattern or smart decision
- [ ] Be specific about what makes it good
