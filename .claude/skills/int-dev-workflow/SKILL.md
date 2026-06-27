---
name: int-dev-workflow
description: Standard local dev workflow for this Spring Boot service (branch, build, test, commit). Use when starting a task or preparing changes for a PR.
---

# Internal Dev Workflow

1. Branch off the default branch: `git checkout -b feat/<short-name>`.
2. Make a focused change following `.claude/rules/`.
3. Build & test:
   - Maven: `mvn clean verify`
   - Gradle: `./gradlew clean build`
4. Fix all failures and lint/format issues before proceeding (`mvn spotless:apply`).
5. Self-review the diff (`git diff`); ensure DTOs, validation, and tests are in place.
6. Commit with a clear message. Open a PR only when explicitly asked.
