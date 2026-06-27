---
description: Commit the current changes, push the branch, and open a PR
argument-hint: [optional: PR title]
allowed-tools: Bash(git status), Bash(git diff:*), Bash(git add:*), Bash(git commit:*), Bash(git branch:*), Bash(git checkout:*), Bash(gh pr create:*)
---

Open a pull request for the current work. Title: $ARGUMENTS (infer a good one if empty).

Steps:
1. If on the default branch, create a feature branch first.
2. Stage and commit with a clear message (end with the project's Co-Authored-By trailer).
3. Push the branch. Pushing is intended here — set `CS_ALLOW_PUSH=1` for the push command
   so the guard-bash hook allows it.
4. `gh pr create` with a concise body: **What / Why / Testing**.

Report the PR URL. Do not merge.
