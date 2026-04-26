create table if not exists public.team_rank_history (
  id uuid primary key default gen_random_uuid(),
  season integer not null,
  team_name text not null,
  rank integer not null check (rank between 1 and 10),
  wins integer,
  losses integer,
  draws integer,
  win_rate numeric(5, 3),
  sort_order integer not null default 0,
  source text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (season, team_name)
);

create table if not exists public.player_record_entries (
  id uuid primary key default gen_random_uuid(),
  season integer not null,
  group_type text not null check (group_type in ('hitter', 'pitcher')),
  metric text not null,
  rank integer not null,
  player_name text not null,
  team_name text not null,
  value text not null,
  sort_order integer not null default 0,
  source text not null default '',
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  unique (season, group_type, metric, player_name, team_name)
);

create index if not exists team_rank_history_season_sort_idx
  on public.team_rank_history (season, sort_order);

create index if not exists player_record_entries_season_group_sort_idx
  on public.player_record_entries (season, group_type, sort_order, rank);

alter table public.team_rank_history enable row level security;
alter table public.player_record_entries enable row level security;

drop policy if exists "public can read team rank history"
  on public.team_rank_history;
create policy "public can read team rank history"
  on public.team_rank_history
  for select
  to anon, authenticated
  using (true);

drop policy if exists "public can read player record entries"
  on public.player_record_entries;
create policy "public can read player record entries"
  on public.player_record_entries
  for select
  to anon, authenticated
  using (true);

with seasons(season, ordinality) as (
  select *
  from unnest(array[2015, 2016, 2017, 2018, 2019, 2020, 2021, 2022, 2023, 2024, 2025])
    with ordinality
),
teams(team_name, ranks, wins_2025, losses_2025, draws_2025, win_rate_2025, sort_order) as (
  values
    ('LG', array[9, 4, 6, 8, 4, 4, 4, 3, 1, 3, 1], 85, 56, 3, 0.603::numeric, 1),
    ('한화', array[6, 7, 8, 3, 9, 10, 10, 10, 9, 8, 2], 83, 57, 4, 0.593::numeric, 2),
    ('SSG', array[5, 6, 5, 1, 3, 9, 6, 1, 3, 6, 3], 75, 65, 4, 0.536::numeric, 3),
    ('삼성', array[2, 9, 9, 6, 8, 8, 3, 7, 8, 2, 4], 74, 68, 2, 0.521::numeric, 4),
    ('롯데', array[8, 8, 3, 7, 10, 7, 8, 8, 7, 7, 7], 66, 72, 6, 0.478::numeric, 5),
    ('KIA', array[7, 5, 1, 5, 7, 6, 9, 5, 6, 1, 8], 65, 75, 4, 0.464::numeric, 6),
    ('두산', array[1, 1, 2, 2, 1, 2, 2, 9, 5, 4, 9], 61, 77, 6, 0.442::numeric, 7),
    ('KT', array[10, 10, 10, 9, 6, 3, 1, 4, 2, 5, 6], 71, 68, 5, 0.511::numeric, 8),
    ('NC', array[3, 2, 4, 10, 5, 1, 7, 6, 4, 9, 5], 71, 67, 6, 0.514::numeric, 9),
    ('키움', array[4, 3, 7, 4, 2, 5, 5, 2, 10, 10, 10], 47, 93, 4, 0.336::numeric, 10)
)
insert into public.team_rank_history (
  season,
  team_name,
  rank,
  wins,
  losses,
  draws,
  win_rate,
  sort_order,
  source,
  updated_at
)
select
  seasons.season,
  teams.team_name,
  teams.ranks[seasons.ordinality::int],
  case when seasons.season = 2025 then teams.wins_2025 end,
  case when seasons.season = 2025 then teams.losses_2025 end,
  case when seasons.season = 2025 then teams.draws_2025 end,
  case when seasons.season = 2025 then teams.win_rate_2025 end,
  teams.sort_order,
  case
    when seasons.season = 2025 then 'https://mykbostats.com/standings'
    else 'legacy app data'
  end,
  now()
from teams
cross join seasons
on conflict (season, team_name) do update set
  rank = excluded.rank,
  wins = excluded.wins,
  losses = excluded.losses,
  draws = excluded.draws,
  win_rate = excluded.win_rate,
  sort_order = excluded.sort_order,
  source = excluded.source,
  updated_at = now();

