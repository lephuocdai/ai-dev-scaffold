---
description: Solve GitHub issue end-to-end (args: issue number)
argument-hint: '[issue-number]'
---

# Solve GitHub Issue Command

**Usage:** `/solve-issue [issue-number]`

**Purpose:** Complete GitHub issue resolution workflow from branch creation to PR

## Execution Flow

### 1. Create Feature Branch

- Check current branch (`git branch --show-current`)
- If on main/develop, create feature branch:
  - Format: `feature/issue-$ARGUMENTS/brief-description`
  - Use `git checkout -b feature/issue-$ARGUMENTS/brief-description`

### 2. Fetch Issue Details

```bash
gh issue view $ARGUMENTS
```

Extract from issue:

- Title
- Description
- Acceptance criteria
- Labels and assignees

### 3. Determine Approach

Based on issue complexity:

- **Simple fix**: Direct implementation with TDD
- **Feature work**: Run `/next-phase` with the issue as input
- **If unclear**: Ask user for guidance

### 4. Implement Solution

Based on issue content:

- Understand requirements thoroughly
- Identify files that need changes
- Follow project conventions (see CLAUDE.md and .claude/rules/)
- Implement solution step by step
- Test changes locally

### 5. Verify Quality

Before committing, ensure:

- [ ] Code follows project style
- [ ] Type checking passes
- [ ] No linting errors
- [ ] All tests pass (existing and new)
- [ ] Application runs without errors
- [ ] Changes match issue requirements

### 6. Create PR

Use `/pr-create` command to:

- Commit changes with appropriate message
- Push to remote
- Create PR referencing the issue
- PR body includes: "Closes #$ARGUMENTS"

## Important Notes

- Always read issue details carefully before implementing
- For complex issues, use `/next-phase` to follow the full lifecycle
- Test thoroughly before creating PR
- Follow conventional commit message format
- If issue is unclear, ask for clarification before implementing
