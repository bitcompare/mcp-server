# @bitcompare/mcp-server

The official **crypto yield data MCP server**: native Claude access to live and historical crypto lending, savings, staking, borrowing, stablecoin, price, coin metadata, and market data. Built on [Model Context Protocol](https://modelcontextprotocol.io) — works with Claude Desktop, Claude Code, Claude.ai, and any MCP-compatible agent.

**One npm install, twenty-one tools, one API key.**

```bash
npx -y @bitcompare/mcp-server
```

**Free API keys can call get_rates, get_rate_by_symbol and list_providers (30 requests/minute, 10,000/month). Every other tool, including get_rate_history, needs a paid plan (Starter at $49/mo or above).** Sign up at <https://auth.bitcompare.net/pro/signup>. Requires npm 1.2.0 or later; 1.1.0 has 18 tools and only works with Pro or Enterprise.

## What you get

21 read-only tools. Calls use the same API key and request quotas as REST:

- **Crypto yield data** — current & historical lending, borrowing, savings, and staking APYs across CeFi and DeFi providers
- **Coins** — metadata, price history, similar coins, and top-by-market-cap lookups
- **Prices** — aggregated exchange prices with median + outlier filtering
- **Global market stats** — total market cap, dominance, Fear & Greed Index, 24h top movers
- **Stablecoin data** — peg deviation leaderboard, historical drift, and yield comparison
- **Symbol resolution** — map exchange-specific tickers (`BTC`, `XBT`, `wBTC`) to canonical coin IDs

Full tool catalog: <https://www.bitcompare.net/mcp> · machine-readable: <https://api.bitcompare.net/mcp/tools.json> · agent manifest: <https://api.bitcompare.net/llms.txt>.

## Install

You don't need to install it — run via `npx`:

```bash
BITCOMPARE_API_KEY=ck_live_... npx @bitcompare/mcp-server --test
```

## Configure Claude Desktop

Edit `claude_desktop_config.json` (macOS: `~/Library/Application Support/Claude/claude_desktop_config.json`):

```json
{
  "mcpServers": {
    "bitcompare": {
      "command": "npx",
      "args": ["-y", "@bitcompare/mcp-server"],
      "env": {
        "BITCOMPARE_API_KEY": "ck_live_..."
      }
    }
  }
}
```

Restart Claude Desktop. Ask "what's the best yield on BTC right now?" — Claude will call `get_rates` and answer from live data.

## Configure Claude Code

In your project's `.claude/settings.local.json`:

```json
{
  "mcpServers": {
    "bitcompare": {
      "command": "npx",
      "args": ["-y", "@bitcompare/mcp-server"],
      "env": {
        "BITCOMPARE_API_KEY": "ck_live_..."
      }
    }
  }
}
```

## Hosted alternative

If you prefer not to install anything, we also run the MCP server at `https://api.bitcompare.net/mcp` over Streamable HTTP. Point your MCP client at that URL with an `Authorization: Bearer ck_live_*` header.

## Docker

A container is provided for hosted introspection (e.g. Glama). It installs the published npm package and runs the server over stdio:

```bash
docker build -t bitcompare-mcp .
docker run -i -e BITCOMPARE_API_KEY=ck_live_... bitcompare-mcp
```

`tools/list` introspection works without a key; tool **calls** need a valid `ck_live_` key: Free keys can call the three Free tools, and paid plans (Starter or above) can call all 21.

## CLI flags

- `--test` — validate your key and list available tools, then exit
- `--version` — print version
- `--help` — print help
- `--base-url <url>` — override API base URL (for staging/dev)

## Source

The server is developed in the Bitcompare services monorepo and published to npm as [`@bitcompare/mcp-server`](https://www.npmjs.com/package/@bitcompare/mcp-server). This repository mirrors the published package and its container for public discovery and hosted introspection.

## Support

- Documentation: <https://www.bitcompare.net/mcp>
- Issues: <https://github.com/bitcompare/mcp-server/issues>
- Email: <support@bitcompare.net>

## License

MIT — see [LICENSE](./LICENSE).
