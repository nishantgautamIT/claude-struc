# Project Guide

> Shared instructions for Claude Code in this repo. Keep it short and high-signal —
> everything here is loaded into context on every session.

## Overview

Spring Boot microservice (Java 21, Spring Boot 3.x). REST APIs over HTTP, packaged as a
container image and deployed to Kubernetes. Observability via Datadog (APM + logs + metrics).

<!-- Replace with this service's name and one line on what it owns. -->

## Setup & commands

Maven (delete this block if you use Gradle):

- Build: `mvn clean package`
- Run locally: `mvn spring-boot:run`
- Test: `mvn test`
- Single test: `mvn test -Dtest=ClassName#method`
- Format/lint: `mvn spotless:apply` (or `mvn checkstyle:check`)

Gradle (delete this block if you use Maven):

- Build: `./gradlew build`
- Run locally: `./gradlew bootRun`
- Test: `./gradlew test`
- Single test: `./gradlew test --tests "ClassName.method"`

## Conventions

- Layering: `controller` → `service` → `repository`. Keep controllers thin; business logic in services.
- DTOs for all API request/response bodies — never expose JPA entities over the wire.
- Constructor injection only (no field `@Autowired`).
- Configuration via `application.yml` + `@ConfigurationProperties`; never hardcode env-specific values.
- Use `slf4j` (`@Slf4j`) for logging; structured key-value where possible for Datadog parsing.

## Rules

Detailed rules live in `.claude/rules/` and are referenced below so they load into context:

- @.claude/rules/general.md
- @.claude/rules/testing.md
- @.claude/rules/observability.md

## MCP servers

Configured in `.mcp.json` (Datadog, GitHub, Atlassian/Jira, Sentry, Postgres).
Required env vars must be exported before launch — see `CLAUDE.local.md` for the list.

## Do / Don't

- Do: run `mvn test` (or `./gradlew test`) before claiming a change works.
- Do: add/adjust tests for every behavior change.
- Don't: commit or push unless explicitly asked.
- Don't: log secrets, tokens, PII, or full request bodies.
