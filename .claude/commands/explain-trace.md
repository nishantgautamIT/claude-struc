---
description: Explain a stack trace / exception and find its root cause in the code
argument-hint: <paste stack trace, or a Sentry issue URL/ID>
allowed-tools: Read, Grep, Glob, Task
---

Diagnose this error: **$ARGUMENTS**

1. If a Sentry issue URL/ID is given, pull its details via the Sentry MCP (frequency,
   releases, breadcrumbs). If a raw trace is pasted, parse it directly.
2. Locate the throwing code in this repo and read the relevant frames.
3. Explain the root cause in plain terms, then propose a concrete fix (and a regression test).

For a live production incident with metrics/latency impact, prefer the
**incident-investigator** subagent instead.
