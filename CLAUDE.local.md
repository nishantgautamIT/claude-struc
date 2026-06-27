# Local notes (not committed)

> Personal, machine-specific instructions for Claude Code. Git-ignored.
> Use for local paths, scratch context, or preferences you don't want to share.

## MCP env vars

The `.mcp.json` servers need these exported in your shell (e.g. in `~/.zshrc` or a
gitignored `.env` you `source`). Never paste real values into committed files.

```sh
export DATADOG_API_KEY="..."
export DATADOG_APP_KEY="..."
export DATADOG_MCP_URL="https://mcp.datadoghq.com/api/unstable/mcp-server/mcp"  # adjust for your DD site (eu1/us3/us5)
export GITHUB_TOKEN="ghp_..."          # fine-grained PAT, repo scope
export DATABASE_URL="postgresql://user:pass@localhost:5432/mydb"
```

Atlassian and Sentry use OAuth on first connect (`/mcp` to authenticate) — no env var needed.
