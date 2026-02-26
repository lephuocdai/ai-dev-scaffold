# Spec-Driven Development Skill

How to write specifications with invariants, pre/post conditions, and full traceability.

## What is Spec-Driven Development?

The human defines WHAT must be true (spec with invariants). AI implements HOW.

```
Human writes vision/PRD
  -> AI writes detailed spec with invariants
  -> AI verifies spec for consistency (iterates until zero ambiguity)
  -> AI derives test cases from spec
  -> AI implements via TDD from test cases
  -> AI reviews implementation
```

The key insight: **invest time in spec quality to eliminate rework downstream.**

## Writing Good Invariants

### What is an Invariant?

A property that MUST always hold true, regardless of system state.

```
AUTH-INV-001: All API endpoints (except /health and /auth/*) MUST reject
requests without a valid authentication credential.
```

### Good vs Bad Invariants

```
BAD:  "The system should authenticate users"
      - Ambiguous: what does "authenticate" mean exactly?
      - What about unauthenticated endpoints?

GOOD: "AUTH-INV-001: Every request to a protected endpoint MUST include
       a valid JWT in the Authorization header or a valid session cookie.
       Requests without valid credentials MUST receive 401 Unauthorized."
      - Specific: JWT or session cookie
      - Testable: send request without auth, expect 401
      - Complete: covers the negative case
```

### Invariant Writing Checklist

- [ ] Uses "MUST" / "MUST NOT" (not "should")
- [ ] Specifies exact inputs and outputs
- [ ] Covers both positive and negative cases
- [ ] Is independently testable
- [ ] Has a unique ID (never reused)

## Pre/Post Conditions

For each operation, define what must be true before and after:

```markdown
### FR-1: User Login

**Pre-conditions:**
- Email is a valid email format
- Password is at least 8 characters

**Post-conditions:**
- On success: JWT token returned, refresh token stored, last_login updated
- On failure (wrong password): 401 returned, failed_attempts incremented
- On failure (account locked): 429 returned, no state change

**Error cases:**
- Empty email -> 400 "Email is required"
- Invalid email format -> 400 "Invalid email format"
- Unknown email -> 401 "Invalid credentials" (do not reveal email existence)
- Wrong password -> 401 "Invalid credentials"
- Account locked (>5 failures) -> 429 "Account temporarily locked"
```

## Traceability Chain

Every artifact traces back:

```
PRD item "Implement user login"
  -> Spec invariants: AUTH-INV-001, AUTH-INV-002, AUTH-INV-003
  -> Verification: all PASS
  -> Test cases: TC-AUTH-001 through TC-AUTH-012
  -> Code: // Implements AUTH-INV-001
  -> ADR-001: "Chose JWT over session tokens because..."
```

## Language Rules

| Do NOT write | Write instead |
|-------------|---------------|
| "should" | "MUST" or "MUST NOT" |
| "might" | "MUST" or "is not required to" |
| "usually" | State the exact condition |
| "a few" | Exact number |
| "quickly" | Specific time bound (e.g., "within 200ms") |
| "secure" | Specific security measure (e.g., "encrypted with AES-256-GCM") |

## The 2a-2b Iteration Loop

Specs are NOT one-shot. The critical innovation from this methodology:

```
Stage 2a: Write spec (spec-writer agent)
    |
    v
Stage 2b: Verify spec (formal-verifier agent)
    |
    ├── PASS -> Proceed to test design
    |
    └── FAIL -> Return to 2a with specific issues
         (iterate until zero ambiguity)
```

This loop catches contradictions, ambiguities, and gaps BEFORE any code is written.
