# Supabase Migration

This app can read content from Supabase Postgres when `.env` contains:

```dotenv
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-publishable-or-anon-key
```

The local `.env` file is ignored by git. Use `.env.example` as the template.

You can still override `.env` at runtime with Dart defines:

```bash
flutter run \
  --dart-define=SUPABASE_URL=https://your-project.supabase.co \
  --dart-define=SUPABASE_ANON_KEY=your-publishable-or-anon-key
```

Without configured values, the app fails fast at startup. Runtime content is stored in Supabase only.

## Setup

1. Create a Supabase project.
2. Run `supabase/migrations/20260424150000_create_content_tables.sql` in the SQL editor or with the Supabase CLI.
3. Set `SUPABASE_DB_URL` in `.env` using the database connection string from Supabase.
4. Apply the schema and seed data:

```bash
tools/apply_supabase_migration.sh
```

The migration enables row-level security and permits public read access only for rows where `published = true`.
