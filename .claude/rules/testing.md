# Testing rules

- Every behavior change needs a test. Run the suite before claiming a change works.
- Unit tests: JUnit 5 + Mockito. Mock collaborators; one logical assertion focus per test.
- Web layer: `@WebMvcTest` with `MockMvc` for controllers.
- Persistence/integration: `@SpringBootTest` + Testcontainers for real Postgres — no H2 stand-ins
  for DB-specific behavior.
- Name tests `should<Behavior>_when<Condition>`.
- Don't assert on log output; assert on returned values, state, and interactions.
- Keep tests deterministic — no real network, no `Thread.sleep`, fixed clocks via `Clock` injection.
