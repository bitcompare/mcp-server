# Glama / generic container for the Bitcompare stdio MCP server.
#
# This is a thin shell: it installs the published, self-contained npm package
# (which bundles @bitcompare/mcp-core) and runs it over stdio. It talks to the
# hosted REST API at api.bitcompare.net at runtime — it does NOT embed or
# replace any of the private service infrastructure.
#
# Glama builds this image, runs the container, and introspects the server over
# stdio (initialize + tools/list). As of @bitcompare/mcp-server 1.1.0 the
# server registers its tool catalog and connects the transport WITHOUT a key,
# so introspection succeeds with no BITCOMPARE_API_KEY. Tool *calls* still
# require a valid ck_live_ Pro key and are enforced by the API (401/403).
FROM node:20-alpine

# Pin to a published version so the image is reproducible. Bump on each release.
ARG MCP_SERVER_VERSION=1.1.0
RUN npm install -g "@bitcompare/mcp-server@${MCP_SERVER_VERSION}"

# Optional at build/introspection time; required for actual tool calls.
ENV BITCOMPARE_API_KEY=""

ENTRYPOINT ["bitcompare-mcp"]
