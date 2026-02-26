#!/bin/bash
# AI-Dev Scaffold - Quick Setup
# Copies the universal methodology files into the current project.
# For full customization (CLAUDE.md, stack-specific agents), use the
# /scaffold-project skill in Claude Code instead.

set -euo pipefail

TEMPLATE_DIR="$HOME/.claude/templates/ai-dev-scaffold"
TARGET_DIR="${1:-.}"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "Error: Template directory not found at $TEMPLATE_DIR"
  echo "Please ensure the scaffold template is installed."
  exit 1
fi

echo "AI-Dev Scaffold Setup"
echo "====================="
echo "Template: $TEMPLATE_DIR"
echo "Target:   $(cd "$TARGET_DIR" && pwd)"
echo ""

# Files to copy (Layer 1 - Universal)
LAYER1_FILES=(
  "docs/specs/README.md"
  "docs/verification/README.md"
  "docs/test-designs/README.md"
  "docs/decisions/README.md"
  ".claude/commands/next-phase.md"
  ".claude/commands/verify-spec.md"
  ".claude/commands/test-design.md"
  ".claude/commands/pr-create.md"
  ".claude/commands/code-review.md"
  ".claude/commands/solve-issue.md"
  ".claude/commands/prompt.md"
  ".claude/agents/context-engineer.md"
  ".claude/rules/testing.md"
  ".claude/rules/git.md"
  ".claude/rules/review-criteria.md"
  ".claude/rules/spec-verification.md"
  ".claude/skills/tdd-workflow.md"
  ".claude/skills/spec-driven-dev.md"
  ".claude/skills/domain-knowledge.md"
)

created=0
skipped=0

for file in "${LAYER1_FILES[@]}"; do
  target="$TARGET_DIR/$file"
  source="$TEMPLATE_DIR/$file"

  if [ -f "$target" ]; then
    echo "  SKIP  $file (already exists)"
    ((skipped++))
  elif [ -f "$source" ]; then
    mkdir -p "$(dirname "$target")"
    cp "$source" "$target"
    echo "  CREATE $file"
    ((created++))
  else
    echo "  WARN  $file (template not found)"
  fi
done

# Create 01_specs/ directory if it doesn't exist
if [ ! -d "$TARGET_DIR/01_specs" ]; then
  mkdir -p "$TARGET_DIR/01_specs"
  echo "  CREATE 01_specs/"
  ((created++))
fi

echo ""
echo "Done! Created $created files, skipped $skipped existing files."
echo ""
echo "Next steps:"
echo "  1. Customize CLAUDE.md with your project details"
echo "  2. Fill in .claude/skills/domain-knowledge.md"
echo "  3. Define invariant ID prefixes in CLAUDE.md"
echo "  4. Write your first PRD in 01_specs/"
echo "  5. Run /next-phase to start the development lifecycle"
echo ""
echo "For full customization (CLAUDE.md generation, stack-specific agents):"
echo "  Use /scaffold-project in Claude Code"
