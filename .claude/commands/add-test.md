---
description: Generate or extend tests for a class or recent change following testing rules
argument-hint: <ClassName or path; defaults to the current diff>
---

Add tests for: **$ARGUMENTS** (if empty, cover the current `git diff`).

Follow @.claude/rules/testing.md:

- JUnit 5 + Mockito; mock collaborators, one logical assertion focus per test.
- `@WebMvcTest` + `MockMvc` for controllers; `@SpringBootTest` + Testcontainers for DB/integration.
- Name tests `should<Behavior>_when<Condition>`. Cover happy path, validation failures, and edge cases.
- Deterministic only — no real network, no `Thread.sleep`, inject a fixed `Clock`.

Write the tests, then run the suite and report pass/fail.
