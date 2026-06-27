---
description: Create a Flyway/Liquibase database migration following repo conventions
argument-hint: <description e.g. "add status column to orders">
---

Create a database migration for: **$ARGUMENTS**

1. Detect the tool in use (Flyway `src/main/resources/db/migration/` or Liquibase changelog).
2. Create the next versioned migration file with the correct naming
   (Flyway: `V<next>__<snake_case_desc>.sql`).
3. Write forward-only, idempotent-where-sensible SQL. Note any backfill or locking concern
   for large tables.
4. If JPA entities or repositories must change to match, update them and add/adjust tests
   (Testcontainers against real Postgres per @.claude/rules/testing.md).

Show the migration and any code changes; don't run it against a live DB.