delete from public.player_record_entries
where season = 2025
  and group_type in ('hitter', 'pitcher');

insert into public.player_record_entries (
  season,
  group_type,
  metric,
  rank,
  player_name,
  team_name,
  value,
  sort_order,
  source,
  updated_at
)
values
  (2025, 'hitter', '타율', 1, '양의지', '두산', '0.337', 1001, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 2, '안현민', 'KT', '0.334', 1002, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 3, '김성윤', '삼성', '0.331', 1003, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 4, '레이예스', '롯데', '0.326', 1004, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 5, '문현빈', '한화', '0.320', 1005, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 6, '구자욱', '삼성', '0.319', 1006, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 7, '송성문', '키움', '0.315', 1007, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 8, '르윈 디아즈', '삼성', '0.314', 1008, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 9, '신민재', 'LG', '0.313', 1009, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '타율', 10, '오스틴', 'LG', '0.313', 1010, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 1, '레이예스', '롯데', '187', 2001, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 2, '송성문', '키움', '181', 2002, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 3, '르윈 디아즈', '삼성', '173', 2003, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 4, '문현빈', '한화', '169', 2004, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 5, '구자욱', '삼성', '169', 2005, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 6, '김주원', 'NC', '156', 2006, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 7, '양의지', '두산', '153', 2007, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 8, '김성윤', '삼성', '151', 2008, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 9, '박찬호', 'KIA', '148', 2009, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '안타', 10, '최지훈', 'SSG', '147', 2010, 'https://mykbostats.com/stats/top/ba/2025', now()),
  (2025, 'hitter', '홈런', 1, '르윈 디아즈', '삼성', '50', 3001, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 2, '데이비슨', 'NC', '36', 3002, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 3, '위즈덤', 'KIA', '35', 3003, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 4, '노시환', '한화', '32', 3004, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 5, '오스틴', 'LG', '31', 3005, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 6, '송성문', '키움', '26', 3006, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 7, '문보경', 'LG', '24', 3007, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 7, '최형우', 'KIA', '24', 3008, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 9, '최정', 'SSG', '23', 3009, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '홈런', 10, '박동원', 'LG', '22', 3010, 'https://mykbostats.com/stats/top/hr/2025', now()),
  (2025, 'hitter', '타점', 1, '르윈 디아즈', '삼성', '158', 4001, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 2, '문보경', 'LG', '108', 4002, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 3, '레이예스', '롯데', '107', 4003, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 4, '노시환', '한화', '101', 4004, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 5, '데이비슨', 'NC', '97', 4005, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 6, '구자욱', '삼성', '96', 4006, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 7, '오스틴', 'LG', '95', 4007, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 8, '김현수', 'LG', '90', 4008, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 8, '송성문', '키움', '90', 4009, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '타점', 10, '양의지', '두산', '89', 4010, 'https://mykbostats.com/stats/top/rbi/2025', now()),
  (2025, 'hitter', '도루', 1, '박해민', 'LG', '49', 5001, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 2, '김주원', 'NC', '44', 5002, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 3, '정준재', 'SSG', '37', 5003, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 4, '최정원', 'NC', '30', 5004, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 5, '조수행', '두산', '30', 5005, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 6, '최지훈', 'SSG', '28', 5006, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 7, '박민우', 'NC', '28', 5007, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 8, '박찬호', 'KIA', '27', 5008, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 9, '김성윤', '삼성', '26', 5009, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'hitter', '도루', 10, '정수빈', '두산', '26', 5010, 'https://mykbostats.com/stats/top/sb/2025', now()),
  (2025, 'pitcher', '평균자책점', 1, '코디 폰세', '한화', '1.89', 6001, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 2, '네일', 'KIA', '2.25', 6002, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 3, '앤더슨', 'SSG', '2.25', 6003, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 4, '후라도', '삼성', '2.60', 6004, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 5, '로그', '두산', '2.81', 6005, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 6, '와이스', '한화', '2.87', 6006, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 7, '임찬규', 'LG', '3.03', 6007, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 8, '원태인', '삼성', '3.24', 6008, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 9, '고영표', 'KT', '3.30', 6009, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '평균자책점', 10, '소형준', 'KT', '3.30', 6010, 'https://mykbostats.com/stats/top/era/2025', now()),
  (2025, 'pitcher', '승리', 1, '코디 폰세', '한화', '17', 7001, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 2, '라일리 톰슨', 'NC', '17', 7002, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 3, '와이스', '한화', '16', 7003, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 4, '후라도', '삼성', '15', 7004, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 5, '치리노스', 'LG', '13', 7005, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 6, '원태인', '삼성', '12', 7006, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 7, '앤더슨', 'SSG', '12', 7007, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 8, '미치 화이트', 'SSG', '11', 7008, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 9, '문동주', '한화', '11', 7009, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '승리', 10, '손주영', 'LG', '11', 7010, 'https://mykbostats.com/stats/top/w/2025', now()),
  (2025, 'pitcher', '탈삼진', 1, '코디 폰세', '한화', '252', 8001, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 2, '앤더슨', 'SSG', '245', 8002, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 3, '라일리 톰슨', 'NC', '216', 8003, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 4, '와이스', '한화', '207', 8004, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 5, '올러', 'KIA', '169', 8005, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 6, '데 헤이수스', 'KT', '165', 8006, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 7, '로그', '두산', '156', 8007, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 7, '박세웅', '롯데', '156', 8008, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 9, '고영표', 'KT', '154', 8009, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '탈삼진', 10, '네일', 'KIA', '152', 8010, 'https://mykbostats.com/stats/top/k/2025', now()),
  (2025, 'pitcher', '세이브', 1, '박영현', 'KT', '35', 9001, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 2, '김서현', '한화', '33', 9002, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 3, '김원중', '롯데', '32', 9003, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 4, '조병현', 'SSG', '30', 9004, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 5, '류진욱', 'NC', '29', 9005, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 6, '정해영', 'KIA', '27', 9006, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 7, '김택연', '두산', '24', 9007, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 8, '유영찬', 'LG', '21', 9008, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 9, '주승우', '키움', '16', 9009, 'https://mykbostats.com/stats/top/sv/2025', now()),
  (2025, 'pitcher', '세이브', 10, '김재윤', '삼성', '13', 9010, 'https://mykbostats.com/stats/top/sv/2025', now())
