#!/usr/bin/env bash
# PreToolUse(Edit|Write): block writes to secret/env files. Exit 2 feeds the message back to Claude.
set -uo pipefail

file=$(python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input',{}).get('file_path',''))" 2>/dev/null) || exit 0

case "$file" in
  *.env|*/.env|*.env.*|*secrets/*|*/application-*.yml|*/application-*.yaml)
    echo "Blocked: \"$file\" may contain secrets or env-specific config. Edit it manually outside Claude." >&2
    exit 2 ;;
esac
exit 0
