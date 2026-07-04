#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ENV_FILE="$ROOT_DIR/.env"
SEED_FILE="$ROOT_DIR/supabase/seed.sql"

if [[ ! -f "$ENV_FILE" ]]; then
  echo "Missing .env file." >&2
  exit 1
fi

SUPABASE_DB_URL="$(
  awk -F= '/^SUPABASE_DB_URL=/ {print substr($0, index($0, "=") + 1)}' "$ENV_FILE"
)"

if [[ -z "$SUPABASE_DB_URL" || "$SUPABASE_DB_URL" == *"YOUR_DATABASE_PASSWORD"* ]]; then
  echo "Set SUPABASE_DB_URL in .env with your Supabase database connection string." >&2
  exit 1
fi

PSQL_ARGS=(-v ON_ERROR_STOP=1)
for migration_file in "$ROOT_DIR"/supabase/migrations/*.sql; do
  PSQL_ARGS+=(-f "$migration_file")
done
PSQL_ARGS+=(-f "$SEED_FILE")

psql "$SUPABASE_DB_URL" "${PSQL_ARGS[@]}"
