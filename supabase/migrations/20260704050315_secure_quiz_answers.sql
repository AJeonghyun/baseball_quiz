revoke all privileges
  on table
    public.dictionary_terms,
    public.trivia_items,
    public.quiz_questions,
    public.quiz_options,
    public.quotes,
    public.team_rank_history,
    public.player_record_entries,
    public.player_all_time_records
  from anon, authenticated;

grant select
  on table
    public.dictionary_terms,
    public.trivia_items,
    public.quiz_questions,
    public.quotes,
    public.team_rank_history,
    public.player_record_entries,
    public.player_all_time_records
  to anon, authenticated;

grant select (id, question_id, option_text, sort_order)
  on table public.quiz_options
  to anon, authenticated;

alter default privileges for role postgres in schema public
  revoke select, insert, update, delete on tables from anon, authenticated;

alter default privileges for role postgres in schema public
  revoke execute on functions from public, anon, authenticated;

create or replace function public.check_quiz_answer(
  p_question_id uuid,
  p_option_id uuid
)
returns table (
  is_correct boolean,
  explanation text
)
language sql
stable
security definer
set search_path = ''
as $function$
  select
    quiz_option.is_correct,
    quiz_question.explanation
  from public.quiz_questions as quiz_question
  join public.quiz_options as quiz_option
    on quiz_option.question_id = quiz_question.id
  where quiz_question.id = p_question_id
    and quiz_option.id = p_option_id
    and quiz_question.published = true;
$function$;

revoke all privileges
  on function public.check_quiz_answer(uuid, uuid)
  from public, anon, authenticated;

grant execute
  on function public.check_quiz_answer(uuid, uuid)
  to anon, authenticated;
