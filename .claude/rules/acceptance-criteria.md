# Acceptance Criteria Workflow

Automatically applied when executing development lifecycle commands.

## Rule: Every roadmap item MUST have acceptance criteria documented

Every roadmap item, regardless of verification method, MUST have acceptance criteria:
- `docs/acceptance-criteria/{item-name}.md`

Acceptance criteria follow the template at `docs/acceptance-criteria/TEMPLATE.md`.

**Why**: Even code-level-only items need explicit, documented acceptance criteria. Without them, "done" is ambiguous and review has no reference point. The verification method differs (unit tests vs curl vs browser), but the criteria MUST always be written down.

## Rule: Verification timing MUST be declared

Each acceptance criteria document's "User Verification Timing" section MUST specify:
1. When the feature is code-level verifiable (unit tests)
2. When the feature becomes externally verifiable (if applicable)
3. The verification method

## Rule: `/next-phase` completion MUST validate acceptance criteria exist

Before marking an item complete in Step 6, verify:
1. Acceptance criteria document exists
2. Verification timing is declared
3. Verification steps are specific enough to execute without ambiguity

## Rule: Roadmap items MUST include acceptance criteria links

When `/next-phase` Step 6 marks an item as `[x]`, it MUST append an `[Acceptance Criteria](docs/acceptance-criteria/{name}.md)` link below the checkbox line.

## Rule: Acceptance criteria are written BEFORE implementation

Acceptance criteria MUST be created during Step 1 (Planning), not after implementation. They define "done" before work begins.
