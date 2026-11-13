#!/bin/sh
set -eu

: "${SYNC_TOKEN:?Set SYNC_TOKEN to the token from the server .env}"
SYNC_URL="${SYNC_URL:-https://joppekoers.nl/api/sync-cdn}"

curl --fail-with-body --silent --show-error --max-time 600 \
	-X POST \
	-H "Authorization: Bearer $SYNC_TOKEN" \
	"$SYNC_URL"
echo
