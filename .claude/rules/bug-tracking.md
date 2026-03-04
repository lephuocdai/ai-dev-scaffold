# Bug Tracking (Always Active)

This rule has NO path filter — it applies to EVERY conversation turn involving bug discovery.

## Structured Bug Handling Lifecycle

When a bug is found during manual testing, E2E testing, or phase review, follow ALL 10 steps in order:

1. **STOP** — Do not code a fix immediately. Rushing to fix without understanding is how bugs recur.
2. **FILE** — Create a bug report in `docs/bugs/BUG-{NNN}-{short-name}.md` BEFORE applying any fix. Use the template at `docs/bugs/TEMPLATE.md`.
3. **ASSIGN SEVERITY** — Critical (blocks testing/deployment), High (incorrect behavior, workaround exists), Medium (minor incorrect behavior), Low (cosmetic/minor).
4. **INVESTIGATE** — Check existing docs (specs, test designs, verification reports). Ask: Was this behavior specified? Was there a test case that should have caught it? What process gap allowed the bug?
5. **DOCUMENT PREVENTION** — Fill in the "Process Gap Analysis" and "Prevention Measures" sections in the bug report. If the gap is systemic, propose rule updates.
6. **DESIGN FIX** — Document the fix approach in the bug report's "Fix Approach" section before writing code.
7. **IMPLEMENT** — Apply the fix.
8. **VERIFY** — Run automated tests to confirm the fix.
9. **USER CONFIRMATION** — Present the fix for manual verification. Do NOT commit until the user confirms the fix works. Fill in the "User Verification Request" section.
10. **UPDATE & COMMIT** — Mark bug report as Verified, then commit only after user confirmation.

## Bug ID Assignment

Bug IDs are sequential: BUG-001, BUG-002, etc. Check existing files in `docs/bugs/` to determine the next available ID.

## Bug Report Lifecycle

```
Open → In Progress → Fixed → Verified
```

- **Open**: Bug documented, no fix started
- **In Progress**: Fix is being developed
- **Fixed**: Fix applied, awaiting verification
- **Verified**: Fix confirmed working via automated and/or manual testing

## Trigger Keywords

This rule activates when the conversation contains ANY of:
- "bug", "defect", "issue" in the context of discovered problems
- "BUG-" followed by a number
- References to `docs/bugs/`
- "found a bug", "discovered an issue", "not working as expected"
