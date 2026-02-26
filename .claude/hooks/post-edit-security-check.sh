#!/bin/bash
# Hook: PostToolUse (Edit|Write)
# Warns when editing security-sensitive files or introducing dangerous patterns.

FILE="$1"

# Check 1: Security-sensitive paths
SENSITIVE_PATHS="auth|vault|crypto|secret|credential|token|session|security|password|oauth|oidc"
if echo "$FILE" | grep -qiE "$SENSITIVE_PATHS"; then
  echo "WARNING: Editing security-sensitive file: $FILE"
  echo "Ensure this change is covered by a Security-Critical spec and has STRIDE threat analysis."
fi

# Check 2: Dangerous patterns in the edited file
if [ -f "$FILE" ]; then
  DANGEROUS_FOUND=false

  # Hardcoded secrets patterns
  if grep -qE "(api[_-]?key|secret|password|token)\s*[:=]\s*['\"][^'\"]{8,}" "$FILE" 2>/dev/null; then
    echo "WARNING: Possible hardcoded secret detected in $FILE"
    DANGEROUS_FOUND=true
  fi

  # Dangerous function calls
  if grep -qE "eval\(|innerHTML\s*=|document\.write\(|exec\(|__import__" "$FILE" 2>/dev/null; then
    echo "WARNING: Dangerous function call detected in $FILE"
    DANGEROUS_FOUND=true
  fi

  # HTTP (not HTTPS)
  if grep -qE "http://[^l]" "$FILE" 2>/dev/null; then
    echo "WARNING: Non-HTTPS URL detected in $FILE (excluding localhost)"
    DANGEROUS_FOUND=true
  fi

  if [ "$DANGEROUS_FOUND" = true ]; then
    echo "Review these patterns before committing."
  fi
fi

# Check 3: Spec existence check for implementation files
IMPL_EXTENSIONS="\.ts$|\.tsx$|\.js$|\.jsx$|\.py$|\.rs$|\.go$|\.java$|\.kt$|\.swift$"
if echo "$FILE" | grep -qE "$IMPL_EXTENSIONS"; then
  # Skip test files
  if ! echo "$FILE" | grep -qiE "test|spec|__test__|_test\." ; then
    SPECS_DIR="docs/specs"
    if [ -d "$SPECS_DIR" ] && [ "$(ls -A "$SPECS_DIR" 2>/dev/null | grep -v README)" = "" ]; then
      echo "NOTE: No specs found in $SPECS_DIR. Consider writing a spec before implementing."
    fi
  fi
fi

exit 0
