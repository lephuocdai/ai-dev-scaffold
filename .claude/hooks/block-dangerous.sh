#!/bin/bash
# Hook: PreToolUse (Bash)
# Blocks destructive commands that could cause irreversible damage.

COMMAND="$1"

# Patterns to block
DANGEROUS_PATTERNS=(
  "rm -rf /"
  "rm -rf /*"
  "rm -rf ~"
  "git push --force.*main"
  "git push --force.*master"
  "git push -f.*main"
  "git push -f.*master"
  "git reset --hard"
  "git clean -fd"
  "DROP TABLE"
  "DROP DATABASE"
  "TRUNCATE TABLE"
)

for pattern in "${DANGEROUS_PATTERNS[@]}"; do
  if echo "$COMMAND" | grep -qiE "$pattern"; then
    echo "BLOCKED: Dangerous command detected matching pattern: $pattern"
    echo "Command: $COMMAND"
    echo "If you need to run this, ask the user for explicit permission."
    exit 2
  fi
done

exit 0
