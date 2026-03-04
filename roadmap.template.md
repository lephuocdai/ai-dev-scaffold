# {{PROJECT_NAME}} Roadmap

## Vision

{{VISION_STATEMENT}}

## Target Users

{{TARGET_USERS}}

## Anti-Goals

- {{ANTI_GOAL_1}}
- {{ANTI_GOAL_2}}

## Quality Gates

Quality gates activate progressively as the system gains infrastructure to support them. Each gate has an activation point — once activated, it applies to ALL subsequent items.

| Gate | Activates At | Scope | Frequency |
|------|-------------|-------|-----------|
| Unit tests + lint + typecheck | Always | Every item | Per-item |
| {{GATE_2_NAME}} | {{ACTIVATION_POINT}} | {{SCOPE}} | Per-item |
| Performance benchmarks | {{ACTIVATION_POINT}} | Items with {{PERFORMANCE_SENSITIVE_SCOPE}} | Per-item (conditional) + per-phase |
| {{GATE_4_NAME}} | {{ACTIVATION_POINT}} | {{SCOPE}} | Per-item + per-phase |

**Rules**:
- Once a gate is activated, `/next-phase` Step 3 (Build & Verify) automatically includes it
- Performance benchmarks produce `docs/benchmarks/{item-name}.md` when regressions are found
- Gate failures block item completion — regressions must be fixed before marking `[x]`
- Phase reviews assess ALL active gates, not just unit tests

## Phases

### Phase 0: Foundation

- [ ] 0.1: {{ITEM_TITLE}} — {{DESCRIPTION}}
  - Done: {{VERIFIABLE_ACCEPTANCE_CRITERIA}}
- [ ] 0.2: {{ITEM_TITLE}} — {{DESCRIPTION}}
  - Done: {{VERIFIABLE_ACCEPTANCE_CRITERIA}}

**Exit criteria**: {{PHASE_EXIT_CRITERIA}}

### Phase 1: MVP

- [ ] 1.1: {{ITEM_TITLE}} — {{DESCRIPTION}}
  - Done: {{VERIFIABLE_ACCEPTANCE_CRITERIA}}
- [ ] 1.2: {{ITEM_TITLE}} — {{DESCRIPTION}}
  - Done: {{VERIFIABLE_ACCEPTANCE_CRITERIA}}

**Exit criteria**: {{PHASE_EXIT_CRITERIA}}

### Phase 2: {{THEME}}

- [ ] 2.1: {{ITEM_TITLE}} — {{DESCRIPTION}}
  - Done: {{VERIFIABLE_ACCEPTANCE_CRITERIA}}
- [ ] 2.2: {{ITEM_TITLE}} — {{DESCRIPTION}}
  - Done: {{VERIFIABLE_ACCEPTANCE_CRITERIA}}

**Exit criteria**: {{PHASE_EXIT_CRITERIA}}

## Completed Item Format (reference)

When an item is completed, it should look like this:

```markdown
- [x] N.M: Item title — Description
  - Done: Verifiable acceptance criteria
  - [Plan](docs/plans/{name}.md) | [Acceptance Criteria](docs/acceptance-criteria/{name}.md)
  - [Spec](docs/specs/{name}.md) | [Test Design](docs/test-designs/{name}.md) | [Verification](docs/verification/{name}.md)
  - [Benchmark](docs/benchmarks/{name}.md)  <!-- only if produced -->
```

## Phase Review Log

| Phase | Date | Reviewer | Result | Report |
|-------|------|----------|--------|--------|
| | | | | |
