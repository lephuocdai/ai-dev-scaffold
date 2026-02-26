#!/bin/bash
# AI-Dev Scaffold - Quick Setup
# Copies the methodology files into a target project directory.
# Usage: ./setup.sh /path/to/your-project
#
# This will NOT overwrite existing files. It only creates missing ones.

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGET_DIR="${1:-.}"

if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Target directory does not exist: $TARGET_DIR"
  exit 1
fi

echo "AI-Dev Scaffold Setup"
echo "====================="
echo "Source:  $SCRIPT_DIR"
echo "Target:  $(cd "$TARGET_DIR" && pwd)"
echo ""

# Files to copy
FILES=(
  # Doc templates
  "docs/specs/README.md"
  "docs/verification/README.md"
  "docs/test-designs/README.md"
  "docs/decisions/README.md"
  "docs/plans/README.md"
  "docs/research/README.md"
  # Commands
  ".claude/commands/next-phase.md"
  ".claude/commands/verify-spec.md"
  ".claude/commands/test-design.md"
  ".claude/commands/pr-create.md"
  ".claude/commands/code-review.md"
  ".claude/commands/solve-issue.md"
  ".claude/commands/prompt.md"
  ".claude/commands/research.md"
  # Agents
  ".claude/agents/context-engineer.md"
  ".claude/agents/spec-writer.md"
  ".claude/agents/formal-verifier.md"
  ".claude/agents/test-architect.md"
  ".claude/agents/tdd-practitioner.md"
  ".claude/agents/review-lead.md"
  ".claude/agents/security-reviewer.md"
  # Hooks
  ".claude/hooks/block-dangerous.sh"
  ".claude/hooks/post-edit-security-check.sh"
  # Rules
  ".claude/rules/review-criteria.md"
  ".claude/rules/spec-verification.md"
  ".claude/rules/testing.md"
  ".claude/rules/git.md"
  # Skills
  ".claude/skills/tdd-workflow.md"
  ".claude/skills/spec-driven-dev.md"
  ".claude/skills/domain-knowledge.md"
  ".claude/skills/session-management.md"
  # Settings
  ".claude/settings.json"
  # Templates
  "CLAUDE.template.md"
  "roadmap.template.md"
  # GitHub
  ".github/pull_request_template.md"
)

COPIED=0
SKIPPED=0

for file in "${FILES[@]}"; do
  src="$SCRIPT_DIR/$file"
  dst="$TARGET_DIR/$file"

  if [ ! -f "$src" ]; then
    echo "  MISSING: $file (not in scaffold)"
    continue
  fi

  if [ -f "$dst" ]; then
    echo "  SKIP: $file (already exists)"
    SKIPPED=$((SKIPPED + 1))
  else
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    echo "  COPY: $file"
    COPIED=$((COPIED + 1))
  fi
done

# Make hooks executable
chmod +x "$TARGET_DIR/.claude/hooks/"*.sh 2>/dev/null || true

echo ""
echo "Done! Copied $COPIED files, skipped $SKIPPED existing files."
echo ""
echo "Next steps:"
echo "  1. Rename CLAUDE.template.md to CLAUDE.md and fill in the {{PLACEHOLDERS}}"
echo "  2. Rename roadmap.template.md to roadmap.md and define your phases"
echo "  3. Fill in .claude/skills/domain-knowledge.md with your domain terms"
echo "  4. Define your invariant ID prefixes in CLAUDE.md"
echo "  5. Run '/next-phase your-first-feature' in Claude Code"
