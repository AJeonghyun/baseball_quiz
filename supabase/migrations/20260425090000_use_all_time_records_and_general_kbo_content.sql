create table if not exists public.player_all_time_records (
  id uuid primary key default gen_random_uuid(),
  source_key text unique,
  category text not null check (category in ('hitter', 'pitcher')),
  metric text not null,
  record_scope text not null check (record_scope in ('career', 'single_season', 'single_game')),
  rank integer not null,
  player_name text not null,
  team_name text not null default '',
  value text not null,
  achieved_year integer,
  sort_order integer not null default 0,
  source text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);

create index if not exists player_all_time_records_category_sort_idx
  on public.player_all_time_records (category, sort_order, rank);

alter table public.player_all_time_records enable row level security;

drop policy if exists "public can read player all time records"
  on public.player_all_time_records;
create policy "public can read player all time records"
  on public.player_all_time_records
  for select
  to anon, authenticated
  using (true);

delete from public.trivia_items
where source_key like 'trivia-2025-%';

delete from public.quiz_options
where source_key like 'quiz-2025-%';

delete from public.quiz_questions
where source_key like 'quiz-2025-%';

delete from public.player_all_time_records
where source_key like 'record-kbo-%';

insert into public.player_all_time_records (
  source_key,
  category,
  metric,
  record_scope,
  rank,
  player_name,
  team_name,
  value,
  achieved_year,
  sort_order,
  source,
  updated_at
)
values
  ('record-kbo-h-career-hit-001', 'hitter', '통산 안타', 'career', 1, '손아섭', '롯데/NC', '2,618', null, 1001, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-002', 'hitter', '통산 안타', 'career', 2, '최형우', '삼성/KIA/삼성', '2,586', null, 1002, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-003', 'hitter', '통산 안타', 'career', 3, '김현수', '두산/LG', '2,532', null, 1003, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-004', 'hitter', '통산 안타', 'career', 4, '박용택', 'LG', '2,504', null, 1004, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-005', 'hitter', '통산 안타', 'career', 5, '최정', 'SK/SSG', '2,352', null, 1005, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-006', 'hitter', '통산 안타', 'career', 6, '양준혁', '삼성/해태/LG', '2,318', null, 1006, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-007', 'hitter', '통산 안타', 'career', 7, '황재균', '현대/넥센/롯데/KT', '2,266', null, 1007, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-008', 'hitter', '통산 안타', 'career', 8, '강민호', '롯데/삼성', '2,222', null, 1008, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-009', 'hitter', '통산 안타', 'career', 9, '김태균', '한화', '2,209', null, 1009, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hit-010', 'hitter', '통산 안타', 'career', 10, '정성훈', '해태/현대/LG/KIA', '2,204', null, 1010, 'https://en.wikipedia.org/wiki/List_of_KBO_career_hits_leaders', now()),
  ('record-kbo-h-career-hr-001', 'hitter', '통산 홈런', 'career', 1, '최정', 'SK/SSG', '518', null, 2001, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-002', 'hitter', '통산 홈런', 'career', 2, '이승엽', '삼성', '467', null, 2002, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-003', 'hitter', '통산 홈런', 'career', 3, '박병호', 'LG/넥센/키움/KT/삼성', '418', null, 2003, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-004', 'hitter', '통산 홈런', 'career', 4, '최형우', '삼성/KIA/삼성', '401', null, 2004, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-005', 'hitter', '통산 홈런', 'career', 5, '이대호', '롯데', '374', null, 2005, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-006', 'hitter', '통산 홈런', 'career', 6, '양준혁', '삼성/해태/LG', '351', null, 2006, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-007', 'hitter', '통산 홈런', 'career', 7, '강민호', '롯데/삼성', '350', null, 2007, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-008', 'hitter', '통산 홈런', 'career', 8, '장종훈', '빙그레/한화', '340', null, 2008, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-009', 'hitter', '통산 홈런', 'career', 9, '이호준', '해태/SK/NC', '337', null, 2009, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-hr-010', 'hitter', '통산 홈런', 'career', 10, '이범호', '한화/KIA', '329', null, 2010, 'https://en.wikipedia.org/wiki/List_of_KBO_career_home_run_leaders', now()),
  ('record-kbo-h-career-rbi-001', 'hitter', '통산 타점', 'career', 1, '최형우', '삼성/KIA/삼성', '1,737', null, 3001, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-002', 'hitter', '통산 타점', 'career', 2, '최정', 'SK/SSG', '1,624', null, 3002, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-003', 'hitter', '통산 타점', 'career', 3, '김현수', '두산/LG', '1,522', null, 3003, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-004', 'hitter', '통산 타점', 'career', 4, '이승엽', '삼성', '1,498', null, 3004, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-005', 'hitter', '통산 타점', 'career', 5, '이대호', '롯데', '1,425', null, 3005, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-006', 'hitter', '통산 타점', 'career', 6, '양준혁', '삼성/해태/LG', '1,389', null, 3006, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-007', 'hitter', '통산 타점', 'career', 7, '김태균', '한화', '1,358', null, 3007, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-008', 'hitter', '통산 타점', 'career', 8, '강민호', '롯데/삼성', '1,313', null, 3008, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-009', 'hitter', '통산 타점', 'career', 9, '이호준', '해태/SK/NC', '1,265', null, 3009, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-rbi-010', 'hitter', '통산 타점', 'career', 10, '박병호', 'LG/넥센/키움/KT/삼성', '1,244', null, 3010, 'https://en.wikipedia.org/wiki/List_of_KBO_career_RBI_leaders', now()),
  ('record-kbo-h-career-sb-001', 'hitter', '통산 도루', 'career', 1, '전준호', '롯데/현대/히어로즈', '549', null, 4001, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-002', 'hitter', '통산 도루', 'career', 2, '이종범', '해태/KIA', '510', null, 4002, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-003', 'hitter', '통산 도루', 'career', 3, '이대형', 'LG/KIA/KT', '505', null, 4003, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-004', 'hitter', '통산 도루', 'career', 4, '정수근', 'OB/두산/롯데', '474', null, 4004, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-005', 'hitter', '통산 도루', 'career', 5, '박해민', '삼성/LG', '460', null, 4005, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-006', 'hitter', '통산 도루', 'career', 6, '이용규', 'LG/KIA/한화/키움', '397', null, 4006, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-007', 'hitter', '통산 도루', 'career', 7, '김주찬', '삼성/롯데/KIA', '388', null, 4007, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-008', 'hitter', '통산 도루', 'career', 8, '이순철', '해태/삼성', '371', null, 4008, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-009', 'hitter', '통산 도루', 'career', 8, '정근우', 'SK/한화/LG', '371', null, 4009, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-career-sb-010', 'hitter', '통산 도루', 'career', 10, '김일권', '해태/태평양', '363', null, 4010, 'https://en.wikipedia.org/wiki/List_of_KBO_career_stolen_bases_leaders', now()),
  ('record-kbo-h-season-ba-001', 'hitter', '단일 시즌 타율', 'single_season', 1, '백인천', 'MBC', '0.412', 1982, 5001, 'legacy app data', now()),
  ('record-kbo-h-season-ba-002', 'hitter', '단일 시즌 타율', 'single_season', 2, '이종범', '해태', '0.393', 1994, 5002, 'legacy app data', now()),
  ('record-kbo-h-season-ba-003', 'hitter', '단일 시즌 타율', 'single_season', 3, '장효조', '삼성', '0.387', 1987, 5003, 'legacy app data', now()),
  ('record-kbo-h-season-ba-004', 'hitter', '단일 시즌 타율', 'single_season', 4, '테임즈', 'NC', '0.381', 2015, 5004, 'legacy app data', now()),
  ('record-kbo-h-season-ba-005', 'hitter', '단일 시즌 타율', 'single_season', 5, '최형우', '삼성', '0.376', 2016, 5005, 'legacy app data', now()),
  ('record-kbo-h-season-hit-001', 'hitter', '단일 시즌 안타', 'single_season', 1, '레이예스', '롯데', '202', 2024, 6001, 'legacy app data', now()),
  ('record-kbo-h-season-hit-002', 'hitter', '단일 시즌 안타', 'single_season', 2, '서건창', '넥센', '201', 2014, 6002, 'legacy app data', now()),
  ('record-kbo-h-season-hit-003', 'hitter', '단일 시즌 안타', 'single_season', 3, '페르난데스', '두산', '199', 2020, 6003, 'legacy app data', now()),
  ('record-kbo-h-season-hit-004', 'hitter', '단일 시즌 안타', 'single_season', 4, '페르난데스', '두산', '197', 2019, 6004, 'legacy app data', now()),
  ('record-kbo-h-season-hit-005', 'hitter', '단일 시즌 안타', 'single_season', 5, '이종범', '해태', '196', 1994, 6005, 'legacy app data', now()),
  ('record-kbo-h-season-hr-001', 'hitter', '단일 시즌 홈런', 'single_season', 1, '이승엽', '삼성', '56', 2003, 7001, 'https://www.baseball-reference.com/bullpen/2003_Korea_Baseball_Organization', now()),
  ('record-kbo-h-season-hr-002', 'hitter', '단일 시즌 홈런', 'single_season', 2, '이승엽', '삼성', '54', 1999, 7002, 'legacy app data', now()),
  ('record-kbo-h-season-hr-003', 'hitter', '단일 시즌 홈런', 'single_season', 3, '심정수', '현대', '53', 2003, 7003, 'https://www.baseball-reference.com/bullpen/2003_Korea_Baseball_Organization', now()),
  ('record-kbo-h-season-hr-004', 'hitter', '단일 시즌 홈런', 'single_season', 3, '박병호', '넥센', '53', 2015, 7004, 'legacy app data', now()),
  ('record-kbo-h-season-hr-005', 'hitter', '단일 시즌 홈런', 'single_season', 5, '박병호', '넥센', '52', 2014, 7005, 'legacy app data', now()),
  ('record-kbo-h-season-hr-006', 'hitter', '단일 시즌 홈런', 'single_season', 6, '르윈 디아즈', '삼성', '50', 2025, 7006, 'https://mykbostats.com/stats/top/hr/2025', now()),
  ('record-kbo-h-season-rbi-001', 'hitter', '단일 시즌 타점', 'single_season', 1, '르윈 디아즈', '삼성', '158', 2025, 8001, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  ('record-kbo-h-season-rbi-002', 'hitter', '단일 시즌 타점', 'single_season', 2, '박병호', '넥센', '146', 2015, 8002, 'legacy app data', now()),
  ('record-kbo-h-season-rbi-003', 'hitter', '단일 시즌 타점', 'single_season', 3, '이승엽', '삼성', '144', 2003, 8003, 'legacy app data', now()),
  ('record-kbo-h-season-rbi-004', 'hitter', '단일 시즌 타점', 'single_season', 3, '최형우', '삼성', '144', 2016, 8004, 'legacy app data', now()),
  ('record-kbo-h-season-rbi-005', 'hitter', '단일 시즌 타점', 'single_season', 5, '심정수', '현대', '142', 2003, 8005, 'legacy app data', now()),
  ('record-kbo-h-season-sb-001', 'hitter', '단일 시즌 도루', 'single_season', 1, '이종범', '해태', '84', 1994, 9001, 'https://en.wikipedia.org/wiki/Lee_Jong-beom', now()),
  ('record-kbo-h-season-sb-002', 'hitter', '단일 시즌 도루', 'single_season', 2, '전준호', '롯데', '75', 1993, 9002, 'legacy app data', now()),
  ('record-kbo-h-season-sb-003', 'hitter', '단일 시즌 도루', 'single_season', 3, '이종범', '해태', '73', 1993, 9003, 'legacy app data', now()),
  ('record-kbo-h-season-sb-004', 'hitter', '단일 시즌 도루', 'single_season', 4, '전준호', '롯데', '69', 1995, 9004, 'legacy app data', now()),
  ('record-kbo-h-season-sb-005', 'hitter', '단일 시즌 도루', 'single_season', 5, '이대형', 'LG', '66', 2010, 9005, 'legacy app data', now()),
  ('record-kbo-p-career-win-001', 'pitcher', '통산 승리', 'career', 1, '송진우', '빙그레/한화', '210', null, 10001, 'https://en.wikipedia.org/wiki/List_of_KBO_career_win_leaders', now()),
  ('record-kbo-p-career-win-002', 'pitcher', '통산 승리', 'career', 2, '양현종', 'KIA', '186', null, 10002, 'https://en.wikipedia.org/wiki/List_of_KBO_career_win_leaders', now()),
  ('record-kbo-p-career-win-003', 'pitcher', '통산 승리', 'career', 3, '김광현', 'SK/SSG', '180', null, 10003, 'https://en.wikipedia.org/wiki/List_of_KBO_career_win_leaders', now()),
  ('record-kbo-p-career-win-004', 'pitcher', '통산 승리', 'career', 4, '정민철', '빙그레/한화', '161', null, 10004, 'https://en.wikipedia.org/wiki/List_of_KBO_career_win_leaders', now()),
  ('record-kbo-p-career-win-005', 'pitcher', '통산 승리', 'career', 5, '이강철', '해태/삼성/KIA', '152', null, 10005, 'https://en.wikipedia.org/wiki/List_of_KBO_career_win_leaders', now()),
  ('record-kbo-p-career-k-001', 'pitcher', '통산 탈삼진', 'career', 1, '양현종', 'KIA', '2,185', null, 11001, 'https://en.wikipedia.org/wiki/List_of_KBO_career_strikeout_leaders', now()),
  ('record-kbo-p-career-k-002', 'pitcher', '통산 탈삼진', 'career', 2, '송진우', '빙그레/한화', '2,048', null, 11002, 'https://en.wikipedia.org/wiki/List_of_KBO_career_strikeout_leaders', now()),
  ('record-kbo-p-career-k-003', 'pitcher', '통산 탈삼진', 'career', 3, '김광현', 'SK/SSG', '2,020', null, 11003, 'https://en.wikipedia.org/wiki/List_of_KBO_career_strikeout_leaders', now()),
  ('record-kbo-p-career-k-004', 'pitcher', '통산 탈삼진', 'career', 4, '이강철', '해태/삼성/KIA', '1,749', null, 11004, 'https://en.wikipedia.org/wiki/List_of_KBO_career_strikeout_leaders', now()),
  ('record-kbo-p-career-k-005', 'pitcher', '통산 탈삼진', 'career', 5, '선동열', '해태', '1,698', null, 11005, 'https://en.wikipedia.org/wiki/List_of_KBO_career_strikeout_leaders', now()),
  ('record-kbo-p-career-save-001', 'pitcher', '통산 세이브', 'career', 1, '오승환', '삼성', '427', null, 12001, 'https://en.wikipedia.org/wiki/List_of_KBO_career_saves_leaders', now()),
  ('record-kbo-p-career-save-002', 'pitcher', '통산 세이브', 'career', 2, '손승락', '현대/넥센/롯데', '271', null, 12002, 'https://en.wikipedia.org/wiki/List_of_KBO_career_saves_leaders', now()),
  ('record-kbo-p-career-save-003', 'pitcher', '통산 세이브', 'career', 3, '임창용', '해태/삼성/KIA', '258', null, 12003, 'https://en.wikipedia.org/wiki/List_of_KBO_career_saves_leaders', now()),
  ('record-kbo-p-career-save-004', 'pitcher', '통산 세이브', 'career', 4, '김용수', 'MBC/LG', '227', null, 12004, 'https://en.wikipedia.org/wiki/List_of_KBO_career_saves_leaders', now()),
  ('record-kbo-p-career-save-005', 'pitcher', '통산 세이브', 'career', 5, '구대성', '빙그레/한화', '214', null, 12005, 'https://en.wikipedia.org/wiki/List_of_KBO_career_saves_leaders', now()),
  ('record-kbo-p-season-win-001', 'pitcher', '단일 시즌 승리', 'single_season', 1, '장명부', '삼미', '30', 1983, 13001, 'legacy app data', now()),
  ('record-kbo-p-season-win-002', 'pitcher', '단일 시즌 승리', 'single_season', 2, '최동원', '롯데', '27', 1984, 13002, 'legacy app data', now()),
  ('record-kbo-p-season-win-003', 'pitcher', '단일 시즌 승리', 'single_season', 3, '김시진', '삼성', '25', 1985, 13003, 'legacy app data', now()),
  ('record-kbo-p-season-win-004', 'pitcher', '단일 시즌 승리', 'single_season', 3, '김일융', '삼성', '25', 1985, 13004, 'legacy app data', now()),
  ('record-kbo-p-season-win-005', 'pitcher', '단일 시즌 승리', 'single_season', 5, '박철순', 'OB', '24', 1982, 13005, 'legacy app data', now()),
  ('record-kbo-p-season-era-001', 'pitcher', '단일 시즌 평균자책점', 'single_season', 1, '선동열', '해태', '0.78', 1993, 14001, 'legacy app data', now()),
  ('record-kbo-p-season-era-002', 'pitcher', '단일 시즌 평균자책점', 'single_season', 2, '선동열', '해태', '0.89', 1987, 14002, 'legacy app data', now()),
  ('record-kbo-p-season-era-003', 'pitcher', '단일 시즌 평균자책점', 'single_season', 3, '선동열', '해태', '0.99', 1986, 14003, 'legacy app data', now()),
  ('record-kbo-p-season-era-004', 'pitcher', '단일 시즌 평균자책점', 'single_season', 4, '김경원', 'OB', '1.11', 1993, 14004, 'legacy app data', now()),
  ('record-kbo-p-season-era-005', 'pitcher', '단일 시즌 평균자책점', 'single_season', 5, '선동열', '해태', '1.13', 1990, 14005, 'legacy app data', now()),
  ('record-kbo-p-season-k-001', 'pitcher', '단일 시즌 탈삼진', 'single_season', 1, '코디 폰세', '한화', '252', 2025, 15001, 'https://mykbostats.com/stats/top/k/2025', now()),
  ('record-kbo-p-season-k-002', 'pitcher', '단일 시즌 탈삼진', 'single_season', 2, '앤더슨', 'SSG', '245', 2025, 15002, 'https://mykbostats.com/stats/top/k/2025', now()),
  ('record-kbo-p-season-k-003', 'pitcher', '단일 시즌 탈삼진', 'single_season', 3, '미란다', '두산', '225', 2021, 15003, 'legacy app data', now()),
  ('record-kbo-p-season-k-004', 'pitcher', '단일 시즌 탈삼진', 'single_season', 4, '안우진', '키움', '224', 2022, 15004, 'legacy app data', now()),
  ('record-kbo-p-season-k-005', 'pitcher', '단일 시즌 탈삼진', 'single_season', 5, '최동원', '롯데', '223', 1984, 15005, 'legacy app data', now()),
  ('record-kbo-p-season-save-001', 'pitcher', '단일 시즌 세이브', 'single_season', 1, '오승환', '삼성', '47', 2006, 16001, 'legacy app data', now()),
  ('record-kbo-p-season-save-002', 'pitcher', '단일 시즌 세이브', 'single_season', 1, '오승환', '삼성', '47', 2011, 16002, 'legacy app data', now()),
  ('record-kbo-p-season-save-003', 'pitcher', '단일 시즌 세이브', 'single_season', 3, '손승락', '넥센', '46', 2013, 16003, 'legacy app data', now()),
  ('record-kbo-p-season-save-004', 'pitcher', '단일 시즌 세이브', 'single_season', 4, '오승환', '삼성', '44', 2021, 16004, 'legacy app data', now()),
  ('record-kbo-p-season-save-005', 'pitcher', '단일 시즌 세이브', 'single_season', 5, '진필중', '두산', '42', 2000, 16005, 'legacy app data', now())
on conflict (source_key) do update set
  category = excluded.category,
  metric = excluded.metric,
  record_scope = excluded.record_scope,
  rank = excluded.rank,
  player_name = excluded.player_name,
  team_name = excluded.team_name,
  value = excluded.value,
  achieved_year = excluded.achieved_year,
  sort_order = excluded.sort_order,
  source = excluded.source,
  updated_at = now();

insert into public.trivia_items (
  source_key,
  category,
  term,
  short_desc,
  trivia,
  detail,
  fun,
  sort_order,
  published,
  updated_at
)
values
  ('trivia-kbo-general-001', 'KBO 역사', '1982년 출범', '6개 구단으로 시작', 'KBO 리그는 1982년에 6개 구단으로 출범했다.', '원년 참가 구단은 OB, 삼성, MBC, 해태, 롯데, 삼미였다.', '3', 11001, true, now()),
  ('trivia-kbo-general-002', 'KBO 역사', '초대 한국시리즈', 'OB 베어스 우승', '첫 한국시리즈 우승팀은 OB 베어스였다.', '1982년 OB는 삼성과의 한국시리즈에서 초대 챔피언이 됐다.', '4', 11002, true, now()),
  ('trivia-kbo-general-003', '구단 이야기', '잠실 공동 홈', 'LG와 두산', '잠실야구장은 LG 트윈스와 두산 베어스가 함께 홈구장으로 사용한다.', '한 구장을 두 프로 구단이 함께 쓰는 대표 사례다.', '3', 11003, true, now()),
  ('trivia-kbo-general-004', '구단 이야기', 'NC 1군 합류', '2013년', 'NC 다이노스는 2013년에 KBO 리그 1군에 합류했다.', '창원 연고의 신생 구단으로 빠르게 강팀으로 성장했다.', '3', 11004, true, now()),
  ('trivia-kbo-general-005', '구단 이야기', 'KT 1군 합류', '2015년', 'KT 위즈는 2015년에 KBO 리그 1군에 합류했다.', 'KT 합류 이후 KBO 리그는 10개 구단 체제가 됐다.', '3', 11005, true, now()),
  ('trivia-kbo-general-006', '레전드 선수', '이승엽 56홈런', '2003년', '이승엽은 2003년에 56홈런을 기록했다.', '이 기록은 KBO 단일 시즌 홈런의 상징적인 기록으로 남아 있다.', '5', 11006, true, now()),
  ('trivia-kbo-general-007', '레전드 선수', '최정 통산 홈런', 'KBO 홈런왕', '최정은 KBO 통산 홈런 최상위 기록을 보유한 대표 타자다.', '꾸준한 장타 생산과 긴 커리어가 누적 기록을 만들었다.', '4', 11007, true, now()),
  ('trivia-kbo-general-008', '레전드 선수', '송진우 210승', '통산 승리 1위', '송진우는 KBO 통산 210승을 기록했다.', '장기간 선발과 불펜을 오가며 누적한 대표적인 투수 기록이다.', '5', 11008, true, now()),
  ('trivia-kbo-general-009', '레전드 선수', '오승환 세이브', '끝판대장', '오승환은 KBO 통산 세이브 최상위 기록을 가진 마무리 투수다.', '강력한 직구와 큰 경기 경험으로 한국 야구의 대표 클로저가 됐다.', '4', 11009, true, now()),
  ('trivia-kbo-general-010', '기록 이야기', '4할 타율', '백인천', '백인천은 1982년에 4할 타율을 기록했다.', '0.412는 KBO 단일 시즌 타율을 이야기할 때 빠지지 않는 기록이다.', '5', 11010, true, now()),
  ('trivia-kbo-general-011', '기록 이야기', '84도루', '이종범', '이종범은 1994년에 84도루를 기록했다.', '스피드와 출루 능력이 결합된 KBO 대표 단일 시즌 도루 기록이다.', '5', 11011, true, now()),
  ('trivia-kbo-general-012', '기록 이야기', '30승 투수', '장명부', '장명부는 1983년에 30승을 기록했다.', '현대 야구의 투수 운용을 생각하면 재현이 매우 어려운 기록으로 평가된다.', '5', 11012, true, now()),
  ('trivia-kbo-general-013', '한국시리즈', '정규시즌과 다른 무대', '우승 결정전', '한국시리즈는 KBO 포스트시즌의 최종 우승 결정전이다.', '정규시즌 성적과 별개로 단기전 운영과 불펜 활용이 중요해진다.', '3', 11013, true, now()),
  ('trivia-kbo-general-014', '규칙과 전략', '지명타자', '타격 전담 선수', 'KBO는 지명타자 제도를 사용한다.', '지명타자는 투수 대신 공격에 나서는 타격 전담 선수다.', '2', 11014, true, now()),
  ('trivia-kbo-general-015', '규칙과 전략', '희생번트', '아웃과 진루 교환', '희생번트는 아웃 하나를 감수하고 주자를 진루시키는 작전이다.', '득점권 한 점이 중요한 경기 후반에 자주 선택된다.', '2', 11015, true, now()),
  ('trivia-kbo-general-016', '규칙과 전략', '퀄리티스타트', '6이닝 3자책 이하', '퀄리티스타트는 선발투수가 6이닝 이상 3자책점 이하로 막은 경기다.', '선발투수의 안정성을 간단히 보여주는 지표다.', '2', 11016, true, now()),
  ('trivia-kbo-general-017', '국가대표', '2008 베이징', '금메달', '한국 야구 대표팀은 2008 베이징 올림픽에서 금메달을 땄다.', '전승 우승으로 한국 야구 역사에서 매우 상징적인 대회였다.', '5', 11017, true, now()),
  ('trivia-kbo-general-018', '국가대표', '2006 WBC', '4강', '한국은 2006 WBC에서 4강에 올랐다.', '국제무대에서 한국 야구의 경쟁력을 강하게 알린 대회였다.', '4', 11018, true, now()),
  ('trivia-kbo-general-019', '야구 문화', '응원가 문화', '선수별 응원가', 'KBO는 선수별 응원가와 단체 응원 문화가 발달했다.', '응원단, 치어리더, 관중 떼창은 KBO 관람 경험의 큰 특징이다.', '3', 11019, true, now()),
  ('trivia-kbo-general-020', '야구 문화', '치맥과 야구장', '관람 문화', '한국 야구장 관람 문화에서는 음식과 응원이 함께 즐길 요소로 자리 잡았다.', '야구장 음식과 응원 문화는 경기 외적인 재미를 만든다.', '2', 11020, true, now()),
  ('trivia-kbo-general-021', '구장 이야기', '고척스카이돔', '돔구장', '고척스카이돔은 KBO 리그에서 사용하는 대표적인 돔구장이다.', '비와 날씨 영향을 적게 받는 구장이라는 점이 특징이다.', '3', 11021, true, now()),
  ('trivia-kbo-general-022', '포지션', '포수의 역할', '투수 리드', '포수는 투수와 함께 볼 배합과 수비 위치에 큰 영향을 준다.', '공격 기록만으로 평가하기 어려운 수비 기여가 큰 포지션이다.', '3', 11022, true, now()),
  ('trivia-kbo-general-023', '포지션', '유격수', '내야 핵심', '유격수는 내야 수비 범위와 송구 능력이 특히 중요한 포지션이다.', '강한 타구와 병살 플레이에 자주 관여한다.', '3', 11023, true, now()),
  ('trivia-kbo-general-024', '용어 심화', 'WHIP', '이닝당 출루 허용', 'WHIP는 투수가 이닝당 허용한 볼넷과 안타 수를 나타내는 지표다.', '낮을수록 주자를 적게 내보냈다는 뜻이다.', '2', 11024, true, now()),
  ('trivia-kbo-general-025', '용어 심화', 'OPS', '출루율+장타율', 'OPS는 출루율과 장타율을 더한 공격 지표다.', '타자가 얼마나 자주 살아나가고 장타를 생산하는지 함께 보여준다.', '2', 11025, true, now()),
  ('trivia-kbo-general-026', '기록 이야기', '사이클링 히트', '단타부터 홈런까지', '사이클링 히트는 한 경기에서 단타, 2루타, 3루타, 홈런을 모두 기록하는 것이다.', '희귀성과 완성도가 높아 특별한 기록으로 취급된다.', '4', 11026, true, now()),
  ('trivia-kbo-general-027', '기록 이야기', '노히트노런', '안타 없이 승리', '노히트노런은 상대에게 안타를 하나도 허용하지 않고 끝낸 경기다.', '볼넷이나 실책 출루는 있을 수 있어 퍼펙트게임과 구분된다.', '4', 11027, true, now()),
  ('trivia-kbo-general-028', '전략', '마무리 투수', '9회 클로저', '마무리 투수는 보통 경기 후반 리드를 지키는 역할을 맡는다.', '세이브 상황에서 등판해 마지막 아웃카운트를 책임진다.', '2', 11028, true, now()),
  ('trivia-kbo-general-029', '전략', '셋업맨', '마무리 전 단계', '셋업맨은 마무리 투수에게 연결하기 전 고비 이닝을 맡는 불펜 투수다.', '홀드 기록과 관련이 깊다.', '2', 11029, true, now()),
  ('trivia-kbo-general-030', 'KBO 역사', '10개 구단 체제', '2015년 이후', 'KBO 리그는 KT 위즈가 합류한 2015년부터 10개 구단 체제로 운영됐다.', '10개 구단 체제는 팀당 144경기 시즌 운영과 함께 자리 잡았다.', '3', 11030, true, now())
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  published = excluded.published,
  updated_at = now();

delete from public.quiz_options
where source_key like 'quiz-kbo-general-%';

with questions(source_key, question, explanation, category, difficulty, sort_order) as (
  values
    ('quiz-kbo-general-001', 'KBO 리그가 출범한 해는?', 'KBO 리그는 1982년에 출범했다.', 'KBO 역사', 'easy', 21001),
    ('quiz-kbo-general-002', 'KBO 원년 한국시리즈 우승팀은?', '1982년 초대 한국시리즈 우승팀은 OB 베어스였다.', 'KBO 역사', 'easy', 21002),
    ('quiz-kbo-general-003', 'KBO 리그가 10개 구단 체제가 된 해는?', 'KT 위즈가 1군에 합류한 2015년부터 10개 구단 체제가 됐다.', 'KBO 역사', 'medium', 21003),
    ('quiz-kbo-general-004', '2003년 KBO 단일 시즌 56홈런을 기록한 선수는?', '이승엽은 2003년 삼성 소속으로 56홈런을 기록했다.', '기록', 'easy', 21004),
    ('quiz-kbo-general-005', 'KBO 단일 시즌 84도루 기록을 세운 선수는?', '이종범은 1994년 84도루를 기록했다.', '기록', 'medium', 21005),
    ('quiz-kbo-general-006', 'KBO 통산 210승으로 유명한 투수는?', '송진우는 KBO 통산 210승을 기록했다.', '기록', 'medium', 21006),
    ('quiz-kbo-general-007', 'KBO 대표 마무리 투수 오승환의 별명으로 널리 알려진 것은?', '오승환은 강력한 마무리 투수 이미지로 끝판대장이라는 별명이 유명하다.', '레전드', 'easy', 21007),
    ('quiz-kbo-general-008', '잠실야구장을 함께 홈구장으로 사용하는 두 팀은?', 'LG 트윈스와 두산 베어스가 잠실야구장을 함께 사용한다.', '구단', 'easy', 21008),
    ('quiz-kbo-general-009', 'NC 다이노스가 KBO 1군에 합류한 해는?', 'NC는 2013년에 1군 무대에 합류했다.', '구단', 'medium', 21009),
    ('quiz-kbo-general-010', 'KT 위즈가 KBO 1군에 합류한 해는?', 'KT는 2015년에 KBO 1군에 합류했다.', '구단', 'easy', 21010),
    ('quiz-kbo-general-011', '퀄리티스타트의 기준은?', '선발투수가 6이닝 이상 3자책점 이하로 던진 경기다.', '규칙과 전략', 'easy', 21011),
    ('quiz-kbo-general-012', 'OPS는 무엇을 더한 지표인가?', 'OPS는 출루율과 장타율을 더한 지표다.', '용어', 'easy', 21012),
    ('quiz-kbo-general-013', 'WHIP는 무엇을 나타내는가?', 'WHIP는 이닝당 볼넷과 안타 허용 수를 나타낸다.', '용어', 'medium', 21013),
    ('quiz-kbo-general-014', '지명타자의 주 역할은?', '지명타자는 투수 대신 공격에 나서는 타격 전담 선수다.', '규칙과 전략', 'easy', 21014),
    ('quiz-kbo-general-015', '한국 야구 대표팀이 올림픽 금메달을 딴 대회는?', '한국은 2008 베이징 올림픽 야구에서 금메달을 땄다.', '국가대표', 'easy', 21015),
    ('quiz-kbo-general-016', '2006 WBC에서 한국 대표팀의 최종 성적은?', '한국은 2006 WBC에서 4강에 올랐다.', '국가대표', 'medium', 21016),
    ('quiz-kbo-general-017', '노히트노런과 퍼펙트게임의 차이로 맞는 것은?', '노히트노런은 볼넷이나 실책 출루가 있을 수 있지만, 퍼펙트게임은 어떤 주자도 허용하지 않는다.', '기록', 'hard', 21017),
    ('quiz-kbo-general-018', '사이클링 히트에 필요한 타격 조합은?', '한 경기에서 단타, 2루타, 3루타, 홈런을 모두 기록해야 한다.', '기록', 'medium', 21018),
    ('quiz-kbo-general-019', '마무리 투수가 주로 노리는 기록은?', '마무리 투수는 리드를 지키고 경기를 끝내며 세이브를 기록한다.', '전략', 'easy', 21019),
    ('quiz-kbo-general-020', '셋업맨과 가장 관련이 깊은 기록은?', '셋업맨은 마무리 전 고비 이닝을 막아 홀드와 관련이 깊다.', '전략', 'medium', 21020),
    ('quiz-kbo-general-021', 'KBO에서 한 경기 단타, 2루타, 3루타, 홈런을 모두 치는 기록은?', '이 기록은 사이클링 히트라고 부른다.', '기록', 'easy', 21021),
    ('quiz-kbo-general-022', '포수의 수비 역할로 가장 적절한 것은?', '포수는 투수 리드, 도루 저지, 홈 플레이트 수비 등 수비 관여도가 크다.', '포지션', 'easy', 21022),
    ('quiz-kbo-general-023', '유격수에게 특히 중요한 능력은?', '유격수는 넓은 수비 범위와 빠르고 정확한 송구가 중요하다.', '포지션', 'easy', 21023),
    ('quiz-kbo-general-024', '희생번트의 기본 목적은?', '아웃 하나를 감수하고 주자를 다음 베이스로 보내는 작전이다.', '규칙과 전략', 'easy', 21024),
    ('quiz-kbo-general-025', '고척스카이돔의 특징으로 맞는 것은?', '돔구장이어서 날씨 영향을 상대적으로 적게 받는다.', '구장', 'easy', 21025),
    ('quiz-kbo-general-026', 'KBO 단일 시즌 타율 0.412 기록을 남긴 선수는?', '백인천은 1982년에 0.412 타율을 기록했다.', '기록', 'medium', 21026),
    ('quiz-kbo-general-027', '2025년에 50홈런으로 역대 단일 시즌 홈런 상위권에 오른 선수는?', '삼성의 르윈 디아즈는 2025년 50홈런을 기록했다.', '기록', 'medium', 21027),
    ('quiz-kbo-general-028', '2025년에 252탈삼진으로 단일 시즌 탈삼진 기록을 새로 쓴 투수는?', '한화의 코디 폰세는 2025년 252탈삼진을 기록했다.', '기록', 'medium', 21028),
    ('quiz-kbo-general-029', 'KBO 응원 문화의 특징으로 맞는 것은?', '선수별 응원가와 단체 응원이 발달했다.', '야구 문화', 'easy', 21029),
    ('quiz-kbo-general-030', '한국시리즈는 어떤 무대인가?', 'KBO 포스트시즌의 최종 우승 결정전이다.', '한국시리즈', 'easy', 21030)
),
upserted as (
  insert into public.quiz_questions (
    source_key,
    question,
    explanation,
    category,
    difficulty,
    sort_order,
    published,
    updated_at
  )
  select source_key, question, explanation, category, difficulty, sort_order, true, now()
  from questions
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    category = excluded.category,
    difficulty = excluded.difficulty,
    sort_order = excluded.sort_order,
    published = excluded.published,
    updated_at = now()
  returning id, source_key
),
options(question_key, option_text, is_correct, sort_order) as (
  values
    ('quiz-kbo-general-001', '1982년', true, 1), ('quiz-kbo-general-001', '1992년', false, 2), ('quiz-kbo-general-001', '2002년', false, 3), ('quiz-kbo-general-001', '2015년', false, 4),
    ('quiz-kbo-general-002', 'OB 베어스', true, 1), ('quiz-kbo-general-002', '삼성 라이온즈', false, 2), ('quiz-kbo-general-002', '해태 타이거즈', false, 3), ('quiz-kbo-general-002', '롯데 자이언츠', false, 4),
    ('quiz-kbo-general-003', '2015년', true, 1), ('quiz-kbo-general-003', '2013년', false, 2), ('quiz-kbo-general-003', '2020년', false, 3), ('quiz-kbo-general-003', '1982년', false, 4),
    ('quiz-kbo-general-004', '이승엽', true, 1), ('quiz-kbo-general-004', '최정', false, 2), ('quiz-kbo-general-004', '박병호', false, 3), ('quiz-kbo-general-004', '심정수', false, 4),
    ('quiz-kbo-general-005', '이종범', true, 1), ('quiz-kbo-general-005', '전준호', false, 2), ('quiz-kbo-general-005', '이대형', false, 3), ('quiz-kbo-general-005', '박해민', false, 4),
    ('quiz-kbo-general-006', '송진우', true, 1), ('quiz-kbo-general-006', '선동열', false, 2), ('quiz-kbo-general-006', '양현종', false, 3), ('quiz-kbo-general-006', '김광현', false, 4),
    ('quiz-kbo-general-007', '끝판대장', true, 1), ('quiz-kbo-general-007', '바람의 아들', false, 2), ('quiz-kbo-general-007', '라이언킹', false, 3), ('quiz-kbo-general-007', '국민타자', false, 4),
    ('quiz-kbo-general-008', 'LG와 두산', true, 1), ('quiz-kbo-general-008', '삼성과 롯데', false, 2), ('quiz-kbo-general-008', 'KIA와 한화', false, 3), ('quiz-kbo-general-008', 'NC와 KT', false, 4),
    ('quiz-kbo-general-009', '2013년', true, 1), ('quiz-kbo-general-009', '2015년', false, 2), ('quiz-kbo-general-009', '1982년', false, 3), ('quiz-kbo-general-009', '2021년', false, 4),
    ('quiz-kbo-general-010', '2015년', true, 1), ('quiz-kbo-general-010', '2013년', false, 2), ('quiz-kbo-general-010', '2008년', false, 3), ('quiz-kbo-general-010', '1999년', false, 4),
    ('quiz-kbo-general-011', '6이닝 이상 3자책점 이하', true, 1), ('quiz-kbo-general-011', '5이닝 무실점', false, 2), ('quiz-kbo-general-011', '9이닝 완봉', false, 3), ('quiz-kbo-general-011', '3이닝 무피안타', false, 4),
    ('quiz-kbo-general-012', '출루율과 장타율', true, 1), ('quiz-kbo-general-012', '타율과 방어율', false, 2), ('quiz-kbo-general-012', '승률과 세이브', false, 3), ('quiz-kbo-general-012', '도루와 득점', false, 4),
    ('quiz-kbo-general-013', '이닝당 볼넷+안타 허용', true, 1), ('quiz-kbo-general-013', '홈런당 타석 수', false, 2), ('quiz-kbo-general-013', '수비율', false, 3), ('quiz-kbo-general-013', '득점권 타율', false, 4),
    ('quiz-kbo-general-014', '투수 대신 공격하는 타자', true, 1), ('quiz-kbo-general-014', '대주자 전담 선수', false, 2), ('quiz-kbo-general-014', '마무리 투수', false, 3), ('quiz-kbo-general-014', '수비 전담 선수', false, 4),
    ('quiz-kbo-general-015', '2008 베이징', true, 1), ('quiz-kbo-general-015', '2006 WBC', false, 2), ('quiz-kbo-general-015', '2013 WBC', false, 3), ('quiz-kbo-general-015', '2020 도쿄', false, 4),
    ('quiz-kbo-general-016', '4강', true, 1), ('quiz-kbo-general-016', '우승', false, 2), ('quiz-kbo-general-016', '예선 탈락', false, 3), ('quiz-kbo-general-016', '준우승', false, 4),
    ('quiz-kbo-general-017', '노히트노런은 출루 허용 가능, 퍼펙트게임은 출루 없음', true, 1), ('quiz-kbo-general-017', '둘은 완전히 같은 기록', false, 2), ('quiz-kbo-general-017', '퍼펙트게임은 안타만 허용하지 않음', false, 3), ('quiz-kbo-general-017', '노히트노런은 홈런만 허용하지 않음', false, 4),
    ('quiz-kbo-general-018', '단타, 2루타, 3루타, 홈런', true, 1), ('quiz-kbo-general-018', '볼넷 4개', false, 2), ('quiz-kbo-general-018', '홈런 3개', false, 3), ('quiz-kbo-general-018', '도루 4개', false, 4),
    ('quiz-kbo-general-019', '세이브', true, 1), ('quiz-kbo-general-019', '홀드', false, 2), ('quiz-kbo-general-019', '타점', false, 3), ('quiz-kbo-general-019', '도루', false, 4),
    ('quiz-kbo-general-020', '홀드', true, 1), ('quiz-kbo-general-020', '세이브', false, 2), ('quiz-kbo-general-020', '완봉', false, 3), ('quiz-kbo-general-020', '타율', false, 4),
    ('quiz-kbo-general-021', '사이클링 히트', true, 1), ('quiz-kbo-general-021', '노히트노런', false, 2), ('quiz-kbo-general-021', '퀄리티스타트', false, 3), ('quiz-kbo-general-021', '더블플레이', false, 4),
    ('quiz-kbo-general-022', '투수 리드와 도루 저지', true, 1), ('quiz-kbo-general-022', '외야 송구만 전담', false, 2), ('quiz-kbo-general-022', '타격만 전담', false, 3), ('quiz-kbo-general-022', '주루 코치', false, 4),
    ('quiz-kbo-general-023', '넓은 수비 범위와 송구', true, 1), ('quiz-kbo-general-023', '불펜 운영', false, 2), ('quiz-kbo-general-023', '홈런 비거리 측정', false, 3), ('quiz-kbo-general-023', '구속 측정', false, 4),
    ('quiz-kbo-general-024', '주자를 진루시키기', true, 1), ('quiz-kbo-general-024', '홈런 치기', false, 2), ('quiz-kbo-general-024', '세이브 얻기', false, 3), ('quiz-kbo-general-024', '도루 막기', false, 4),
    ('quiz-kbo-general-025', '돔구장이라 날씨 영향을 덜 받는다', true, 1), ('quiz-kbo-general-025', '바다 위에 있다', false, 2), ('quiz-kbo-general-025', '두 팀이 함께 홈으로 쓴다', false, 3), ('quiz-kbo-general-025', '천연잔디만 사용한다', false, 4),
    ('quiz-kbo-general-026', '백인천', true, 1), ('quiz-kbo-general-026', '이종범', false, 2), ('quiz-kbo-general-026', '장효조', false, 3), ('quiz-kbo-general-026', '이정후', false, 4),
    ('quiz-kbo-general-027', '르윈 디아즈', true, 1), ('quiz-kbo-general-027', '레이예스', false, 2), ('quiz-kbo-general-027', '김도영', false, 3), ('quiz-kbo-general-027', '오스틴', false, 4),
    ('quiz-kbo-general-028', '코디 폰세', true, 1), ('quiz-kbo-general-028', '앤더슨', false, 2), ('quiz-kbo-general-028', '미란다', false, 3), ('quiz-kbo-general-028', '안우진', false, 4),
    ('quiz-kbo-general-029', '선수별 응원가와 단체 응원', true, 1), ('quiz-kbo-general-029', '관중 응원 금지', false, 2), ('quiz-kbo-general-029', '무조건 무관중 경기', false, 3), ('quiz-kbo-general-029', '응원단 없는 리그', false, 4),
    ('quiz-kbo-general-030', '포스트시즌 최종 우승 결정전', true, 1), ('quiz-kbo-general-030', '시범경기 첫 경기', false, 2), ('quiz-kbo-general-030', '올스타전 홈런 더비', false, 3), ('quiz-kbo-general-030', '퓨처스리그 결승', false, 4)
)
insert into public.quiz_options (
  question_id,
  source_key,
  option_text,
  is_correct,
  sort_order,
  created_at
)
select
  upserted.id,
  options.question_key || '-' || options.sort_order,
  options.option_text,
  options.is_correct,
  options.sort_order,
  now()
from options
join upserted on upserted.source_key = options.question_key;
