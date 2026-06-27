---
description: Review the current diff against repo standards via the code-reviewer subagent
argument-hint: [optional: PR number or files to focus on]
allowed-tools: Bash(git diff:*), Bash(git status), Task
---

Current changes:

!`git diff --stat`

Use the **code-reviewer** subagent to review the changes above (focus: $ARGUMENTS if provided,
otherwise the unstaged `git diff`). Report findings grouped as Blocking / Suggestion / Nit
with `file:line` references.
