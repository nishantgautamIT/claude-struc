---
name: int-code-review
description: Spring Boot code-review checklist for this repo. Use when reviewing a diff, a PR, or recently written Java code against the team's standards before merging.
---

# Internal Code Review (Spring Boot)

1. Get the diff under review (`git diff`, a PR, or the files named by the user).
2. Check against `.claude/rules/` and `CLAUDE.md`. In particular:
   - Layering respected; controllers thin; constructor injection only.
   - DTOs (not entities) on the API; request validation present.
   - Exceptions typed and handled via `@RestControllerAdvice`; nothing swallowed.
   - Tests added/updated; Testcontainers used for DB integration.
   - No secrets/PII logged; structured logging for Datadog.
   - No N+1 queries; transactions scoped correctly (`@Transactional` on services).
3. Report findings grouped by severity (blocking / suggestion / nit) with `file:line` references.
