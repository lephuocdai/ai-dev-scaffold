# BUG-{NNN}: {Short Title}

## Metadata

| Field             | Value                                 |
|-------------------|---------------------------------------|
| **ID**            | BUG-{NNN}                             |
| **Severity**      | Critical / High / Medium / Low        |
| **Status**        | Open / In Progress / Fixed / Verified |
| **Discovered**    | YYYY-MM-DD                            |
| **Fixed**         | YYYY-MM-DD (or blank)                 |
| **Verified**      | YYYY-MM-DD (or blank)                 |
| **Phase**         | Phase {N}                             |
| **Linked Item**   | {roadmap item, if applicable}         |

## Discovery Context

What was being tested when the bug was found (manual test, E2E test, phase review, etc.).

## Steps to Reproduce

1. Step one
2. Step two
3. Step three

## Expected Behavior

What should happen.

## Actual Behavior

What actually happens.

## Root Cause

Technical explanation of why the bug occurs.

## Process Gap Analysis

Why did existing process (specs, test designs, verification) not catch this bug?

- **Was this behavior specified?** (Yes/No — cite the spec section or note its absence)
- **Was there a test case?** (Yes/No — cite the TC ID or note its absence)
- **What process gap allowed the bug?** (e.g., spec did not cover edge case X)
- **Is this gap systemic?** (Yes/No — if yes, propose rule updates)

## Prevention Measures

What changes to process, specs, test designs, or rules would prevent this class of bug?

1. Measure one
2. Measure two

## Fix Approach

Describe the planned fix before implementing. Include affected files and the transformation logic.

## Fix

### Changed Files

| File | Change Description |
|------|--------------------|
| `path/to/file` | Description of change |

### Code Change Summary

Brief description of the fix approach.

## Re-Verification

### Automated Tests

```
Command: {{TEST_CMD}}
Result: PASS / FAIL
```

### Manual Verification

Steps taken to verify the fix manually, with evidence (screenshots, headers, logs).

## User Verification Request

Steps for the user to manually verify the fix:

1. Step one
2. Step two
3. Step three

**User confirmed**: [ ] Yes / [ ] No — Date: ____

## Linked Artifacts

- Spec: `docs/specs/{name}.md` (if applicable)
- Verification: `docs/verification/{name}.md` (if applicable)
- Commit: `{commit hash}`
- PR: `#{PR number}`