on conflict (season, group_type, metric, player_name, team_name) do update set
  rank = excluded.rank,
  value = excluded.value,
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
  ('trivia-2025-001', '2025 시즌', 'LG 정규시즌 1위', '85승으로 1위', '2025년 KBO 정규시즌 1위는 LG 트윈스였다.', 'LG는 85승 56패 3무, 승률 0.603으로 정규시즌 1위를 기록했다.', '4', 10001, true, now()),
  ('trivia-2025-002', '2025 시즌', '한화 2위 도약', '83승 2위', '한화는 2025년 정규시즌 2위에 올랐다.', '한화는 83승 57패 4무, 승률 0.593으로 LG와 상위권 경쟁을 했다.', '5', 10002, true, now()),
  ('trivia-2025-003', '2025 시즌', '르윈 디아즈 50홈런', '홈런 1위', '르윈 디아즈는 2025년 50홈런으로 홈런 1위를 기록했다.', '삼성 소속 디아즈는 홈런과 타점 모두 최상위권에 오른 중심 타자였다.', '5', 10003, true, now()),
  ('trivia-2025-004', '2025 시즌', '디아즈 158타점', '타점 1위', '2025년 타점 1위도 르윈 디아즈였다.', '디아즈는 158타점으로 리그 최고 생산력을 보였다.', '5', 10004, true, now()),
  ('trivia-2025-005', '2025 시즌', '양의지 타율 1위', '0.337', '양의지는 2025년 타율 0.337로 타율 1위에 올랐다.', '포수 포지션에서 높은 타율을 기록한 점이 특히 돋보인다.', '4', 10005, true, now()),
  ('trivia-2025-006', '2025 시즌', '레이예스 최다 안타', '187안타', '레이예스는 2025년 187안타로 최다 안타 1위를 기록했다.', '꾸준한 출루와 컨택 능력이 누적 기록으로 이어졌다.', '4', 10006, true, now()),
  ('trivia-2025-007', '2025 시즌', '박해민 도루 1위', '49도루', '박해민은 2025년 49도루로 도루 1위를 차지했다.', '빠른 발과 주루 판단이 도루 순위에서 강점으로 나타났다.', '4', 10007, true, now()),
  ('trivia-2025-008', '2025 시즌', '코디 폰세 ERA 1위', '1.89', '코디 폰세는 2025년 평균자책점 1.89로 ERA 1위를 기록했다.', '규정 이닝급 선발 투수 중 압도적인 실점 억제력을 보여줬다.', '5', 10008, true, now()),
  ('trivia-2025-009', '2025 시즌', '폰세 탈삼진 252개', '탈삼진 1위', '코디 폰세는 252탈삼진으로 2025년 탈삼진 1위에도 올랐다.', 'ERA, 승리, 탈삼진에서 모두 최상위권을 기록한 시즌이었다.', '5', 10009, true, now()),
  ('trivia-2025-010', '2025 시즌', '폰세와 톰슨 17승', '다승 공동 선두', '코디 폰세와 라일리 톰슨은 2025년 17승을 기록했다.', '두 투수는 다승 부문에서 나란히 최상위권에 이름을 올렸다.', '4', 10010, true, now()),
  ('trivia-2025-011', '2025 시즌', '박영현 35세이브', '세이브 1위', '박영현은 2025년 35세이브로 세이브 1위를 기록했다.', 'KT 마무리로 많은 접전 상황을 책임진 시즌이었다.', '4', 10011, true, now()),
  ('trivia-2025-012', '2025 시즌', '김서현 33세이브', '세이브 2위', '김서현은 2025년 33세이브로 세이브 2위를 기록했다.', '한화의 상위권 시즌에서 불펜 마무리 역할이 돋보였다.', '4', 10012, true, now()),
  ('trivia-2025-013', '2025 시즌', 'NC 5위', '71승 67패 6무', 'NC는 2025년 정규시즌 5위였다.', 'NC는 71승 67패 6무, 승률 0.514를 기록했다.', '3', 10013, true, now()),
  ('trivia-2025-014', '2025 시즌', 'KT 6위', '승률 0.511', 'KT는 2025년 정규시즌 6위를 기록했다.', 'KT는 71승 68패 5무로 NC와 매우 근접한 승률 경쟁을 했다.', '3', 10014, true, now()),
  ('trivia-2025-015', '2025 시즌', '삼성 4위', '74승 68패 2무', '삼성은 2025년 정규시즌 4위에 올랐다.', '삼성은 74승 68패 2무, 승률 0.521을 기록했다.', '3', 10015, true, now()),
  ('trivia-2025-016', '2025 시즌', 'SSG 3위', '75승 65패 4무', 'SSG는 2025년 정규시즌 3위를 기록했다.', 'SSG는 승률 0.536으로 상위권을 지켰다.', '3', 10016, true, now()),
  ('trivia-2025-017', '2025 시즌', '문보경 108타점', '타점 2위', '문보경은 2025년 108타점으로 타점 2위를 기록했다.', 'LG 타선에서 중심 생산력을 보여준 시즌이었다.', '4', 10017, true, now()),
  ('trivia-2025-018', '2025 시즌', '데이비슨 36홈런', '홈런 2위', '데이비슨은 2025년 36홈런으로 홈런 2위를 기록했다.', 'NC 중심 타선에서 장타 생산을 담당했다.', '4', 10018, true, now()),
  ('trivia-2025-019', '2025 시즌', '앤더슨 245탈삼진', '탈삼진 2위', '앤더슨은 2025년 245탈삼진으로 탈삼진 2위를 기록했다.', 'SSG 선발진에서 강력한 구위를 보여준 기록이다.', '4', 10019, true, now()),
  ('trivia-2025-020', '2025 시즌', '후라도 15승', '다승 상위권', '후라도는 2025년 15승으로 다승 상위권에 올랐다.', '삼성의 상위권 경쟁에 선발 투수로 큰 역할을 했다.', '4', 10020, true, now())
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
where source_key like 'quiz-2025-%';

