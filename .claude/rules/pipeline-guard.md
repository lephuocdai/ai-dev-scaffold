# Pipeline Guard

Automatically applied when editing code files corresponding to roadmap items.

## Rule: Verify ALL pipeline documents exist before writing code

When editing code files that correspond to a roadmap item:

1. Identify the roadmap item (e.g., `1.1-feature-name`)
2. Verify ALL of the following documents exist before writing ANY code:
   - `docs/plans/{item-name}.md`
   - `docs/acceptance-criteria/{item-name}.md`
   - `docs/specs/{item-name}.md` (code items)
   - `docs/test-designs/{item-name}.md` (code items)
3. If ANY document is missing, **STOP writing code** and create the missing documents first.
   Do NOT proceed with code until all pre-implementation documents exist.

**Why**: Code written before documents lacks an audit trail. Specs define invariants before code, test designs ensure systematic coverage, and acceptance criteria define "done". Skipping documents produces code without verifiable requirements.

## Rule: Mandatory execution order for roadmap items

When a user requests implementation of a roadmap item — whether through `/next-phase`, a plan, direct requests, or iterative improvements — the following sequence MUST be followed:

### Step 1: Pre-implementation documents (BEFORE any code)

Check and create if missing:
1. Plan document (`docs/plans/`)
2. Acceptance criteria document (`docs/acceptance-criteria/`)
3. Spec document (`docs/specs/`) — code items only
4. Test design document (`docs/test-designs/`) — code items only

### Step 2: Implementation

Only after Step 1 is complete:
- Write production code
- Write test code

### Step 3: Verification and operational updates (AFTER code is done)

After implementation and all tests/lint/build pass:
1. Create/update verification report (`docs/verification/`)
2. Update roadmap (`roadmap.md`) — mark `[x]`, append artifact links

**CRITICAL**: Do NOT skip Step 1 even when the user provides a detailed plan in their message. The plan in the user message is input for the plan document — it does not replace the document. Do NOT skip Step 3 — verification and roadmap updates are part of the deliverable, not optional follow-up.

## Exceptions

- Non-roadmap files (features unrelated to roadmap items) are not subject to this rule.
- Quick fixes and patches that don't correspond to a roadmap item may bypass this guard, but MUST still have a bug report if they fix a bug (see `bug-tracking.md`).
