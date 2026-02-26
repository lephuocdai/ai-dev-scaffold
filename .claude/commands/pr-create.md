---
description: Create PR based on template (args: -c/--commit, -p/--push, --base <branch>)
---

## Command arguments: $ARGUMENTS

## Operation modes

- No argument: Stage all changes, commit and create PR
- `--commit`: Commit only staged changes and create PR
- `--push`: Push committed changes and create PR

## Base branch option

- `--base <branch>`: Specify base branch (default: main)
- Example: `/pr-create --commit --base develop`

## Current status

- Branch: !`git branch --show-current`
- Changed files: !`git diff --name-only | wc -l | tr -d ' '`
- Latest commit: !`git log -1 --oneline`

## Review changes

!`git diff --stat`

## PR template

@.github/pull_request_template.md

## Your task

First, parse the arguments to extract:

- Operation mode (--commit, --push, or none)
- Base branch (from --base argument, default: main)

Then execute the following steps according to the operation mode:

### No arguments (default mode)

1. Check all changes including untracked files (`git status -s`)
2. Stage all changes (`git add -A`)
3. Analyze changes and create descriptive commit message:
   - Use conventional commit format: `type(scope): description`
   - Types: feat, fix, refactor, docs, style, test, chore
   - Keep first line under 72 characters
   - Add detailed body if needed
4. Execute commit with the message
5. Push to remote branch (`git push origin HEAD -u`)
6. Create PR to the specified base branch using gh CLI:
   - Draft PR title from commit messages
   - Fill PR template with relevant information
   - Use `gh pr create --base <base-branch> --title "..." --body "..."`
7. Output the PR URL

### With "-c", "--commit" argument

1. Check staged changes (`git diff --staged`)
2. Analyze changes and create descriptive commit message (same as above)
3. Execute commit
4. Push to remote branch (`git push origin HEAD -u`)
5. Create PR (same as above)
6. Output the PR URL

### With "-p", "--push" argument

1. Check committed changes (`git log origin/<base-branch>..HEAD`)
2. Analyze changes against base branch
3. Push to remote branch (`git push origin HEAD -u`)
4. Create PR using gh CLI (no commit needed)
5. Output the PR URL

## Commit message format

Use conventional commits format:

```
<type>(<scope>): <description>

[optional body]

[optional footer]
```

## Important notes

- Always use `gh pr create` for PR creation
- Ensure PR body follows the template structure (if template exists)
- Include relevant screenshots for UI changes
- Reference related issues in PR body