with questions(source_key, question, explanation, category, difficulty, sort_order) as (
  values
    ('quiz-2025-001', '2025 KBO 정규시즌 1위 팀은?', 'LG는 85승 56패 3무, 승률 0.603으로 2025 정규시즌 1위를 기록했다.', '2025 시즌', 'easy', 20001),
    ('quiz-2025-002', '2025 KBO 정규시즌 2위 팀은?', '한화는 83승 57패 4무로 정규시즌 2위에 올랐다.', '2025 시즌', 'easy', 20002),
    ('quiz-2025-003', '2025년 홈런 1위 선수는?', '삼성의 르윈 디아즈는 50홈런으로 홈런 1위를 기록했다.', '2025 시즌', 'easy', 20003),
    ('quiz-2025-004', '2025년 타점 1위 선수는?', '르윈 디아즈는 158타점으로 타점 1위였다.', '2025 시즌', 'easy', 20004),
    ('quiz-2025-005', '2025년 타율 1위 선수는?', '두산의 양의지는 타율 0.337로 1위에 올랐다.', '2025 시즌', 'medium', 20005),
    ('quiz-2025-006', '2025년 최다 안타 1위 선수는?', '롯데의 레이예스는 187안타로 최다 안타 1위를 기록했다.', '2025 시즌', 'medium', 20006),
    ('quiz-2025-007', '2025년 도루 1위 선수는?', 'LG의 박해민은 49도루로 도루 1위를 기록했다.', '2025 시즌', 'medium', 20007),
    ('quiz-2025-008', '2025년 평균자책점 1위 투수는?', '한화의 코디 폰세는 평균자책점 1.89로 1위를 기록했다.', '2025 시즌', 'medium', 20008),
    ('quiz-2025-009', '2025년 탈삼진 1위 투수는?', '코디 폰세는 252탈삼진으로 탈삼진 1위였다.', '2025 시즌', 'medium', 20009),
    ('quiz-2025-010', '2025년 세이브 1위 선수는?', 'KT의 박영현은 35세이브로 세이브 1위를 기록했다.', '2025 시즌', 'medium', 20010),
    ('quiz-2025-011', '2025년 정규시즌 3위 팀은?', 'SSG는 75승 65패 4무로 정규시즌 3위였다.', '2025 시즌', 'easy', 20011),
    ('quiz-2025-012', '2025년 정규시즌 4위 팀은?', '삼성은 74승 68패 2무로 정규시즌 4위였다.', '2025 시즌', 'easy', 20012),
    ('quiz-2025-013', '2025년 NC의 정규시즌 순위는?', 'NC는 71승 67패 6무로 정규시즌 5위였다.', '2025 시즌', 'medium', 20013),
    ('quiz-2025-014', '2025년 KT의 정규시즌 순위는?', 'KT는 71승 68패 5무로 정규시즌 6위였다.', '2025 시즌', 'medium', 20014),
    ('quiz-2025-015', '2025년 홈런 2위 선수는?', 'NC의 데이비슨은 36홈런으로 홈런 2위였다.', '2025 시즌', 'medium', 20015),
    ('quiz-2025-016', '2025년 타점 2위 선수는?', 'LG의 문보경은 108타점으로 타점 2위를 기록했다.', '2025 시즌', 'medium', 20016),
    ('quiz-2025-017', '2025년 탈삼진 2위 투수는?', 'SSG의 앤더슨은 245탈삼진으로 2위였다.', '2025 시즌', 'hard', 20017),
    ('quiz-2025-018', '2025년 다승 공동 1위가 아닌 선수는?', '코디 폰세와 라일리 톰슨이 17승으로 다승 공동 1위였다.', '2025 시즌', 'hard', 20018),
    ('quiz-2025-019', '2025년 정규시즌 10위 팀은?', '키움은 47승 93패 4무로 정규시즌 10위였다.', '2025 시즌', 'easy', 20019),
    ('quiz-2025-020', '2025년 삼성 소속으로 홈런 50개를 기록한 선수는?', '르윈 디아즈는 삼성 소속으로 50홈런을 기록했다.', '2025 시즌', 'easy', 20020)
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
deleted as (
  delete from public.quiz_options
  where question_id in (select id from upserted)
  returning 1 as deleted_row
),
options(question_key, option_text, is_correct, sort_order) as (
  values
    ('quiz-2025-001', 'LG', true, 1), ('quiz-2025-001', '한화', false, 2), ('quiz-2025-001', 'SSG', false, 3), ('quiz-2025-001', '삼성', false, 4),
    ('quiz-2025-002', '한화', true, 1), ('quiz-2025-002', 'LG', false, 2), ('quiz-2025-002', 'KT', false, 3), ('quiz-2025-002', 'KIA', false, 4),
    ('quiz-2025-003', '르윈 디아즈', true, 1), ('quiz-2025-003', '데이비슨', false, 2), ('quiz-2025-003', '오스틴', false, 3), ('quiz-2025-003', '노시환', false, 4),
    ('quiz-2025-004', '르윈 디아즈', true, 1), ('quiz-2025-004', '오스틴', false, 2), ('quiz-2025-004', '노시환', false, 3), ('quiz-2025-004', '송성문', false, 4),
    ('quiz-2025-005', '양의지', true, 1), ('quiz-2025-005', '안현민', false, 2), ('quiz-2025-005', '김성윤', false, 3), ('quiz-2025-005', '구자욱', false, 4),
    ('quiz-2025-006', '레이예스', true, 1), ('quiz-2025-006', '송성문', false, 2), ('quiz-2025-006', '르윈 디아즈', false, 3), ('quiz-2025-006', '문현빈', false, 4),
    ('quiz-2025-007', '박해민', true, 1), ('quiz-2025-007', '김주원', false, 2), ('quiz-2025-007', '정준재', false, 3), ('quiz-2025-007', '조수행', false, 4),
    ('quiz-2025-008', '코디 폰세', true, 1), ('quiz-2025-008', '라일리 톰슨', false, 2), ('quiz-2025-008', '원태인', false, 3), ('quiz-2025-008', '앤더슨', false, 4),
    ('quiz-2025-009', '코디 폰세', true, 1), ('quiz-2025-009', '앤더슨', false, 2), ('quiz-2025-009', '라일리 톰슨', false, 3), ('quiz-2025-009', '와이스', false, 4),
    ('quiz-2025-010', '박영현', true, 1), ('quiz-2025-010', '김서현', false, 2), ('quiz-2025-010', '김원중', false, 3), ('quiz-2025-010', '정해영', false, 4),
    ('quiz-2025-011', 'SSG', true, 1), ('quiz-2025-011', '삼성', false, 2), ('quiz-2025-011', 'NC', false, 3), ('quiz-2025-011', 'KT', false, 4),
    ('quiz-2025-012', '삼성', true, 1), ('quiz-2025-012', 'SSG', false, 2), ('quiz-2025-012', 'NC', false, 3), ('quiz-2025-012', '롯데', false, 4),
    ('quiz-2025-013', '5위', true, 1), ('quiz-2025-013', '3위', false, 2), ('quiz-2025-013', '6위', false, 3), ('quiz-2025-013', '9위', false, 4),
    ('quiz-2025-014', '6위', true, 1), ('quiz-2025-014', '2위', false, 2), ('quiz-2025-014', '5위', false, 3), ('quiz-2025-014', '10위', false, 4),
    ('quiz-2025-015', '데이비슨', true, 1), ('quiz-2025-015', '위즈덤', false, 2), ('quiz-2025-015', '노시환', false, 3), ('quiz-2025-015', '오스틴', false, 4),
    ('quiz-2025-016', '문보경', true, 1), ('quiz-2025-016', '레이예스', false, 2), ('quiz-2025-016', '데이비슨', false, 3), ('quiz-2025-016', '오스틴', false, 4),
    ('quiz-2025-017', '앤더슨', true, 1), ('quiz-2025-017', '와이스', false, 2), ('quiz-2025-017', '라일리 톰슨', false, 3), ('quiz-2025-017', '네일', false, 4),
    ('quiz-2025-018', '후라도', true, 1), ('quiz-2025-018', '코디 폰세', false, 2), ('quiz-2025-018', '라일리 톰슨', false, 3), ('quiz-2025-018', '두 선수 모두', false, 4),
    ('quiz-2025-019', '키움', true, 1), ('quiz-2025-019', '두산', false, 2), ('quiz-2025-019', 'KIA', false, 3), ('quiz-2025-019', '롯데', false, 4),
    ('quiz-2025-020', '르윈 디아즈', true, 1), ('quiz-2025-020', '김영웅', false, 2), ('quiz-2025-020', '구자욱', false, 3), ('quiz-2025-020', '원태인', false, 4)
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
join upserted on upserted.source_key = options.question_key
where not exists (select 1 from deleted where false);
