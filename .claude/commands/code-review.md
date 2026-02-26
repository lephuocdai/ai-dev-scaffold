---
description: Review current changes against the review criteria before committing
---

Review current changes against the review criteria before committing.

## Target

Review these changes in order of priority:

1. Staged changes (`git diff --cached`)
2. If no staged changes, review unstaged changes (`git diff`)
3. If no changes at all, inform user and exit

## Task

You are a senior software engineer reviewing code before commit.

1. Get the diff using `git diff --cached` (or `git diff` if nothing staged)
2. Review each changed file against @.claude/rules/review-criteria.md
3. Check ALL criteria sections systematically
4. For each finding, provide: severity + file:line + issue + suggestion

## Output Format

### Critical Issues

- [severity] `file:line` - Issue description
  - Suggestion: How to fix

### High Priority

- [severity] `file:line` - Issue description
  - Suggestion: How to fix

### Medium Priority

- [severity] `file:line` - Issue description
  - Suggestion: How to fix

### Positives

- Highlight good patterns, clean code, or smart decisions
- Include a tip for further improvement if applicable

### Summary

- **Ready to commit?** Yes / No
- **Reason:** Brief explanation
- **Action items:** List if any blocking issues
