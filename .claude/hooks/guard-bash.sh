#!/usr/bin/env bash
# PreToolUse(Bash): block push/deploy/publish. Exit 2 feeds the message back to Claude.
set -uo pipefail

cmd=$(python3 -c "import json,sys; print(json.load(sys.stdin).get('tool_input',{}).get('command',''))" 2>/dev/null) || exit 0

if printf '%s' "$cmd" | grep -Eq '(^|[;&| ])git +push|mvn +([^;]* )?deploy|gradle[a-z]* +([^;]* )?publish'; then
  echo "Blocked: \"$cmd\" pushes or publishes. Per repo policy, do not push/deploy unless the user explicitly asked — confirm first, then they can run it manually." >&2
  exit 2
fi
exit 0
