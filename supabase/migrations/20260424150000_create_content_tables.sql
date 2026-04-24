create extension if not exists pgcrypto;

create table if not exists public.dictionary_terms (
  id uuid primary key default gen_random_uuid(),
  source_key text unique,
  category text not null,
  term text not null,
  description text not null default '',
  sort_order integer not null default 0,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (category, term)
);

create table if not exists public.trivia_items (
  id uuid primary key default gen_random_uuid(),
  source_key text unique,
  category text not null,
  term text not null,
  short_desc text not null default '',
  trivia text not null,
  detail text not null default '',
  fun text not null default '',
  sort_order integer not null default 0,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.quiz_questions (
  id uuid primary key default gen_random_uuid(),
  source_key text unique,
  question text not null,
  explanation text not null default '',
  category text not null default '',
  difficulty text not null default '',
  sort_order integer not null default 0,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create table if not exists public.quiz_options (
  id uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.quiz_questions(id) on delete cascade,
  source_key text unique,
  option_text text not null,
  is_correct boolean not null default false,
  sort_order integer not null default 0,
  created_at timestamptz not null default now(),
  unique (question_id, sort_order)
);

create table if not exists public.quotes (
  id uuid primary key default gen_random_uuid(),
  source_key text unique,
  quote text not null,
  author text not null default '',
  sort_order integer not null default 0,
  published boolean not null default true,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists dictionary_terms_published_category_idx
  on public.dictionary_terms (published, category, sort_order);

create index if not exists trivia_items_published_category_idx
  on public.trivia_items (published, category, sort_order);

create index if not exists quiz_questions_published_sort_idx
  on public.quiz_questions (published, sort_order);

create index if not exists quiz_options_question_sort_idx
  on public.quiz_options (question_id, sort_order);

create index if not exists quotes_published_sort_idx
  on public.quotes (published, sort_order);

alter table public.dictionary_terms enable row level security;
alter table public.trivia_items enable row level security;
alter table public.quiz_questions enable row level security;
alter table public.quiz_options enable row level security;
alter table public.quotes enable row level security;

create policy "public can read published dictionary terms"
  on public.dictionary_terms
  for select
  to anon, authenticated
  using (published = true);

create policy "public can read published trivia"
  on public.trivia_items
  for select
  to anon, authenticated
  using (published = true);

create policy "public can read published quiz questions"
  on public.quiz_questions
  for select
  to anon, authenticated
  using (published = true);

create policy "public can read options for published questions"
  on public.quiz_options
  for select
  to anon, authenticated
  using (
    exists (
      select 1
      from public.quiz_questions q
      where q.id = quiz_options.question_id
        and q.published = true
    )
  );

create policy "public can read published quotes"
  on public.quotes
  for select
  to anon, authenticated
  using (published = true);
