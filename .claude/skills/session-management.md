# Session Management Skill

How to maintain progress across multiple Claude Code sessions (context windows).

Based on Anthropic's research on effective harnesses for long-running agents.

## The Problem

Each new Claude Code session starts with no memory of previous sessions (beyond what's in files). For multi-session projects, progress can be lost or duplicated.

## Session Startup Protocol

Every session should begin with:

1. **Orient**: Read `CLAUDE.md` for project context
2. **Check progress**: Read `roadmap.md` for current phase and status
3. **Review recent work**: `git log --oneline -20` to see recent commits
4. **Check for broken state**: Run the project's test/build commands
5. **Select work**: Pick the highest-priority incomplete item from the roadmap

## Progress Tracking

### Dual tracking approach:

1. **Git commits** with descriptive messages (enables revert and recovery)
2. **Roadmap updates** marking items complete with dates

### Commit as you go
- Commit after each meaningful unit of work
- Never leave a session with uncommitted changes that break the build
- Use descriptive commit messages referencing specs and invariants

## Single-Feature Focus

Per session, focus on ONE roadmap item:
1. Complete the full lifecycle (spec -> verify -> test -> implement -> review)
2. Commit and update roadmap
3. Only then pick the next item

This prevents context exhaustion from juggling multiple features.

## Handoff Documentation

When ending a session with incomplete work:
1. Commit whatever is in a working state
2. Update the roadmap item with status notes
3. Add a TODO comment in code for the next step

## Recovery Protocol

When starting a session and finding broken state:
1. Check `git log` for recent changes
2. Run tests to identify failures
3. Consider `git stash` or `git revert` to restore working state
4. Fix issues before starting new work
