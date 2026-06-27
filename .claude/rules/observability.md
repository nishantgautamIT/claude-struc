# Observability rules (Datadog)

- Use `slf4j` (`@Slf4j`). Log structured key-value pairs so Datadog can parse facets,
  e.g. `log.info("order created orderId={} amount={}", id, amount)`.
- Propagate trace context: rely on `dd-java-agent` auto-instrumentation; don't hand-roll spans
  unless adding a meaningful custom span. Add `@Trace` only for hot custom paths.
- Every inbound request and outbound call should carry correlation/trace IDs — never strip MDC.
- Emit custom business metrics via Micrometer (`MeterRegistry`), not ad-hoc counters.
- Log levels: `ERROR` = actionable/paged, `WARN` = degraded-but-handled, `INFO` = lifecycle,
  `DEBUG` = local only. No `INFO` spam in hot loops.
- Never log secrets, tokens, or PII (see general rules) — Datadog logs are widely accessible.
- When investigating incidents, prefer the `datadog` and `sentry` MCP servers to read live
  telemetry rather than guessing from code.
