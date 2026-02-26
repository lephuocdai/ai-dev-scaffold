---
description: Conduct deep research before implementing a new technology or approach
argument-hint: '[research topic]'
---

# Deep Research Command

**Usage:** `/research [topic]`

**Purpose:** Conduct structured research before introducing new technologies, patterns, or approaches. Stores results for future reference and decision-making.

## Execution Flow

### 1. Define Research Scope

Create a research prompt document at `docs/research/prompts/{topic}.md`:

```markdown
# Research: {topic}

## Questions to Answer
1. {Primary question}
2. {Secondary questions}

## Constraints
- {Project constraints to consider}

## Evaluation Criteria
- {How to evaluate options}
```

### 2. Conduct Research

Use multiple sources:
- Web search for current best practices
- Official documentation (use context7 MCP if available)
- Comparison with existing project patterns

### 3. Document Findings

Create `docs/research/results/{topic}.md`:

```markdown
# Research Results: {topic}

| Field | Value |
|-------|-------|
| Date | YYYY-MM-DD |
| Prompt | `docs/research/prompts/{topic}.md` |

## Summary

{Key findings in 2-3 paragraphs}

## Options Evaluated

### Option 1: {Name}
- **Pros**: ...
- **Cons**: ...
- **Fit with project**: ...

### Option 2: {Name}
- **Pros**: ...
- **Cons**: ...
- **Fit with project**: ...

## Recommendation

{Recommended approach with justification}

## References

- {Links to documentation, articles, repos}
```

### 4. Next Steps

Based on research, recommend:
- Create an ADR if this leads to an architectural decision
- Update roadmap if this affects project direction
- Proceed to `/next-phase` if ready to implement

## Start Command Execution

Now conduct research on: `$ARGUMENTS`
