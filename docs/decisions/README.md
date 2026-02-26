# Architecture Decision Records (ADRs)

Record of all significant architectural and design decisions.

## Index

| ADR | Title | Status | Date |
|-----|-------|--------|------|
| (none yet) | | | |

## Naming Convention

```
{NNN}-{topic}.md
```

Examples:
- `001-authentication-strategy.md`
- `002-database-schema-design.md`
- `003-api-versioning.md`

## Template

```markdown
# ADR-{NNN}: {Title}

| Field | Value |
|-------|-------|
| Status | Proposed / Approved / Superseded by ADR-{NNN} |
| Date | YYYY-MM-DD |
| Deciders | {who was involved} |

## Context

What is the issue that we're seeing that is motivating this decision or change?
What technical challenge or requirement drove this?

## Decision

What is the change that we're proposing and/or doing?
Be specific about the approach chosen.

## Alternatives Considered

### Alternative 1: {Name}

- **Pros**: ...
- **Cons**: ...
- **Why rejected**: ...

### Alternative 2: {Name}

- **Pros**: ...
- **Cons**: ...
- **Why rejected**: ...

## Consequences

### Positive

- What becomes easier or possible?

### Negative

- What becomes harder?

### Risks

- What risks does this introduce?

## Related

- Spec: `docs/specs/{name}.md` (if applicable)
- PRD: `01_specs/{name}.md` (if applicable)
- Previous ADR: ADR-{NNN} (if superseding)
```

## When to Create an ADR

Create an ADR when you:

- Choose between multiple technical approaches
- Introduce a new dependency or framework
- Change a fundamental architecture pattern
- Make a security-critical design decision
- Deviate from an established project convention
