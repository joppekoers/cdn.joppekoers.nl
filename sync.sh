#!/bin/sh
set -eu
cd "$(dirname "$0")"

if [ -z "${SYNC_TOKEN:-}" ] && [ -f .env ]; then
	. ./.env
fi
: "${SYNC_TOKEN:?Set SYNC_TOKEN in .env or the environment}"
SYNC_URL="${SYNC_URL:-https://joppekoers.nl/api/sync-cdn}"

curl --fail-with-body --silent --show-error --max-time 600 \
	-X POST \
	-H "Authorization: Bearer $SYNC_TOKEN" \
	"$SYNC_URL"
echo
