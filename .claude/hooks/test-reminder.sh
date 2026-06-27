#!/usr/bin/env bash
# Stop: remind to run tests if Java files are modified in the working tree. Non-blocking.
set -uo pipefail

cd "${CLAUDE_PROJECT_DIR:-.}" 2>/dev/null || exit 0
git rev-parse --git-dir >/dev/null 2>&1 || exit 0

if git diff --name-only 2>/dev/null | grep -q '\.java$'; then
  echo "Reminder: Java files changed — run 'mvn test' (or './gradlew test') before committing."
fi
exit 0
