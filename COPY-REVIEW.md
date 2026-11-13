# MCP copy review — before → after

This ledger compares the complete PR with `origin/main`, including the existing PR changes carried forward. Each changed copy block is shown exactly; code around strings is retained where needed to identify its source. `∅` means absent. No prices, Stripe settings, plans, or quota configuration are changed.

The hosted release has 21 tools; exactly `get_rates`, `get_rate_by_symbol`, and `list_providers` become Free. All other tools keep their current paid access. npm 1.1.0 / the pinned Docker runtime still have 18 paid-only tools; npm 1.2.0 is prepared, not published. Release copy only after hosted verification.

## README.md

Before → after:

~~~~text
**One npm install, eighteen tools, one API key.**
~~~~

→

~~~~text
**The hosted server exposes 21 read-only tools. The pinned npm 1.1.0 package exposes 18.**
~~~~

Before → after:

~~~~text
**Requires a Bitcompare Pro or Enterprise plan.** Get a `ck_live_*` key at <https://pro.bitcompare.net/dashboard/keys>.
~~~~

→

~~~~text
**Hosted MCP: Free API keys can call get_rates, get_rate_by_symbol and list_providers (30 requests/minute, 10,000/month). Other tools, including get_rate_history, require Pro or Enterprise.** Sign up at <https://auth.bitcompare.net/pro/signup>. The published npm 1.1.0 package still requires Pro or Enterprise; npm 1.2.0 adds the three Free tools and the 21-tool catalog.
~~~~

Before → after:

~~~~text
18 read-only tools, all gated by the same plan limits as REST:
~~~~

→

~~~~text
21 read-only tools on the hosted server; the pinned npm 1.1.0 package has 18. Calls use the same API key and request quotas as REST:
~~~~

Before → after:

~~~~text
- **Coins** — metadata, markets, history, similar coins, and top-by-market-cap lookups
~~~~

→

~~~~text
- **Coins** — metadata, price history, similar coins, and top-by-market-cap lookups
~~~~

Before → after:

~~~~text
`tools/list` introspection works without a key; tool **calls** require a valid `ck_live_` Pro key.
~~~~

→

~~~~text
`tools/list` introspection works without a key; tool **calls** in the pinned npm 1.1.0 image require a valid `ck_live_` Pro or Enterprise key. For Free tools, use the updated hosted endpoint until npm 1.2.0 is published and the Docker pin is updated.
~~~~

## server.json

| Field | Before | After |
| --- | --- | --- |
| /description | "Crypto yield data for AI agents: lending, savings, staking, borrowing & stablecoin rates. 18 tools." | "Crypto yield data for AI agents: lending, staking and stablecoin rates. Free API key for core tools." |
| /version | "1.1.0" | "1.1.1" |
| /packages/0/environmentVariables/0/description | "Bearer API key from https://pro.bitcompare.net/dashboard/keys. Format: ck_live_*. Requires a Pro or Enterprise plan for MCP access." | "Bearer API key from https://auth.bitcompare.net/pro/signup. Format: ck_live_*. The pinned npm 1.1.0 package requires Pro or Enterprise; Free tools need npm 1.2.0 or the updated hosted endpoint." |
| /remotes/0/variables/apiKey/description | "Bearer API key from https://pro.bitcompare.net/dashboard/keys. Format: ck_live_*. Requires a Pro or Enterprise plan for MCP access." | "Bitcompare API key (ck_live_...). Free key at https://auth.bitcompare.net/pro/signup unlocks get_rates, get_rate_by_symbol, list_providers; other tools require Pro or Enterprise." |
| /title | ∅ (absent) | "Bitcompare" |
| /icons/0/src | ∅ (absent) | "https://bitcompare.net/icon/192" |
| /icons/0/mimeType | ∅ (absent) | "image/png" |
| /icons/0/sizes/0 | ∅ (absent) | "192x192" |
| /icons/1/src | ∅ (absent) | "https://bitcompare.net/apple-icon.png" |
| /icons/1/mimeType | ∅ (absent) | "image/png" |
| /icons/1/sizes/0 | ∅ (absent) | "180x180" |

## smithery.yaml

Before → after:

~~~~text
          Your ck_live_* API key from https://pro.bitcompare.net/dashboard/keys.
          Requires a Pro or Enterprise plan.
~~~~

→

~~~~text
          Your ck_live_* API key from https://auth.bitcompare.net/pro/signup.
          The published npm 1.1.0 package requires Pro or Enterprise. Free tools require npm 1.2.0 or the updated hosted endpoint.
~~~~
