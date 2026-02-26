# Git Operations Rules

## Commit Message Format

Follow [Conventional Commits 1.0.0](https://www.conventionalcommits.org/):

```
<type>(<scope>): <description>

[optional body]

[optional footer(s)]
```

### Types

| Type | Description |
|------|-------------|
| `feat` | New feature |
| `fix` | Bug fix |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `docs` | Documentation only changes |
| `style` | Code style changes (formatting, missing semicolons, etc.) |
| `test` | Adding or updating tests |
| `chore` | Build process or auxiliary tool changes |
| `perf` | Performance improvement |
| `ci` | CI configuration changes |

### Examples

```
feat(auth): add JWT refresh token rotation

fix(api): handle null response in user profile endpoint

refactor(services): extract API error handling into utility

test(auth): add unit tests for login flow
```

### AI-Generated Commits

For commits made with Claude Code assistance, include:

```
feat(scope): description

Co-Authored-By: Claude <noreply@anthropic.com>
```

## Branch Naming

Format: `<type>/issue-<number>/<brief-description>`

| Type | Use Case |
|------|----------|
| `feature/` | New features |
| `fix/` | Bug fixes |
| `chore/` | Maintenance tasks |
| `refactor/` | Code refactoring |
| `docs/` | Documentation |

## Pull Request Guidelines

### Before Creating PR

1. Ensure all tests pass
2. Ensure linting passes
3. Ensure type checking passes
4. Keep diff size manageable (target: <300 lines changed)

### PR Title

Follow commit message format: `feat(scope): clear description of changes`

## Don'ts

- Don't force push to shared branches
- Don't commit directly to `main`
- Don't include secrets or credentials
- Don't create empty commits
- Don't use `-i` (interactive) flags in automated contexts
