# General rules

- Match the style and conventions of surrounding code; prefer small, focused changes.
- Constructor injection only — no field `@Autowired`.
- Controllers stay thin; business logic lives in `@Service` classes.
- Expose DTOs over the API, never JPA entities. Map explicitly (MapStruct or a mapper class).
- Validate request DTOs with `jakarta.validation` annotations (`@Valid`, `@NotNull`, ...).
- Throw typed exceptions; handle them centrally via `@RestControllerAdvice`. No swallowed exceptions.
- Never log secrets, tokens, PII, or full request/response bodies.
- Keep `application.yml` env-agnostic; environment values come from env vars / config server.
