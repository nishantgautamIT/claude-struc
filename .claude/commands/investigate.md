---
description: Triage a production alert/error using the incident-investigator subagent (Datadog + Sentry)
argument-hint: <alert description, Sentry issue URL, or symptom>
allowed-tools: Task
---

Investigate this production issue: **$ARGUMENTS**

Use the **incident-investigator** subagent. It should pull live telemetry from Datadog and
Sentry, correlate with the code, and return: Summary → Evidence (with IDs/links) →
Likely root cause → Suggested fix. State confidence and flag any missing access.
