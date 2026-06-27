---
description: Scaffold a REST endpoint (controller + service + DTO + tests) following repo rules
argument-hint: <resource> <verb e.g. create|get|list|update|delete>
---

Create a Spring Boot REST endpoint for: **$ARGUMENTS**

Follow the project rules in @.claude/rules/general.md and @.claude/rules/testing.md:

1. **Controller** — thin, constructor-injected, maps to a `@Service`. Validate the request
   DTO with `jakarta.validation` (`@Valid`).
2. **Service** — business logic, `@Transactional` where it writes.
3. **DTOs** — request/response records; never expose JPA entities. Add an explicit mapper.
4. **Error handling** — typed exceptions handled by the central `@RestControllerAdvice`.
5. **Tests** — `@WebMvcTest` + `MockMvc` for the controller; unit tests for the service.
   Use Testcontainers if it touches the database.

Show the new/changed files, then run the test suite and report the result.
