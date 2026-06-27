#!/usr/bin/env bash
# PostToolUse(Edit|Write): auto-format an edited Java file with Spotless. Non-fatal.
set -uo pipefail

file=$(python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null) || exit 0

case "$file" in
  *.java) ;;
  *) exit 0 ;;
esac
[ -f "$file" ] || exit 0

proj="${CLAUDE_PROJECT_DIR:-.}"
if [ -f "$proj/pom.xml" ]; then
  # Escape regex metachars in the path for -DspotlessFiles.
  esc=$(printf '%s' "$file" | sed 's/[].[*^$\/]/\\&/g')
  mvn -q -f "$proj/pom.xml" spotless:apply -DspotlessFiles="$esc" >/dev/null 2>&1 || true
elif [ -f "$proj/build.gradle" ] || [ -f "$proj/build.gradle.kts" ]; then
  (cd "$proj" && ./gradlew -q spotlessApply >/dev/null 2>&1) || true
fi
exit 0
