begin;

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-1', '타자', '홈런', '타자가 친 공이 규정된 펜스나 관중석으로 넘어가 즉시 득점이 인정되는 타격. 타자와 모든 주자는 베이스를 돌며 득점으로 기록된다. 타구 궤적·풍향·펜스 높이에 따라 판정이 달라질 수 있다.', 0)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-2', '타자', 'BQ', 'Baseball Quotient의 줄임말로 야구선수가 플레이하는 센스 같은 것들을 통칭해서 일컫는 말.', 1)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-3', '타자', '대타', '경기 중 타석에 들어서기 위해 원래 타자를 대신하는 선수. 주로 강타자나 좌우 스페셜리스트가 기용된다.', 2)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-4', '타자', '직선타(라인드라이브)', '타구가 낮고 빠르게 직선으로 날아가는 타격. 수비하기 어렵고 안타로 연결될 확률이 높다.', 3)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-5', '타자', '볼넷', '투수가 스트라이크 판정 기준을 벗어난 4개의 볼을 던져 타자가 자동으로 1루에 출루하는 상황. 주자 진루 규정(포스 등)이 함께 적용된다.', 4)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-6', '타자', '삼진', '타자가 스트라이크로 판정되는 투구를 3번 받아 아웃되는 경우. 헛스윙 삼진과 스트라이크 판정 삼진, 낫아웃 상황 등이 존재한다.', 5)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-7', '타자', '타율', '타자의 안타 비율을 나타내는 지표(안타 ÷ 타수). 타격 효율을 보여주지만 출루율·장타력 등과 함께 해석해야 한다.', 6)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-8', '타자', '출루율', '타자가 타석에서 출루한 비율(안타+볼넷+사구 ÷ 타수+볼넷+사구+희생플라이). 선수의 출루 기여도를 평가하는 핵심 지표.', 7)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-9', '타자', '장타율', '타격의 질을 반영하는 지표(총루타 ÷ 타수). 장타 생산력을 가늠하는 데 사용된다.', 8)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-10', '타자', 'OPS', '출루율과 장타율을 합한 지표(OBP + SLG). 출루 능력과 장타력을 동시에 고려해 공격력을 종합 평가한다.', 9)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-11', '타자', '타점', '타자가 친 공으로 인해 득점을 올렸을 때 기록되는 개인 기록. 경기 상황에 따른 기여도를 보여준다.', 10)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-12', '타자', '규정타석', '타자가 시즌 기록에 포함되기 위해 필요한 최소 타석 수. KBO는 전체 경기 수*3.1로 144경기 기준 446타석이다.', 11)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-13', '타자', '루타', '타자가 친 타구로 인해 얻은 베이스 수의 합계. 단타(1루타), 2루타, 3루타, 홈런에 따라 각각 1, 2, 3, 4루타로 계산된다.', 12)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-14', '타자', '도루', '주자가 투구나 타구의 순간을 이용해 다음 베이스로 진루하는 행위. 성공률은 주자 속도·타이밍·포수 송구 능력에 좌우된다.', 13)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-15', '타자', '병살타', '한 번의 타격으로 연속해 두 명 이상의 주자가 아웃되는 상황. 공격 흐름을 끊는 결과가 된다.', 14)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-16', '타자', '런 앤드 히트', '주자가 도루를 시도할 때 타자가 공을 쳐내는 전략적 타격. 주로 주자가 2루에 있을 때 사용된다.', 15)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-17', '타자', '안타', '타자가 친 공이 수비에 의해 아웃되지 않고 베이스에 안전히 도달하거나 주자가 추가 진루한 경우. 1·2·3루타, 장타 유형에 따라 기록이 달라진다.', 16)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-18', '타자', '스몰볼', '장타보다는 단타, 도루, 희생번트 등 작은 공격 전술을 활용해 점수를 내는 전략적 야구 스타일.', 17)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-19', '타자', '클린업 트리오', '타순에서 3~5번 타자를 일컫는 용어로, 팀의 중심 타선 역할을 한다. 주로 강타자들이 포진한다.', 18)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-20', '타자', '테이블 세터', '타순에서 1~2번 타자를 일컫는 용어로, 출루율이 높고 빠른 주자를 배치해 공격 기회를 창출하는 역할을 한다.', 19)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-21', '타자', '타자일순', '한 이닝에 타자 9명이 모두 타석에 들어서는 상황. 공격 기회가 극대화되었음을 의미한다.', 20)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-22', '타자', '그린라이트', '발이 빠르고 주루 센스가 뛰어나, 도루 성공률이 높은 선수에게는 스스로의 판단에 의해 도루할 수 있는 권한를 주는 작전. 혹은 감독이 적극적인 주루 플레이를 강조하면서 주자들에게 주기도 한다.', 21)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-23', '타자', '인정 2루타', '타자가 친 인플레이 타구가 경기를 할 수 없는 곳으로 나갔을 때, 심판 재량으로 2루타를 선언하는 규정이다. 타자에게는 2루까지 안전진루권이 부여되고, 주자들 역시 2개 베이스를 진루한다. 2루 주자와 3루 주자는 홈인하여 득점한다.', 22)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-24', '타자', '배트 플립', '타격 후 배트를 던지거나 휘두르는 동작. 감정 표현이나 팬 서비스로 사용되지만, 스포츠맨십 논란이 있을 수 있다.', 23)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-25', '타자', '백투백', '선행 타자가 홈런을 기록 한 후 다음 타자가 바로 홈런을 때린 경우 백투백 홈런이라고 하며 줄여서 백투백이라고 한다. 연속 홈런을 의미한다.', 24)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-26', '타자', '희생 번트', '타자가 배트를 수평으로 밀어 공을 짧게 보내 주자를 진루시키는 전략적 타격. 타자는 아웃되지만 팀 기여도가 높다.', 25)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-27', '타자', '번트', '타격자가 배트를 수평으로 밀어 공을 짧게 보내는 기술. 희생번트로 주자를 진루시키거나 기습번트로 안타를 노릴 때 사용된다.', 26)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-28', '타자', '인사이드 더 파크 홈런', '타자가 친 공이 외야 펜스를 넘지 않고 필드 내에서 주자가 베이스를 모두 돌아 홈에 들어오는 홈런. 빠른 주자와 수비 실책이 결합될 때 발생한다.', 27)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-29', '타자', '희생플라이', '타자가 플라이로 아웃되지만 그 사이 주자가 진루하거나 득점해 타점이 인정되는 플레이. 팀 기여는 높지만 타자 기록에는 아웃으로 남는다.', 28)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-30', '타자', '클러치 히트', '중요한 순간(득점권·끝판 등)에 터진 안타로 경기 흐름을 바꾸는 결정타. 심리적·전술적 중요성이 크다.', 29)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-31', '타자', '끝내기', '홈팀이 마지막 공격에서 승리를 확정짓는 점수나 플레이. 발생 즉시 경기 종료와 결과 확정이 된다.', 30)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-32', '타자', '역전타', '뒤진 상황에서 한 번의 타격으로 점수를 올려 경기를 역전시키는 결정타.', 31)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-33', '타자', '타석', '선수가 공식적으로 타격 기회를 갖는 상태. 타수·출루 등 기록 집계의 기본 단위.', 32)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-34', '타자', '스윙 판정', '타자가 투구에 대해 배트를 휘둘렀는지 여부를 심판이 판단하는 규정. 스윙 판정은 삼진·볼 판정에 직접 영향.', 33)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-35', '타자', '페이크 번트 슬래시', '타자가 번트 자세를 취하다가 갑자기 스윙으로 전환하는 타격 기술. 수비를 혼란스럽게 만들어 안타 확률을 높인다.', 34)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-36', '타자', '쓰리 번트 아웃', '2 스트라이크 상황에서 타자가 번트를 시도했다가 파울이 될 경우, 번트를 댄 타자는 삼진 아웃이 되며 이때 투수가 삼진 하나를 잡은 것으로 기록된다.', 35)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-37', '타자', '타구맞음 아웃', '타자가 친 타구가 주자의 몸에 맞으면서 아웃 처리되는 상황을 말한다. 주자가 고의로 몸에 맞으려는 의도가 없더라도 타구에 맞으면 아웃이 된다.', 36)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-38', '타자', '스퀴즈 번트', '3루 주자를 홈으로 불러 들이기 위한 목적으로 대는 기습 번트. 희생번트의 일부로 분류되며 성공시에도 기록지에는 희생번트로 남는다.', 37)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-39', '타자', '더블스틸', '두 명의 주자가 동시에 도루를 시도하는 전략적 플레이. 성공 시 큰 이득을 얻지만 실패 위험도 크다.', 38)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-40', '타자', '홈스틸', '주자가 3루에서 홈으로 도루를 시도하는 고난도 플레이. 포수의 송구와 주자의 스피드가 승부를 가른다.', 39)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-41', '타자', '무관심도루', '투수나 포수가 주자의 도루 시도를 인지하지 못해 허용되는 도루. 주로 투수의 견제 미흡에서 발생한다.', 40)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-42', '타자', '대주자', '주로 주루 능력이 뛰어난 선수가 타자를 대신해 주자로 나서는 경우. 경기 후반 주로 기용된다.', 41)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-43', '타자', '내야안타', '내야에서의 안타로, 주로 타구 속도·수비 실책·주자 스피드가 결합해 발생한다. 기록상 안타로 인정된다.', 42)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-44', '타자', '진루타', '타자가 친 타구로 인해 주자가 한 베이스 이상 진루한 경우. 타점과 함께 공격 기여도를 평가하는 요소.', 43)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-45', '타자', '플라이볼', '타구가 공중으로 높게 떠서 외야에서 처리되는 유형의 타구. 타구 궤적과 외야 수비 배치가 중요하다.', 44)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-46', '타자', '땅볼', '타구가 지면을 따라 빠르게 굴러가는 타입의 타구. 내야 수비에 의해 병살로 이어질 위험이 있다.', 45)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-47', '타자', '타격 폼', '스윙 메커니즘과 타격 자세의 조합. 일관된 폼은 타구품질 향상에 기여한다.', 46)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-48', '타자', '컨택 히터', '타구 컨택 능력이 뛰어난 타자. 볼을 잘 맞히고 출루율이 높은 유형.', 47)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-49', '타자', '본헤드 플레이', '타격이나 주루에서의 어리석은 실수로 인해 팀에 불리한 상황을 초래하는 플레이.', 48)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-50', '타자', '밀어내기', '주자 만루에서 볼넷, 몸에 맞는 공을 포함한 사사구, 타격방해 등으로 타자가 1루 진루권을 얻었을 때, 그로 인해 홈에 들어오는 주자에게 득점이 인정되는 상황.', 49)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-51', '타자', '파워 히터', '장타·홈런 생산 능력이 높은 타자. 슬러거로 분류되며 팀의 타점 생산원이다.', 50)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-52', '타자', '플레이트 디시플린', '스트라이크존 선택 능력. 좋은 디시플린은 볼넷 증가와 타율 안정으로 이어진다.', 51)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-53', '타자', '5툴 플레이어', '파워, 스피드, 컨텍트, 순발력 & 핸들링, 어깨 등 야구의 다섯 가지 기본 능력을 모두 갖춘 선수.', 52)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-54', '투수', 'ERA', '평균자책점(자책점×9 ÷ 이닝). 투수의 평균적인 실점 허용 능력을 보여주는 기본 지표.', 53)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-55', '투수', 'WHIP', '이닝당 허용 주자수((볼넷+피안타) ÷ 이닝). 제구력과 위기 관리 능력을 평가한다.', 54)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-56', '투수', '세이브', '마무리 투수가 리드를 지키며 경기를 끝냈을 때 주어지는 기록. 상황 조건이 존재한다.', 55)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-57', '투수', '홀드', '중간계투가 세이브 상황을 유지한 경우 부여되는 기록. 불펜 기여도를 나타낸다.', 56)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-58', '투수', '완투', '선발투수가 경기를 처음부터 끝까지 소화한 기록. 체력과 효율성의 표시.', 57)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-59', '투수', '견제', '투수가 주자를 견제하기 위해 베이스로 던지는 동작. 주자의 도루 시도를 억제하는 효과가 있다.', 58)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-60', '투수', '완봉', '상대에게 득점을 허용하지 않고 경기를 마친 완투. 뛰어난 피칭의 증거.', 59)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-61', '투수', '노히트노런', '상대에게 단 한 개의 안타도 허용하지 않은 경기. 투수와 수비의 완벽한 호흡 필요.', 60)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-62', '투수', '직구', '가장 기본적인 빠른 구종. 구속과 제구로 승부하며 다른 변화구와 조합해 사용된다.', 61)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-63', '투수', '슬라이더', '옆으로 꺾이는 변화구. 타자의 타이밍을 뺏거나 유인하는 데 쓴다.', 62)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-64', '투수', '플래툰', '상대팀의 투수에 따라 타자를 선별적으로 기용하거나 혹은 반대로 타자에 따라 투수를 선별적으로 기용하는 작전.', 63)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-65', '투수', '커브', '낮은 속도로 크게 휘어지는 변화구. 타자의 상단 타이밍을 무너뜨린다.', 64)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-66', '투수', '체인지업', '직구와 유사한 폼에서 속도 차로 타자의 타이밍을 흐트리는 구종.', 65)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-67', '투수', '포심 패스트볼', '손가락 배치로 회전수와 직진성이 특징인 대표적 빠른 공.', 66)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-68', '투수', '투구수', '투수가 경기 중 던진 전체 공의 수. 체력 관리와 교체 판단의 핵심.', 67)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-69', '투수', '제구력', '원하는 위치에 공을 던지는 능력. 제구가 좋으면 볼넷 감소와 유리한 카운트 형성 가능.', 68)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-70', '투수', '퀵 후크', '빠른 선발 투수 교체. 투수가 흔들리거나 타자에게 유리한 상황에서 신속히 교체하는 전략.', 69)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-71', '투수', '규정이닝', '리그 내 투수의 비율 기록을 산정하는 데에서 최소로 필요한 이닝을 규정한 것으로 KBO에서는 한 시즌 144경기 기준 144이닝, MLB에서는 162경기 기준 162이닝을 의미한다.', 70)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-72', '투수', '구속', '투구 속도. 일반적으로 구속이 빠를수록 타자 상대 우위가 크다.', 71)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-73', '투수', '릴리스 포인트', '공을 놓는 시점의 위치. 일관된 릴리스는 구종 완성도와 제구에 영향.', 72)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-74', '투수', '커맨드', '스트라이크존 내 특정 코스를 제어하는 능력. 제구와 함께 투수 성패를 좌우한다.', 73)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-75', '투수', '세트 포지션', '주자가 있을 때 투수가 취하는 투구 자세. 견제 동작과 투구 밸런스에 영향을 준다.', 74)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-76', '투수', '불펜', '교체 투수들이 대기하는 장소 및 교체 투수군 자체를 가리키는 용어. 불펜 운영은 경기 후반 승부의 핵심.', 75)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-77', '투수', '선발투수', '경기 시작 투수로서 이닝을 책임지고 길게 버티는 역할. 로테이션 관리가 중요하다.', 76)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-78', '투수', 'IRA', '어떤 투수가 한 경기에서 이전에 등판했던 투수와 교체되어 등판할 때 이전 투수가 출루를 허용한 채로 루상에 주자가 남아있는 경우가 있다. 이때 후발로 등판한 투수가 이 주자들에게 득점을 내줄 경우 수치가 올라가는 지표이다. 즉, 이전 투수가 허용한 주자들이 후발 투수의 책임으로 득점하는 경우를 의미한다.', 77)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-79', '투수', '강판', '투수가 교체되는 상황. 성적 부진, 투구수 초과, 전략적 판단 등 다양한 이유로 발생.', 78)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-80', '투수', '구원투수', '선발 뒤를 이어 등판하는 투수. 상황별로 셋업맨·롱릴리프·클로저 등이 있다.', 79)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-81', '투수', '셋업맨', '주로 7~8회에 등판해 세이브 상황으로 연결시키는 역할의 계투.', 80)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-82', '투수', '마운드', '투수가 야구장에서 투구할 때 밟고 올라서는 투구판을 중심으로 한 다른 곳보다 조금 높은 지형.', 81)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-83', '투수', '롱릴리프', '선발 투수가 조기 강판 당하거나 부상당했을 때 긴 이닝을 소화하기 위해 대비하는 보직.', 82)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-84', '투수', '클로저', '9회에 등판해 경기를 마무리하는 마무리 투수. 강한 멘탈과 단기 구위가 요구된다.', 83)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-85', '투수', '빈 볼', '타자를 향해 고의로 던진 위험한 투구. 고의성이 있을 경우 퇴장 및 징계 대상이 될 수 있다.', 84)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-86', '투수', '블론세이브', '세이브 조건에서 동점 혹은 역전을 허용한 경우 마운드에 있는 투수에게 주어지는 기록.', 85)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-87', '투수', '고의4구', '투수가 타자를 고의로 걸러 4구를 주는 전략적 선택. 감독의 지시와 심판 승인 절차에 따라 이루어진다.', 86)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-88', '투수', '삼진 비율', '투수의 탈삼진 능력을 나타내는 지표(삼진 ÷ 이닝 등). 구위의 척도로 사용된다.', 87)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-89', '투수', '피안타율', '투수가 허용한 안타 비율. 수비 영향과 함께 해석해야 한다.', 88)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-90', '투수', '리커버리', '투수가 다음 투구에서 이전 투구의 영향을 회복하는 능력. 체력과 멘탈에 좌우된다.', 89)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-91', '수비', '실책', '평범한 수비 플레이에서 수비 실수로 인해 주자가 진루하거나 아웃을 만들지 못한 경우 기록되는 항목.', 90)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-92', '수비', '삼자범퇴', '한 이닝에 세 명의 타자를 모두 아웃시키는 수비 성과. 완벽한 수비 이닝을 의미한다.', 91)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-93', '수비', '벤치 클리어링', '경기 중 양 팀 선수와 코칭스태프가 모두 그라운드로 나와 충돌하는 상황. 주로 감정이 격해질 때 발생. 벤치가 비워진다는 의미에서 벤치 클리어링이라고 한다.', 92)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-94', '수비', '더블플레이', '한 번의 수비로 두 명의 주자를 아웃시키는 플레이. 수비 배치와 송구의 정확성이 핵심.', 93)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-95', '수비', '포구', '수비수가 공을 잡는 동작. 안정적인 포구는 수비 성공률을 좌우한다.', 94)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-96', '수비', '수비 시프트', '타자 성향에 따라 수비 포지션을 조정하는 전술적 배치. 데이터 기반으로 활용된다.', 95)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-97', '수비', '송구', '수비수가 공을 다른 수비수나 베이스로 던져 아웃을 만드는 행위. 속도와 정확도가 중요.', 96)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-98', '수비', '시프트', '타자 성향에 따라 수비 포지션을 조정하는 전술적 배치. 데이터 기반으로 활용된다.', 97)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-99', '수비', '다이빙 캐치', '수비수가 몸을 던져 공을 잡는 고난도 수비 동작. 팀의 실점 방지에 기여한다.', 98)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-100', '수비', '더그아웃', '팀 선수와 코칭스태프가 경기 중 대기하는 장소. 벤치와 장비 보관함을 비롯한 부가 시설을 아울러 표현한다. 코칭스태프도 경기 내내 여기에 모여 있기 때문에 벤치와 더불어 감독이나 코치의 대명사처럼 쓰이기도 한다. 1루 쪽과 3루 쪽 파울 영역 바깥에 하나씩 있다.', 99)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-101', '수비', '중계 플레이', '외야에서 포수나 내야로 공을 보낼 때 중간 수비수가 공을 받아 이어주는 송구 루틴.', 100)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-102', '수비', '고의낙구', '수비수가 공을 일부러 땅에 떨어뜨려 타자를 아웃시키는 플레이. 주로 1루수나 유격수가 수행.', 101)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-103', '수비', '수비 범위', '선수가 커버할 수 있는 타구 영역의 넓이. 범위가 넓을수록 더 많은 타구를 처리할 수 있다.', 102)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-104', '수비', '포일', '포수가 투구를 제대로 잡지 못해 주자가 진루하는 상황. 주로 도루 시도에서 발생한다.', 103)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-105', '수비', '워닝 트랙', '외야 펜스 앞에 설치된 잔디나 모래로 된 구역. 타구가 이 구역에 떨어지면 홈런이 아닌 플라이로 간주된다.', 104)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-106', '수비', '런다운', '주자가 베이스 사이에서 포수나 내야수에게 잡히지 않도록 도망치는 상황. 수비수 간의 협력이 중요.', 105)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-107', '수비', '포수 블로킹', '포수가 홈 앞에서 공을 몸으로 막아 주자의 득점을 저지하는 기술. 타이밍과 자세가 중요.', 106)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-108', '수비', '어시스트', '수비수가 공을 던져 아웃을 만든 경우 기록되는 도움 기록. 송구 정확도와 판단 능력이 반영된다.', 107)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-109', '수비', '배터리', '투수와 포수의 조합을 가리키는 용어. 팀의 수비 안정성과 경기 운영에 핵심 역할이다.', 108)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-110', '수비', '에러', '수비 실책으로 인해 주자의 진행이나 아웃 기대치가 무산된 경우의 공식 기록.', 109)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-111', '수비', '포지션', '각 수비 위치(1루·2루·3루·유격수·좌익·중견·우익·포수·투수)를 가리키는 용어.', 110)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-112', '수비', '인필더', '내야 수비수들을 통칭. 빠른 반응과 정확한 송구가 요구된다.', 111)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-113', '수비', '아웃필더', '외야 수비수를 가리키는 말. 장타 방어와 중계 송구 능력이 중요.', 112)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-114', '수비', '포수 채비', '포수가 사용하는 미트·패드·마스크 등 장비와 착용 방식. 보호와 기동성을 고려해 선택한다.', 113)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-115', '수비', '태그 플레이', '주자가 베이스를 벗어났을 때 수비수가 직접 터치해 아웃을 만드는 플레이.', 114)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-116', '수비', '베이스 커버', '특정 상황에서 수비수가 베이스를 지키기 위해 위치를 잡는 행위. 상황 판단이 중요하다.', 115)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-117', '수비', '폰트 태그', '주자 접촉 없이 베이스를 밟아 주자를 아웃시키려는 시도. 규정과 판정이 엄격히 적용된다.', 116)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-118', '수비', '오버슬라이드', '주자가 베이스를 지나쳐 미끄러져 복귀하는 과정에서 발생하는 리스크와 수비 대응.', 117)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-119', '수비', '대수비', '경기 후반에 수비 강화를 위해 교체 투입되는 수비 전문 선수.', 118)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-120', '수비', '삼중살', '한 타자의 타석에서 3개의 아웃 카운트가 한 번에 잡히는 경우. 매우 드문 수비 기록.', 119)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-121', '수비', '호수비', '중요한 순간에 나온 뛰어난 수비 플레이를 일컫는 비공식 용어.', 120)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-122', '수비', '브레이크 포인트', '주자가 베이스로 복귀하거나 진루를 결정하는 시점. 수비 판단의 핵심 타이밍.', 121)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-123', '수비', '커버리지', '수비수 간의 영역 분담과 상호보완성. 조직적 수비의 핵심 요소.', 122)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-124', '수비', '송구 모션', '정확하고 빠른 송구를 위한 동작의 일련. 기초 훈련의 중요 항목.', 123)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-125', '수비', '프레이밍', '포수가 투구를 받으면서 스트라이크존에 공을 잘 보이게 하는 기술. 심판 판정에 영향. 캐처 프레이밍이라고도 한다.', 124)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-126', '수비', '수비 리더십', '내·외야에서 수비수들이 경기 전반을 지휘하는 능력. 소통과 위치 지시가 포함된다.', 125)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-127', '수비', '내야 뜬공', '내야에서 뜬공으로 처리되는 타구. 수비수의 판단과 위치 선정이 중요하다.', 126)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-128', '수비', '포지션 스페셜리스트', '특정 포지션에서 탁월한 수비 능력을 보이는 선수. 예: 골든글러브 후보군.', 127)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-129', '수비', '시야 확보', '수비 시 타구·주자·다른 수비수의 위치를 빠르게 파악하는 능력.', 128)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-130', '수비', '수비 전환', '수비 배치를 순간적으로 바꿔 특정 타구에 대비하는 전술적 움직임.', 129)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-131', '수비', '릴레이', '수비가 중계 플레이에서 공을 이어주는 과정의 명칭. 연결이 끊기면 실점으로 이어질 수 있다.', 130)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-132', '기록', 'WAR', '대체 선수 대비 승리 기여도. 공격·수비·주루 등을 종합해 선수를 평가하는 지표.', 131)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-133', '기록', 'wRC+', '리그 평균(100)에 보정된 득점 창출력. 구장·리그 효과를 보정해 타자 비교를 용이하게 함.', 132)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-134', '기록', 'FIP', 'Fielding Independent Pitching(수비 무관 투구)의 약자로, 로스 맥크라켄이라는 사람이 만든 투수 평가를 위한 세이버메트릭스 기록의 하나다. 삼진, 사사구, 홈런만을 통해 투수의 기록을 재구성한 것이다. 수비 영향에서 독립된 투수 성적 지표.', 133)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-135', '기록', '득점', '안타나 볼넷 등으로 출루하였거나 루상에 교체된 주자가 본루를 밟음으로써 기록되는 공격측의 점수. 출루한 주자가 대주자로 교체된 후 대주자가 홈을 밟은 경우 대주자의 득점으로 본다. 다만 스리아웃이 되는 과정을 이용해서 홈을 밟은 경우, 그리고 제 3아웃이, 타자가 1루에 도달하기 이전의 아웃이거나 포스아웃일 때는 아웃이 성립되기 이 전에 홈을 밟아도 득점이 인정되지 않는다.', 134)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-136', '기록', 'WPA', 'Win Probability Added(승리 확률 기여도)의 약자로, 두 상황 간의 기대 승률(Win Expectancy, WE) 차이를 나타낸다. 여기서 말하는 상황은 주자 상황, 아웃 개수, 이닝, 점수차의 조합으로 정의되며, 기대 승률은 그렇게 정의된 각각의 상황에서 출발했을 때 최종적으로 팀이 승리할 확률을 의미한다.', 135)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-137', '기록', 'BABIP', '야구의 스탯 중 하나로 인플레이 타구의 (피)안타율을 계산한 값이다. 즉, 타자가 방망이로 공을 맞혀 인플레이 상황이 되었을 때 이것이 안타가 될 확률을 말한다. BABIP는 타자와 투수 모두에게 중요한 지표로, 타자의 운과 투수의 운을 어느 정도 반영한다.', 136)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-138', '기록', 'ISO', '순수 장타력(장타율 - 타율). 장타 생산 능력을 분리해 보여줌.', 137)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-139', '기록', 'K/BB', '삼진 대비 볼넷 비율. 제구와 탈삼진 능력의 균형을 보여준다.', 138)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-140', '기록', '타수 (AB)', '타격 기회 중 공식적으로 타수로 집계되는 횟수. 희생번트·사구 등은 제외된다.', 139)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-141', '기록', '안타 (H)', '선수가 기록한 안타 수. 1·2·3루타·홈런으로 분류돼 기록된다.', 140)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-142', '기록', '100-100 클럽', '한 시즌에 100타점과 100득점을 동시에 기록한 타자 그룹. 뛰어난 공격력을 상징하는 기록.', 141)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-143', '기록', '30-30 클럽', '한 시즌에 30홈런과 30도루를 동시에 기록한 타자 그룹. 파워와 스피드를 겸비한 선수에게 주어지는 명예.', 142)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-144', '기록', '40-40 클럽', '한 시즌에 40홈런과 40도루를 동시에 기록한 타자 그룹. 극히 드문 기록으로, 최고의 파워와 스피드를 가진 선수에게 주어지는 명예.', 143)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-145', '기록', '20-20 클럽', '한 시즌에 20홈런과 20도루를 동시에 기록한 타자 그룹. 뛰어난 파워와 스피드를 겸비한 선수에게 주어지는 명예.', 144)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-146', '기록', '50-50 클럽', '한 시즌에 50홈런과 50도루를 동시에 기록한 타자 그룹. 극히 드문 기록으로, 최고의 파워와 스피드를 가진 선수에게 주어지는 명예. 2024년 오타니 쇼헤이가 54홈런 59도루를 달성하며 가입했다.', 145)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-147', '기록', '득점 (R)', '선수가 홈을 밟아 팀 득점으로 기록된 횟수. 팀 승리에 직접 연결되는 주요 지표.', 146)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-148', '기록', '타점 (RBI)', '타자가 상대팀의 실점을 유발한 횟수. 득점권 상황에서의 기여도를 반영한다.', 147)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-149', '기록', '도루 (SB)', '선수가 성공적으로 베이스를 도루한 횟수. 도루 시도·성공률·포수 송구 능력이 연관.', 148)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-150', '기록', '도루실패 (CS)', '도루 시도 중 포수에 의해 태그 아웃된 경우. 주루 리스크의 지표.', 149)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-151', '기록', '출루 (OBP)', '출루율과 동일한 개념으로 타자의 출루 능력을 나타냄.', 150)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-152', '기록', '장타 (SLG)', '장타율로 안타의 질을 수치화한 기록.', 151)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-153', '기록', '멀티 히트', '한 경기에서 2개 이상의 안타를 기록한 횟수. 빈번한 멀티 히트는 안정적 타격의 표시.', 152)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-154', '기록', '연속 경기 출장', '선수가 결장 없이 연속 출전한 경기 수. 선수의 내구성을 보여주는 기록.', 153)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-155', '기록', '잔루', '이닝 종료 시 루상에 남아있는 주자 수. 공격 효율성의 보조 지표로 활용된다.', 154)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-156', '기록', '연속 안타', '연속 경기에서 안타를 기록한 횟수. 연속성은 타격 컨디션의 지표.', 155)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-157', '기록', '퀄리티 스타트 (QS)', '선발투수가 6이닝 이상 3자책점 이하로 마친 경기. 선발의 안정성을 평가하는 기준.', 156)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-158', '기록', '승 (W)', '투수에게 부여되는 승리 기록. 승리 부여 기준은 경기 상황에 따라 복잡한 규정이 있다.', 157)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-159', '기록', '패 (L)', '투수에게 부여되는 패전 기록.', 158)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-160', '기록', '세이브 (SV)', '마무리 투수의 세이브 기록. 상황 조건 충족 시 부여된다.', 159)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-161', '기록', '골든글러브', '각 연도의 수비, 공격, 인기도를 종합한 수상자를 투표인단이 선정한다. 포지션별로 한 명씩 선정되며, 수비 능력뿐만 아니라 타격 성적과 팀 기여도, 인기도 등이 반영된다.', 160)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-162', '기록', '홀드 (HLD)', '중계 투수의 홀드 기록. 리드 유지 기여도를 반영.', 161)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-163', '기록', '완투 (CG)', '선발의 완투 기록. 드물지만 가치 있는 기록.', 162)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-164', '기록', '완봉 (SHO)', '완투 중 실점이 전혀 없는 경우.', 163)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-165', '기록', '피홈런', '투수가 허용한 홈런 수. 경기 흐름에 직접적 영향을 주는 항목.', 164)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-166', '기록', '삼진 (K)', '타자가 삼진으로 아웃된 횟수 또는 투수가 탈삼진으로 잡은 횟수.', 165)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-167', '기록', '볼넷 (BB)', '투수가 허용한 볼넷 수. 제구 문제의 지표가 된다.', 166)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-168', '기록', 'LOB (Left On Base)', '이닝 종료 시 남겨진 주자 수. 공격의 득점 효율성을 판단하는 보조 지표.', 167)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-169', '규칙', 'FA', '자유 계약 선수 제도. 일정 기간 후 구단과 계약 없이 다른 팀과 자유롭게 계약할 수 있는 권리.', 168)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-170', '규칙', '어필 플레이', '수비 측이 주자의 아웃을 주장하기 위해 심판에게 요청하는 절차. 주자가 베이스를 밟지 않았거나 주루방해 등이 해당된다.', 169)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-171', '규칙', '야수선택', '타자가 안타를 기록하지 못했지만 수비 실책으로 인해 주자가 진루한 경우. 타자의 타율에는 포함되지 않는다.', 170)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-172', '규칙', '오버런', '베이스를 밟고 지나쳐서 베이스와 몸이 떨어진 상태를 가리키는 용어. 이 상태에서 태그 당하면 아웃이다. 단 1루에서는 베이스를 밟고 지나친 후 몸이 떨어져도 아웃되지 않는다. 단, 1루를 밟고 2루로 진루하려는 의지가 없어야 한다는 전제조건이 붙는다.', 171)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-173', '규칙', '서스펜디드 게임', '기상 악화 등으로 인해 경기 도중 중단된 후 나중에 재개되는 경기. 중단 시점부터 이어서 진행된다.', 172)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-174', '규칙', '3피트 라인', '주루 중 주자가 수비의 정상적 송구 경로를 방해하지 않도록 허용된 가상의 통로 규정. 침범 시 주루방해 또는 수비방해 판정이 나올 수 있다.', 173)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-175', '규칙', '인필드 플라이', '특정 상황(무사 또는 1사, 1·2루에 주자)에서 내야 플라이가 병살 유도가 가능한 경우 타자가 자동 아웃되는 규정.', 174)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-176', '규칙', '웨이버 공시', '구단이 선수를 다른 구단에 양도하거나 방출할 때 공시하는 절차. 다른 구단이 해당 선수를 영입할 수 있는 기회를 제공한다.', 175)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-177', '규칙', '낫아웃', '포수가 삼진 후 공을 놓쳐 타자가 1루로 진루할 수 있는 상황. 루 상황과 아웃수에 따라 적용 여부가 달라진다.', 176)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-178', '규칙', '보크', '투수의 불법 동작으로 주자를 기만하거나 규정을 위반한 경우 선언되는 반칙. 보크 시 주자 진루가 부여된다.', 177)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-179', '규칙', '비디오 판독', '심판 판정에 이의가 있을 때 방송·리그 카메라로 판정을 재검토하는 제도. 판독 가능한 항목과 신청 기한이 규정되어 있다.', 178)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-180', '규칙', '포스 아웃', '주자가 다음 베이스로 진루해야 하는 상황에서 수비수가 해당 베이스를 밟아 아웃시키는 플레이.', 179)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-181', '규칙', '누의 공과', '밟아야 할 베이스를 밟지 않고 지나치는 것을 의미하며, 정확한 발생 요건은 주자가 진루 중 순서대로 밟아야 할 루(베이스)를 밟지 않고 진루하여 수비측이 이를 어필한 경우다. 이때 중요한 것은 수비 측에서 어필을 해야만 적용된다는 것이다.', 180)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-182', '규칙', '타임아웃', '심판 또는 감독이 경기 진행을 일시 중단하는 선언. 장비 점검·선수 치료 등 목적이 있다.', 181)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-183', '규칙', '플레이볼/타임 선언', '심판이 경기 재개나 중단을 공식적으로 알리는 신호. 모든 선수는 심판 신호를 준수해야 한다.', 182)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-184', '규칙', '페어/파울', '타구가 페어 지역인지 파울인지 판단하는 규정. 라인·펜스·관중 간섭 등이 판정 요소로 작용한다.', 183)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-185', '규칙', '데드볼', '경기가 즉시 중단되어야 하는 상태. 예: 타자 사구, 경기 외적 요인 등. 이후 처리 규정이 따로 정해진다.', 184)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-186', '규칙', '퇴장', '심판이 선수·코치·구단 관계자에게 경기장에서 떠나도록 명령하는 조치. 과도한 항의나 폭력 행위 등이 원인.', 185)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-187', '규칙', '주루방해', '주자가 수비의 정상적 플레이를 방해하는 행위. 인정 시 진루 이익이 취소되거나 아웃이 선언될 수 있다.', 186)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-188', '규칙', '수비방해', '주자나 관중이 수비자의 공 처리를 방해한 경우의 규정. 판정에 따라 주자의 위치가 조정된다.', 187)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-189', '규칙', '교체 규정', '대타·대주자·교체 관련 절차와 제한. 교체된 선수의 재출장 금지 등 세부 규정이 존재한다.', 188)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-190', '규칙', '공인구 규정', '경기에서 사용하는 공의 규격·재질·교체 기준 등을 정한 규정. 공의 상태는 경기 양상에 영향.', 189)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-191', '규칙', '피치 클락', '투구 시간 제한 장치. 투수가 일정 시간 내에 투구하지 않으면 볼이 선언된다. KBO에서는 주자가 없을 시 20초, 주자가 있을 시 25초 이내에 투구해야 한다.', 190)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-192', '규칙', '헤더 규정', '같은 날 두 경기를 연속으로 치를 때 적용되는 운영·선수 관리 규정.', 191)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-193', '규칙', '승부치기 규정', '연장전 시간 절약을 위해 특정 이닝부터 주자를 배치하는 등 승부를 빠르게 결정하는 규정.', 192)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-194', '규칙', '노게임/콜드게임', '기상 등으로 경기 성립 요건을 충족하지 못하면 경기 무효(노게임) 또는 조기 종료(콜드게임)가 선언된다.', 193)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-195', '규칙', '심판 구성', '경기에 투입되는 심판 수와 역할(주심·1·2·3루심 등)에 관한 규정.', 194)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-196', '규칙', '판정 신청 기한', '구단이 비디오 판독을 신청할 수 있는 시간 제한 및 절차. 기한을 넘기면 신청 불가.', 195)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-197', '규칙', '포수 보호 규정', '포수의 안전을 위한 장비·위치 규정. 위험한 접촉을 방지하기 위한 조치가 포함된다.', 196)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-198', '규칙', '주자 충돌 방지 규정', '주자와 수비수의 불필요한 충돌을 막기 위한 규정. 접촉 시 심판은 경기 중단 후 판정한다.', 197)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-199', '규칙', '리터치 규정', '플라이 아웃 등에서 주자가 베이스를 떠난 후 원래 베이스로 돌아가야 하는 규정.', 198)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-200', '규칙', '경기 재개 규정', '일시 중단된 경기를 언제, 어떻게 재개할지에 관한 규정. 선수 등록·교체 적용 여부도 명시된다.', 199)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-201', '규칙', '심판 항의 절차', '감독·선수의 심판 판정 항의 시 따라야 할 절차와 제재 기준.', 200)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-202', '규칙', '벤치클리어링 규제', '충돌이나 집단 대치 발생 시 벤치클리어링에 대한 규제와 제재 지침.', 201)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-203', '규칙', '경기 몰수 규정', '심각한 규정 위반·폭력 사태 등으로 경기를 몰수 처리하는 경우 적용되는 규정. 몰수 시점의 점수 처리와 제재 내용이 규정되어 있으며, 중대한 규정 위반에 대한 최후의 수단이다.', 202)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-204', '규칙', '경기 취소 규정', '기상·재난 등 불가항력으로 경기를 취소할 때의 기준과 절차. 취소 시 보상·재편성·티켓 처리 등 운영적 후속 조치가 함께 규정된다.', 203)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.dictionary_terms
  (source_key, category, term, description, sort_order)
values ('dictionary-205', '규칙', '경기 연장 규정', '정규 이닝 종료 후 동점일 때 연장전을 실시하는 규정. 연장 방식(무제한 이닝, 승부치기 등)은 리그마다 다르며, 연장 규정은 선수 교체·기록 처리에도 영향을 준다.', 204)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  description = excluded.description,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-1', '규정/제도', '정규시즌 경기수', '각 구단 144경기 단일리그', 'KBO 정규시즌은 단일 리그로 구성되어 각 구단이 144경기(구단 간 16차전씩)를 치른다. 총 720경기가 시즌 동안 진행되며, 일정 편성은 방송 편성, 구장 대관, 우천 취소분 재편성 등 다양한 제약을 고려해 설계된다. 이 구조는 팀 간 전력 차이를 장기적으로 검증하는 데 유리하고, 포스트시즌 진출권 경쟁을 시즌 내내 촘촘하게 만든다.', '', '', 0)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-2', '규정/제도', '연장전 제한', '정규시즌 11회까지, 무승부 가능', '2025년 기준 정규시즌 연장전은 11회까지 운영된다. 11회까지 승부를 가리지 못하면 해당 경기는 무승부로 기록되며, 이는 투·타소모를 줄이고 장기전으로 인한 다음 경기 컨디션 저하를 방지하기 위한 장치다. 포스트시즌에서는 별도의 연장 이닝(최대 15회)이 적용되어 승부가 날 때까지 더 길게 치러질 수 있다.', '', '', 1)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-3', '규정/제도', '승률 계산법', '승률=승수/(승수+패수)', 'KBO 승률은 무승부를 분모에서 제외하고, 승수를 승수와 패수의 합으로 나누어 계산한다. 무승부가 많은 시즌일수록 같은 승수라도 승률이 높아질 수 있어, 팀들은 승리뿐 아니라 ‘패하지 않는 경기 운영’도 전략적으로 고민한다.', '', '', 2)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-4', '규정/제도', '연도 순위 산정', '한국시리즈 우승이 1위', '해당 연도의 공식 순위는 한국시리즈 우승 팀이 1위, 준우승 팀이 2위이며, 나머지는 정규시즌 승률순으로 정한다. 즉, 정규시즌 1위라도 한국시리즈에서 우승하지 못하면 최종 1위를 차지하지 못한다. 포스트시즌의 상징성과 무게감을 보여주는 규정이다.', '', '', 3)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-5', '규정/제도', '동률 순위 결정', '맞대결→다득점→전년도 성적', '정규시즌 2~4위에 동률 팀이 나타나면 해당 팀들 간 맞대결 전적 다승, 이어서 맞대결 다득점, 그리고 전년도 성적 순으로 순위를 가른다. 1위 혹은 5위가 두 팀이 동률이면 별도의 단판 결정전을 열어 순위를 확정하며, 세 팀 이상이면 맞대결 지표로만 정한다.', '', '', 4)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-6', '규정/제도', '노게임과 정식경기', '5이닝 전 중단은 노게임', '비, 강풍 등으로 경기를 마치지 못할 때 5회(홈팀 리드 시 4회말) 이전이면 노게임으로 처리되어 기록과 승패가 무효가 된다. 5회가 경과하면 정식경기로 인정되고, 그때의 상황을 바탕으로 공식 결과가 확정된다. 이는 기록의 공정성을 보장하기 위한 보편적 기준이다.', '', '', 5)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-7', '규정/제도', '더블헤더 운영', '재편성 시 1경기 9이닝', '우천 취소 경기 등을 재편성할 때 더블헤더가 편성될 수 있으며, 제1경기는 9이닝 경기로 치르는 것이 원칙이다. 하루 두 경기 진행은 선수 피로와 투수 운용 부담이 크기 때문에, 구단은 불펜 로테이션과 타선 운용을 정교하게 계획해야 한다.', '', '', 6)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-8', '규정/제도', '경기시간 제한(무조명 구장)', '일몰 15분 전 새 이닝 진입 불가', '야간 조명이 없는 구장에서는 일몰 15분 전 이후 새 이닝에 들어갈 수 없다. 경기 도중 암흑으로 9회까지 진행이 불가능하면 서스펜디드(중단 후 재개) 경기로 처리한다. 이는 안전과 경기 품질을 위한 장치다.', '', '', 7)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-9', '규정/제도', '경기개시 시간', '월별/요일별 기본 시간대', 'KBO는 월별·요일별로 권장 개시 시간을 제공하며, 일부 금요일은 마케팅 활성화를 이유로 19:00로 조정 가능하다. 어린이날, 개막전 이틀 등 특정 경기는 14:00 시작처럼 별도의 특례가 적용되어 팬 경험과 흥행을 고려한다.', '', '', 8)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-10', '규정/제도', '지상파 중계에 따른 시간 변경', '월 2회 의무 승인', '지상파 중계 사유로 경기 시작 시간이 변경될 경우, 홈구단은 KBO에 통보하고 리그는 월 2회의 요청을 반드시 승인해야 한다. 방송 노출 극대화와 리그 흥행이라는 공익을 반영한 규정으로, 구단 운영과 편성의 균형을 맞춘다.', '', '', 9)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-11', '규정/제도', '벤치 인원 한도', '감독1·코치10·선수28 등', '경기 중 벤치 입장 가능 인원은 감독 1명, 코치 10명(불펜·전력분석·QC 포함), 현역선수 28명(9월 이후 33명, 출장 26→31), 매니저·트레이너·기록원·홍보·통역 등을 포함한다. 이는 경기 운영의 효율과 공정성을 위해 역할별 상한을 명확히 둔 것이다.', '', '', 10)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-12', '규정/제도', '현역선수 등록 마감', '경기 2시간 전까지', '현역선수 등록/말소는 경기 시작 2시간 전까지 가능하며, 우천 취소와 무관하게 동일한 마감이 적용된다. 경기가 없는 날에도 특정 시각까지 접수가 가능하도록 규정되어 로스터 운용의 예측 가능성을 높인다.', '', '', 11)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-13', '규정/제도', '9월 로스터 확대', '현역 33명·출장 31명', '9월 1일 이후에는 현역선수 등록 상한이 33명, 당일 출장 가능 인원은 31명으로 확대된다. 장기 레이스 후반에 선수 소모를 줄이고, 유망주의 경험 기회를 넓히는 취지로 적용된다.', '', '', 12)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-14', '규정/제도', '은퇴경기 특별 등록', '정원 초과 예외 허용', '은퇴경기 당일에는 해당 선수를 정원 초과로 특별 등록할 수 있으며, 다음 날 자동 말소된다. 경기가 정상 개최되지 않으면 재등록 예외가 허용되지만, 은퇴 후 시즌 종료 시까지 일반 등록은 불가하다. 선수의 커리어를 기리는 예우 조치다.', '', '', 13)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-15', '규정/제도', '부상자 명단(IL) 선택', '10·15·30일 등재', '정규시즌 경기 또는 훈련 중 부상 시 10일, 15일, 30일 중 선택해 등재 가능하며 시즌 누적 최대 30일까지 쓸 수 있다(예: 10일×3, 15일×2, 30일×1). 말소 후 3일 내 신청과 진단서 제출이 원칙이며, 유예 규정으로 소급 등재가 가능해 실무 탄력성이 보장된다.', '', '', 14)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-16', '규정/제도', 'IL 연장 신청', '동일 부상 1회 무진단 연장', '동일 부상 사유로 1회에 한해 추가 진단서 없이 연장 신청이 가능하다. 다만 기존 진단서의 치료 기간을 초과해 연장하려면 신규 진단서를 제출해야 한다.', '', '', 15)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-17', '규정/제도', '치료·재활선수 명단', '현역 등록일수 미인정', '부상자 명단과 별개로 치료·재활선수 명단이 운영되며 최소 10일 등재가 원칙이다. 현역 등록일수로 인정되지 않지만, 등재 기간 종료 또는 10일 경과 후 엔트리에 복귀하면 자동 말소된다.', '', '', 16)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-18', '규정/제도', '타순표 제출', '경기 1시간 전 주심에게', '감독 또는 대리인은 매 경기 참가 스태프·현역선수 명단과 타순표를 경기 시작 1시간 전(더블헤더 2경기는 1경기 종료 10분 후) 주심에게 제출한다. 교환 후에는 원칙적으로 철회나 변경이 불가하며, 불가피한 부상 등 제한적 사유만 예외가 인정된다.', '', '', 17)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-19', '규정/제도', '선발투수 예고', '전일 통보, 불출장 시 당일 금지', '이동일에는 낮 12시까지, 연전의 경우 경기 종료 직후 선발투수를 통보한다. 예고된 투수가 당일 불출장하면 그 선수는 해당 경기 출장 금지로 간주되어 로스터 운용에 신중함이 요구된다.', '', '', 18)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-20', '규정/제도', '부상 교체 특례', '선발·구원 투수 첫 타자 전 교체', '선발 또는 구원 투수가 명백한 부상으로 첫 타자(또는 대타자)와의 승부를 마치기 전에 투구가 어렵게 되면 교체가 허용된다. 이때 교체된 선수는 당일 재출장이 금지된다. 선수 보호와 경기 공정성을 동시에 고려한 규정이다.', '', '', 19)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-21', '규정/제도', '베이스코치 제한', '코치 겸 선수는 베이스코치 불가', '코치 겸 선수, 또는 선수로만 등록된 자는 1루·3루 베이스코치 임무를 수행할 수 없다. 코칭 역할의 전문성과 판정 혼선을 막기 위한 안전장치다.', '', '', 20)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-22', '규정/제도', '벤치 내 전자기기 제한', '무전기·휴대전화·노트북 금지', '경기 시작 후 벤치 및 그라운드에서 감독·코치·선수·구단 관계자의 무전기, 휴대전화, 노트북 등 전자기기 사용은 금지된다. 다만 퓨처스리그의 교육 목적 범위 내 데이터 확인, 수비 참고 페이퍼·리스트밴드(규격 제한) 등은 조건부 허용된다.', '', '', 21)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-23', '규정/제도', '사인 훔치기 금지', '외부 장비 촬영·전달 금지', '경기장 밖에서 망원·특수 카메라 등으로 배터리 사인을 촬영하거나 외부 신호를 덕아웃으로 전달하는 행위는 금지된다. 위반 시 즉시 퇴장 및 추가 제재가 가능해, 정보 비대칭을 통한 부정 이득을 차단한다.', '', '', 22)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-24', '규정/제도', '벤치 구성 투명성', '주심의 현역 등록 확인', '주심은 제출된 타순표의 선수들이 현역 등록 상태인지 확인해야 한다. 이는 무자격 선수의 출장을 원천 방지하고, 경기의 공정한 출발을 보장한다.', '', '', 23)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-25', '규정/제도', '통역 인원 한도', '최대 3명(+사전신청 2명)', '벤치에 들어갈 수 있는 통역은 기본 3명이며, 필요 시 사전 신청으로 최대 2명 추가가 가능하다. 다국적 선수 구성이 늘면서 커뮤니케이션 효율을 높이는 현실적 보완 장치다.', '', '', 24)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-26', '규정/제도', '현역 말소 10일 규정', '재등록 제한, 예외 존재', '현역 등록이 말소된 선수는 원칙적으로 말소 공시일부터 10일이 경과해야 재등록할 수 있다. 경조휴가, 타 구단 양도 등 예외 규정이 있어, 인력 운용의 경직성을 완화한다.', '', '', 25)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-27', '규정/제도', '경조 휴가', '최대 5일·현역일수 인정', '선수 본인과 배우자의 직계 가족 사망, 자녀 출생 등 사유로 최대 5일 경조 휴가를 신청할 수 있다. 이 기간은 현역 등록일수로 인정되며, 휴가 부여일로부터 10일 경과 전에도 재등록이 가능해 인본주의적 운영을 반영한다.', '', '', 26)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-28', '비디오 판독', '판독 대상 경기', '중계가 있는 경기만', '비디오 판독은 중계 영상과 리그 카메라 영상 기반으로 진행되며, 중계가 없거나 화면 확보가 불가능하면 실시하지 않는다. 방송이 없는 경기에서의 오심 가능성을 낮추기 위해 구단은 자체 촬영을 병행하기도 하지만, 공식 판독은 방송·리그 소스에 한정된다.', '', '', 27)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-29', '비디오 판독', '판독센터 운영', '센터장 포함 최대 3인', '판독은 전담 판독센터에서 이루어지고, 판독센터장이 책임을 진다. 센터장 포함 최대 3인이 참여하며, 동시 다발적 판독 발생 시 단독 판독으로 처리할 수 있어 신속성과 정확성을 균형 있게 추구한다.', '', '', 28)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-30', '비디오 판독', '홈런 판정', '언제든 신청 가능', '홈런/파울폴 맞음/팬 간섭 여부 등 홈런 관련 판정은 감독에게 주어진 일반 기회와 무관하게 언제든 판독을 요청할 수 있다. 득점 가치가 큰 플레이인 만큼 별도 트랙으로 빠르게 진실에 접근하도록 보장한 조항이다.', '', '', 29)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-31', '비디오 판독', '페어/파울·타자/배트 접촉', '타석 안팎의 접촉 포함', '내·외야 타구의 페어/파울뿐 아니라, 타석 안팎에서 타자나 배트, 착용 용구에 공이 맞았는지 여부도 판독 대상이다. 이는 파울 팁과 몸 맞는 볼, 배트 파울의 경계가 애매할 때 명확한 결론을 내리는 데 필수다.', '', '', 30)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-32', '비디오 판독', '아웃/세이프', '포스·태그 플레이 전반', '포스 플레이나 태그 플레이에서의 아웃/세이프는 대표적인 판독 대상이다. 야수의 베이스 차단으로 인한 주루방해 판단도 포함되어, 홈 플레이트 충돌 등 안전 관련 이슈와 직결된다.', '', '', 31)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-33', '비디오 판독', '포구 판정', '파울팁 포함 포구 여부', '야수의 포구(파울팁 포함) 여부도 판독할 수 있다. 글러브에 닿았으나 지면 접촉 전 완전한 지배가 있었는지, 혹은 트랩(바운드 후 포구)인지가 승부를 가르는 사례가 많다.', '', '', 32)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-34', '비디오 판독', '몸에 맞는 공(HBP)', '스윙·회피 시도는 제외', '타자에게 공이 맞았는지는 판독할 수 있지만, 스윙했는지, 스트라이크 존을 통과했는지, 회피 시도를 했는지 여부는 판독 대상이 아니다. 따라서 HBP 여부와 관련 규정 적용은 영상+현장 판단이 조합되어야 한다.', '', '', 33)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-35', '비디오 판독', '헛스윙/파울', '타자·배트 접촉 여부 포함', '타자의 헛스윙 또는 파울 여부에 대해, 타자나 배트·착용 용구에 공이 닿았는지 판단하는 것도 판독 가능하다. 배트 끝에 스친 파울팁과 미세 접촉을 가르는 데 슬로모션과 확대 영상이 큰 역할을 한다.', '', '', 34)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-36', '비디오 판독', '태그업 타이밍', '일찍 이탈 여부', '주자가 다음 베이스로 진루하기 위해 태그업할 때, 수비가 포구하기 전에 이탈했는지 여부를 판독할 수 있다. 외야 깊은 플라이에서 득점이 걸린 장면이라면 결과가 즉시 스코어에 반영된다.', '', '', 35)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-37', '비디오 판독', '누의 공과', '베이스 정확히 밟았는지', '주자나 타자주자가 베이스를 정확히 밟았는지(누의 공과)는 판독 가능하다. 도루·슬라이딩 과정의 미세한 이탈까지 잡아내며, 고해상도 슬로모션이 ‘가시의 영역’을 날카롭게 드러낸다.', '', '', 36)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-38', '비디오 판독', '선행주자 추월', '주자 간 추월 여부', '주자가 선행주자를 추월했는지는 판독 대상이다. 복잡한 런다운이나 파워런 상황에서 드물게 발생하지만, 발생 시 즉각적인 아웃 선언과 주자 배치 변경으로 이어진다.', '', '', 37)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-39', '비디오 판독', '수비 시프트 위반 판정', '내야수 배치 제한 준수 여부', '수비 시프트 제한 위반 여부 판독도 판독 대상이다. 공격팀은 공을 최초로 접촉한 내야수의 위반만, 수비팀은 심판의 위반 선언에 대해 판독 요청할 수 있어 절차가 대칭적으로 설계되어 있다.', '', '', 38)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-40', '비디오 판독', '감독의 신청 기한', '일반 30초, 종료·3아웃은 10초', '감독은 심판 최초 판정 후 통상 30초 이내에 구두로 신청해야 하며, 이닝 종료 아웃이나 경기 종료 아웃에 대해서는 10초 이내에 신청해야 한다. 시간을 넘기면 심판 재량으로 거부될 수 있어 벤치 커뮤니케이션과 즉시 판단이 중요하다.', '', '', 39)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-41', '비디오 판독', '판독 기회 수', '정규이닝 2회, 번복 2회면 1회 추가', '정규이닝 기준 구단당 2회의 판독 요청 기회가 주어지며, 두 번 모두 판정이 번복되면 1회의 추가 기회가 부여된다. 연장전에는 별도로 1회의 기회가 추가되어, 클러치 상황에서의 정확도를 높인다.', '', '', 40)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-42', '비디오 판독', '동일 상황 다중 판독', '최대 2개까지 동시 요청', '한 상황에서 두 가지 이상의 논란이 있을 때 감독은 최대 두 개의 판정을 동시에 요청할 수 있다. 이 경우 각각의 요청이 독립적으로 기회를 소모하며, 선후 판정 결과에 따라 뒤 요청이 무의미해질 수 있다.', '', '', 41)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-43', '비디오 판독', '선수교체 제한', '판독 중에는 교체 불가', '비디오 판독 절차가 시작되면 판독 종료 전까지 선수 교체가 허용되지 않는다. 수비 투수 교체를 서둘러 판독을 회피하려는 ‘속임수’에 대해서도 심판이 공격측 판독 기회를 인정하는 등 보완 규정이 있다.', '', '', 42)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-44', '비디오 판독', '판독 시간 가이드', '원칙적으로 3분 내 결정', '판독 시작부터 종료까지 원칙적으로 3분 이내에 결론을 내려야 한다. 다만 기술적 문제나 복합 규칙 적용 등 불가피한 경우에는 예외적으로 초과가 허용된다.', '', '', 43)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-45', '비디오 판독', '주자 배치 결정', '처음부터 옳았을 경우 가정', '판정이 번복되면 심판팀장은 ‘처음부터 옳은 판정이었다면’을 가정해 주자 배치, 득점 인정/무효 등을 결정한다. 플라이 볼의 깊이, 주자 속도, 아웃카운트 등 상황 변수를 모두 감안한 재구성이 핵심이다.', '', '', 44)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-46', '비디오 판독', '판독 신청 철회 불가', '결과·배치 결정은 최종', '감독이 판독을 요청하면 철회할 수 없다. 또한 판독 결과와 따라붙는 주자 배치 등 보정 조치는 최종이며, 추가 제소나 항의는 허용되지 않는다. 현장 혼선을 줄이고 경기를 신속하게 재개하기 위한 원칙이다.', '', '', 45)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-47', '비디오 판독', '중계 부재 시', '판독 불가, 원심 유지', '중계 화면 노출이 없거나 방송 중단 등으로 영상 확보가 불가능하면 판독을 진행하지 않는다. 이 경우 원심이 최종 판정이 되며, 감독은 이에 대해 이의를 제기할 수 없다.', '', '', 46)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-48', '비디오 판독', '경기 지연 제재', '의도적 지연 시 기회 소멸', '벤치가 판독 결정을 지연시키기 위해 고의로 시간을 끄는 경우, 심판은 경고 후 해당 구단의 판독 기회를 소멸시킬 수 있다. 총재는 사후 제재까지 부과할 수 있어, 페어플레이 정신을 강하게 요구한다.', '', '', 47)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-49', '비디오 판독', '양팀 동시 요청', '요청 순서대로 처리', '양 팀이 같은 상황에서 서로 다른 판정을 놓고 요청할 수 있으며, 요청 순서대로 진행한다. 앞선 판정 결과에 따라 뒤 요청의 필요성이 사라지면 후속 판독은 취소되고 기회도 보존된다.', '', '', 48)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-50', '비디오 판독', '감독 결정의 무효화', '번복 시 전략 재선택 허용', '판독으로 판정이 번복되면, 그 판정 이후 내려진 감독의 전략적 결정(예: 투수교체)은 무효화할 수 있다. 이는 오판으로 인한 불리함을 최소화하려는 합리적 보정 장치다.', '', '', 49)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-51', '비디오 판독', '신청 대상 확인', '비대상 요청은 기회 보존', '감독이 판독 비대상 판정에 대해 요청하면 심판팀장이 대상이 아님을 알리고, 그 경우 요청 기회는 소모되지 않는다. 복잡한 상황에서의 의사소통 비용을 낮춰 현장 운영을 돕는다.', '', '', 50)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-52', '경기/환경/장비', '경기관리인 제도', '홈구단 임원이 대행', '홈구단의 임원은 경기관리인으로서 총재의 경기 관리 직능을 대행한다. 구장 질서 유지, 연습 시간 조정, 우천·장비 문제 등 현장 의사결정의 실무 창구로 작동한다.', '', '', 51)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-53', '경기/환경/장비', '경기거행 여부', '개시 3시간 전 운영위원 결정', '경기개시 3시간 전에 KBO 경기운영위원이 개시 여부를 결정한다. 강우 예보가 있으면 방수포 설치 지시 등 조치를 내릴 수 있고, 상황 변화 시 개시 직전까지도 재결정이 가능하다. 개시 시점부터는 주심에게 권한이 이관된다.', '', '', 52)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-54', '경기/환경/장비', '심판 제도', '원칙 4심제, 유고 시 3·2심 가능', 'KBO 경기는 4심제로 운영되며, 심판 유고 시 3심 또는 2심으로 축소해 진행할 수 있다. 심판 미도착 시 선수 임시 심판 배치 등 비상조치도 정해져 있어 경기 중단을 최소화한다.', '', '', 53)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-55', '경기/환경/장비', '경기 전 연습 순서', '홈타격→원정연습→홈수비→원정수비', '경기 전 홈팀 타격, 원정팀 준비·타격, 홈팀/원정팀 수비연습 순으로 진행되며, 그라운드 사정에 따라 경기관리인이 단축·생략을 명할 수 있다. 관중 입장 후에는 유니폼·모자 착용 등 복장 규정도 명확히 지켜야 한다.', '', '', 54)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-56', '경기/환경/장비', '안전 보장', '원정·심판 보호 의무', '홈구단은 심판위원과 원정팀에 대한 안전을 보장해야 한다. 이는 라커룸 동선, 팬과의 접점 관리, 퇴장·판정 민감 상황에서의 보호조치 등 광범위하게 적용되는 기본 원칙이다.', '', '', 55)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-57', '경기/환경/장비', '관중 응원 제한', '과도한 앰프 사용 금지', '관객석에서 앰프 등 과도한 응원으로 관객에게 불쾌감을 주거나 경기 진행에 지장을 준다면 주심은 즉시 중지를 요청할 수 있다. 응원 문화의 다양성과 경기 집중도의 균형을 맞추려는 최소 규범이다.', '', '', 56)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-58', '경기/환경/장비', '입장요금 처리', '노게임 땐 다음 경기 재입장', '노게임이 선고되면 동일 구장의 다음 경기에 입장할 수 있도록 조치된다. 정식경기 또는 정식 무승부가 되면 전액 징수되는 등 상황별 처리 규칙이 명확히 마련되어 있다.', '', '', 57)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-59', '경기/환경/장비', '홈 플레이트 구조', '17인치 오각형', '홈 플레이트는 한 변 17인치(43.2cm)의 오각형으로, 투수판과 평행 배치된다. 스트라이크 존의 기준점이자 모든 주루의 출발점으로, 경기 규칙 전반의 ‘원점’ 역할을 한다.', '', '', 58)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-60', '경기/환경/장비', '외야 펜스 이상 기준', '좌우 97.5m·중앙 121.9m 권장', '이상적인 KBO 구장 기준으로 좌·우 파울라인은 약 97.5m, 중앙은 약 121.9m 이상이 권장된다. 펜스 길이는 홈런 빈도와 수비 위치 선정, 투수 운용 철학까지 좌우하는 중요한 변수다.', '', '', 59)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-61', '경기/환경/장비', '투수 마운드 경사', '앞 6인치 지점부터 6피트까지 경사', '투수판 앞 6인치 지점부터 본루 방향 6피트까지 1피트당 1인치 하강 경사를 유지한다. 이는 투구 메커니즘의 일관성과 부상 방지에 중요한 기준이다.', '', '', 60)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-62', '경기/환경/장비', '포수 미트 규격', '둘레 96.5cm·길이 39.4cm 이내', '포수 미트는 강속구와 변화구를 안정적으로 포구하기 위해 크고 깊다. 둘레·길이·웹 규격이 엄격하게 관리되어, 투수-포수 배터리의 안전과 공정성을 보장한다.', '', '', 61)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-63', '경기/환경/장비', '1루수 미트', '내야수 중 최대형 장비', '1루수 미트는 다양한 송구를 안정적으로 잡기 위해 다른 내야 글러브보다 크고 깊다. 최대 길이·폭·웹 규격 제한이 존재해 수비 이점이 과도하게 커지지 않도록 균형을 맞춘다.', '', '', 62)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-64', '경기/환경/장비', '투수 글러브 색 제한', '흰색·회색 등 밝은색 제한', '타자의 시야 혼란을 막기 위해 투수 글러브의 과도한 밝은색 사용이 제한된다. 공의 릴리즈와 회전을 명확히 볼 수 있게 하여 타격 공정성을 높인다.', '', '', 63)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-65', '경기/환경/장비', '로진백 사용', '승인 제품·사전 점검', '투수의 미끄럼 방지를 위한 로진백은 승인된 제품만 사용 가능하고, 경기 시작 전 심판이 상태를 점검한다. 이물질 혼용 등 규정 위반 시 즉시 퇴장과 추가 제재를 받을 수 있다.', '', '', 64)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-66', '경기/환경/장비', '야구공 규격', '무게·둘레 엄격 관리', '공은 141.7~148.8g, 둘레 22.9~23.5cm로 관리되며, 코르크·고무 심에 실을 감고 흰 가죽 두 장으로 마감한다. 규격의 미세한 차이가 비거리·회전에 큰 영향을 미치므로 공급·보관·검수 전 과정이 체계화되어 있다.', '', '', 65)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-67', '경기 규칙', '1루 오버런', '1루만 자유 오버런', '타자는 1루를 밟고 곧장 귀루 의사를 보이면 태그돼도 아웃이 아니다. 그러나 2·3루에서의 오버런은 태그 아웃 위험이 즉시 발생한다. 1루만 예외인 이유는 타격 직후 전력질주를 보호하기 위해서다.', '', '', 66)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-68', '경기 규칙', '포스 아웃', '진루 의무 주자 처리', '타구로 인해 진루 의무가 생긴 주자는 수비가 해당 베이스를 먼저 밟으면 아웃된다. 태그 없이도 아웃이 성립하는 점이 태그 아웃과의 핵심 차이이며, 병살 플레이의 출발점이 된다.', '', '', 67)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-69', '경기 규칙', '보크', '주자 있을 때 부정 투구', '주자가 있을 때 투수의 부정 동작이 발생하면 보크가 선언되고, 모든 주자는 한 루씩 진루한다. 투수의 동작 일관성과 페어플레이를 강제하는 규정으로, 심리전의 긴장도를 높인다.', '', '', 68)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-70', '경기 규칙', '낫아웃', '삼진 후 포수 미트 미확보 시', '세 번째 스트라이크가 포수 미트에 확실히 포구되지 않으면 1루가 비었거나 2아웃인 경우 타자는 1루로 뛸 수 있다. 경기 흐름을 급변시킬 수 있는 규정으로, 포수의 블로킹 능력이 크게 부각된다.', '', '', 69)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-71', '경기 규칙', '희생플라이', '아웃이지만 타점 인정', '주자 3루 상황에서 외야 플라이로 아웃되더라도 주자가 태그업으로 득점하면 타자에게 희생플라이가 기록된다. 팀 득점을 위한 선택으로 타자의 개인 기록과 팀 전략이 만나는 지점이다.', '', '', 70)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-72', '경기 규칙', '폭투와 패스트볼', '투수 책임 vs 포수 책임', '폭투는 투수가 포수가 잡기 어려운 곳으로 던져 주자가 진루한 경우, 패스트볼은 포수가 잡을 수 있는 공을 놓쳐 주자가 진루한 경우다. 기록 책임 주체가 달라 투·포수의 퍼포먼스 지표 해석에 영향을 준다.', '', '', 71)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-73', '경기 규칙', '고의4구', '투수-포수 신호로 자동 부여', '전통적 4개의 볼 투구 대신, 투수·포수의 신호만으로 고의4구를 선언할 수 있어 경기 템포를 높인다. 강타자 회피·맞상대 회피 전략이 빠르게 실행된다.', '', '', 72)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-74', '경기 규칙', '인필드플라이', '야수 실수 악용 방지', '무사 또는 1사 주자 1·2루(만루)에서 타자가 짧은 뜬공을 치면, 야수가 일부러 떨어뜨려 병살을 유도하는 행위를 막기 위해 인필드플라이가 선언된다. 타자는 자동 아웃이며, 주자는 원칙적으로 위험을 감수하고 진루할 수 있다.', '', '', 73)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-75', '경기 규칙', '러너 인터피어런스', '수비 방해 금지', '주자·타자가 수비를 방해하면 인터피어런스가 선언된다. 베이스 러닝 라인 이탈, 포수 송구 방해 등 다양한 장면에서 적용되며, 공정한 수비 기회를 보장한다.', '', '', 74)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-76', '경기 규칙', '오버슬라이딩·슬라이딩 규정', '더블플레이 보호', '2루에서의 무리한 슬라이딩으로 야수를 넘어뜨리거나 방해하면 수비 보호를 위한 규정에 따라 방해가 선언된다. 더블플레이 시도 시 안전과 공정성을 위한 핵심 장치다.', '', '', 75)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-77', '경기 규칙', '피치아웃', '도루 견제용 바깥 높은 공', '도루를 저지하기 위해 포수가 잡기 좋은 위치로 스트라이크 존 밖으로 빠르게 던지는 투구. 주자 리드폭과 스타트 타이밍을 흔들어 공격 작전을 억제한다.', '', '', 76)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-78', '일정', '홈·원정 벤치 위치', '1루·3루 파울 뒤 지정', '양 팀 벤치는 1루·3루 파울지역 뒤편에 별도로 마련되며, 지붕과 가림벽 등 안전 설비를 갖춘다. 작전회의, 장비 보관, 선수 대기 등 경기 운영의 중심 공간이다.', '', '', 77)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-79', '일정', '마케팅 활성화 시간 운영', '금요일 19:00 변동 허용', '금요일 경기의 경우 사전 요청이 있으면 마케팅·관객 편의를 고려해 19:00 시작으로 변경 가능하다. 주말 여가 패턴과 퇴근 시간을 고려한 유연 운영 사례다.', '', '', 78)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-80', '일정', '노게임 재입장', '동일 구장 다음 경기 입장', '노게임이 된 경우 동일 구장의 다음 경기에 입장할 수 있도록 해 팬의 손해를 최소화한다. 변수 많은 야외 스포츠의 특성을 감안한 합리적 보상 체계다.', '', '', 79)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-81', '일정', '구장 방수포 설치 지시', '운영위원 권한', '강우 예보 시 경기운영위원은 홈구단에 방수포 설치 등 선제 조치를 지시할 수 있다. 경기 개시 가능성을 높이고 선수 부상을 예방하기 위한 필수 절차다.', '', '', 80)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-82', '일정', '심판·기록원 사고 대책', '대체 배치·임시 기록원 지정', '심판 일부 또는 전원이 지연·불참 시 비번 심판 보충, 선수 임시 심판 배치 등 예외 조치를 시행한다. 기록원 부재 시 구단 기록원을 임시 공식 기록원으로 지정해 경기 지속성을 확보한다.', '', '', 81)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-83', '일정', '타순 발표', '경기 30분 전 공식 발표', '주심은 경기 30분 전에 양 팀 타순을 기록원에게 알려 공지하도록 하며, 관중도 이 정보를 통해 경기 전략을 미리 가늠할 수 있다. 선발 라인업은 팬 경험의 중요한 일부다.', '', '', 82)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-84', '일정', '더블헤더 2경기 타순표', '1경기 종료 10분 후 제출', '더블헤더 2경기의 타순표는 1경기 종료 10분 후 제출하여 선수 교체와 컨디션을 반영할 시간을 확보한다. 불펜 소모와 타선 교통정리가 승부를 가르는 포인트다.', '', '', 83)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-85', '규정/제도', '정식 무승부 처리', '입장료 전액 징수', '정식경기 또는 정식 무승부가 성립하면 입장료는 전액 징수된다. 노게임과 달리 경기 자체는 유효했음을 의미한다.', '', '', 84)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-86', '규정/제도', '응원 도구 규격 준수', '경기 진행 방해 금지', '응원 막대, 현수막, 전자제품 등은 타 관중의 시야를 과도하게 가리거나 소음으로 경기 진행을 방해해서는 안 된다. 응원 문화의 다양성을 보장하면서도 공정한 관전 환경을 유지하기 위한 기본 상식이다.', '', '', 85)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-87', '규정/제도', '홍보·광고 노출 규정', '용구 표면 광고 제한', '헬멧·유니폼·배트 등 경기용구 표면에는 규정된 범위의 표시만 허용된다. 무분별한 광고 노출을 막아 경기 집중도를 높이고 리그 이미지를 보호한다.', '', '', 86)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-88', '비디오 판독', '수비방해/주루방해 경합', '주루 라인·차단 여부', '수비방해와 주루방해는 현장에서 판정이 엇갈리기 쉬운 영역이다. 비디오 판독은 진로 차단, 태그 시점, 베이스 접근 각도 등 세부 요소를 프레임 단위로 재구성하여 공정한 결론에 이르게 한다.', '', '', 87)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-89', '비디오 판독', '견제사 아웃', '태그 먼저냐 베이스 복귀 먼저냐', '투수의 견제에 포수·내야수가 가세하는 장면에서 손가락 끝 태그와 베이스 터치의 순서가 중요하다. 초고속 카메라는 주자의 일시적 이탈까지 잡아내 판정 신뢰도를 높인다.', '', '', 88)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-90', '비디오 판독', '플렛치드 볼(지면 바운드) 오인', '포구 vs 트랩', '외야·내야에서 낮게 날아온 타구를 글러브로 얕게 받았을 때, ‘순간 포구’인지 ‘바운드 후 트랩’인지 구분이 어렵다. 판독은 공의 변형, 글러브 내부 진입 각도, 지면 접촉 흔적을 통해 결론을 낸다.', '', '', 89)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-91', '비디오 판독', '파울폴·난간·스코어보드 간섭', '데드 여부', '홈런 타구가 파울폴·난간·전광판 외곽을 맞았는지 여부는 홈런/2루타/인플레이 결과를 좌우한다. 복수 각도의 카메라로 타구 궤적과 충돌 지점을 특정해 일관된 판정을 유도한다.', '', '', 90)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-92', '비디오 판독', '주자의 베이스 미터치', '순간 이탈 확인', '슬라이딩 과정의 짧은 이탈로 태그 아웃이 되는 장면은 선수·팬 모두에게 충격적이다. 판독은 신체 일부의 지속 접촉 여부를 정밀히 확인하며, 이는 슬라이딩 기술의 진화를 촉발했다.', '', '', 91)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-93', '비디오 판독', '포수의 수비 방해', '배트와 미트 접촉', '타격 순간 배트가 포수 미트와 접촉했는지 여부는 득점·출루에 큰 차이를 만든다. 사운드·프레임 분석으로 접촉 시점을 특정해, 공정한 보상 판정(타자 1루, 주자 진루)을 지원한다.', '', '', 92)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-94', '비디오 판독', '투수 보크 관련 세부', '세트 자세 정지 여부', '보크 판정은 투수의 세트 자세 정지, 이중 동작, 불규칙 모션 등 미세한 요소가 얽힌다. 판독은 리듬·정지 시간·발 움직임을 객관화해 경기의 일관성을 돕는다.', '', '', 93)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-95', '비디오 판독', '주자 겹침·동시 베이스 접촉', '추월·공과 여부', '복잡한 런다운에서 두 주자·야수가 베이스를 동시에 밟는 장면은 현장에서 놓치기 쉽다. 프레임 분석으로 추월·공과 여부를 구분해 주자 배치를 재정렬한다.', '', '', 94)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-96', '비디오 판독', '수비 시프트 라인 침범', '발 위치·첫 접촉 내야수', '시프트 제한은 내야수의 발 위치와 첫 번째로 공에 접촉한 내야수를 기준으로 판단한다. 카메라 라인 매칭으로 베이스 라인과 발 위치를 정밀히 확인한다.', '', '', 95)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-97', '비디오 판독', '주심·심판 간 충돌 판정', '시야 가림·접촉', '주심 또는 기저심이 타구·주자와 충돌해 플레이가 왜곡된 장면에서는 판독으로 시퀀스를 재구성한다. 심판 간 커뮤니케이션과 현장 권한을 유지하면서, 공정성과 납득 가능한 결론을 지향한다.', '', '', 96)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-98', '역사·TMI', '개막전 낮 경기 전통', '초기 흥행·가족 관람', '개막 이틀은 낮 경기로 편성하는 전통이 이어지고 있다. 어린이·가족 단위 관람객 유입, 미디어 노출, 시즌 개막의 축제화를 고려한 결정으로 리그의 ‘출발선’을 밝고 경쾌하게 만든다.', '', '', 97)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-99', '역사·TMI', '금요일 야간 특례', '퇴근 후 야구장으로', '일부 금요일을 19:00로 조정할 수 있는 특례는 직장인의 퇴근 패턴과 흥행 데이터를 반영한 정책이다. 도심 접근성 높은 구장일수록 퇴근 러시아워를 흡수해 관중 증가 효과가 뚜렷하다.', '', '', 98)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-100', '역사·TMI', '구단기·우승기 게양 의식', '시각적 스토리텔링', '경기 당일 양 구단기와 전년도 우승기를 게양하는 의식은 야구장이 스포츠 박물관이 되는 순간이다. 팬은 배너와 깃발을 통해 팀의 서사를 한눈에 느낀다.', '', '', 99)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-101', '역사·TMI', '서스펜디드의 드라마', '다음 날 재개된 결말', '중단 시점부터 재개하는 서스펜디드는 이튿날 전혀 다른 기류 속에서 승부가 갈리는 드라마를 만든다. 불펜 운용, 대타 작전, 날씨까지 모두 리셋되어 감독의 창의성이 시험대에 오른다.', '', '', 100)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-102', '역사·TMI', '판독 3분 룰 도입 배경', '방송·관중 몰입도', '판독 시간을 3분으로 제한한 배경에는 방송 편성의 안정과 관중의 몰입 유지가 있다. 판독 품질을 해치지 않으면서 템포를 잃지 않게 하는 ‘절충의 미학’이다.', '', '', 101)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-103', '역사·TMI', '피치클락 소프트 런칭', '완화된 시간·예외', '피치클락은 국제 사례와 선수 적응도를 감안해 완화된 시간과 몇 가지 예외로 시작됐다. 제도의 취지를 살리되 현장 혼란을 줄이는 ‘한국형 튜닝’이 특징이다.', '', '', 102)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-104', '역사·TMI', 'ABS 도입 논의', '일관성 vs 인간미', 'ABS는 일관성과 공정성을 높이는 장점이 있지만, 인간 심판의 ‘호흡’이 줄어든다는 우려도 있다. KBO는 단계적 도입과 소통 체계를 통해 현장의 수용성을 높이려 한다.', '', '', 103)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-105', '역사/기록', 'KBO 개막전 첫 홈런', '1982년 3월 27일, 삼성 이만수', 'KBO 역사상 첫 홈런은 1982년 3월 27일 개막전에서 삼성 라이온즈 이만수 선수가 MBC 청룡을 상대로 기록했다. 이 홈런은 한국 프로야구의 시작을 알린 상징적인 장면으로 남아있다. 이만수 선수는 개막전의 첫 안타, 첫 타점, 첫 홈런을 모두 기록하는 역사적인 순간을 만들었다.', '', '', 104)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-106', '역사/기록', 'KBO 첫 노히트노런', '1984년 5월 5일, 해태 방수원', ' KBO 리그 최초의 노히트노런은 1984년 5월 5일 해태 타이거즈의 방수원 투수가 삼미 슈퍼스타즈를 상대로 기록했다. 이 경기는 해태가 5-0으로 승리했으며, 방수원 투수는 당시 KBO 리그에서 첫 번째로 노히트노런을 달성한 투수로 기록되었다.', '', '', 105)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-107', '역사/기록', '최장 경기 시간', '5시간 58분, 2009년 5월 21일', '우천중단 시간을 제외한 한국 프로 야구 최장 시간 경기는 2009년 5월 21일 광주에서 열린 LG-KIA 전의 5시간 58분이다. 이 경기는 12회말까지 진행되었지만 13 -13으로 승부를 가리지 못했다.', '', '', 106)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-108', '역사/기록', '최단 경기 시간', '1시간 33분, 1985년', '1985년 청보 핀토스와 롯데 자이언츠의 경기에서 1시간 33분 만에 경기가 종료되며 KBO 최단 경기 기록을 세웠다. 이 경기는 롯데 자이언츠가 3-0으로 승리했다.', '', '', 107)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-109', '역사/기록', '첫 한국시리즈 우승팀', '1982년 OB 베어스', '1982년 한국시리즈에서 OB 베어스가 삼성 라이온즈를 4승 1무 1패로 꺾고 초대 챔피언이 되었다. 이 우승은 프로야구 초창기 팬들의 큰 호응을 불러왔다.', '', '', 108)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-110', '역사/기록', '최다 홈런 경기', '14개, 2000년 4월 5일', '2000년 4월 5일 현대 유니콘스와 한화 이글스의 경기에서 양 팀 합쳐 총 14개의 홈런이 터지며 KBO 최다 홈런 경기 기록을 세웠다. 현대 유니콘스가 10개 홈런, 한화 이글스가 4개 홈런을 기록했다.', '', '', 109)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-111', '역사/기록', '단일 시즌 최다 관중 경기', '1,088만 7,705명, 2024년', 'KBO의 단일 시즌 최다 관중 기록은 2024시즌에 세워진 1,088만 7,705명이며, 경기당 평균 관중은 1만 5,122명을 기록했습니다. 이 기록은 2017년 시즌의 840만여 명을 넘어서며 KBO 리그 역사상 처음으로 1천만 관중을 돌파했다.', '', '', 110)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-112', '역사/기록', '최다 연속 안타 기록', '39경기, 2004년 박종호', '2004년 삼성 라이온즈 박종호 선수가 기록한 39경기 연속 안타는 KBO 역사상 최다 연속 안타 기록으로 남아있다. 이 기록은 그의 꾸준한 타격 능력을 보여준다.', '', '', 111)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-113', '역사/기록', '단일 시즌 최다 탈삼진', '228개, 2025년 코디 폰세', '2025년 한화 이글스의 코디 폰세 선수가 9월 3일 NC 다이노스전에서 226 탈삼진을 기록하며 이전 기록인 미란다(두산)의 225개를 넘어섰다. 이후 2개의 탈삼진을 추가해 탈삼진 기록은 228개로 되었다.', '', '', 112)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-114', '역사/기록', '최다 연속 경기 출루 기록', '86경기, 2016년 김태균', '2016년 한화 이글스 김태균 선수가 세운 86경기 연속 출루 기록은 KBO 역사상 최장 기록이다. 이 기록은 그의 뛰어난 컨택 능력과 집중력을 입증한다.', '', '', 113)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-115', '규칙 & 제도', '정규시즌 연장 11회 제한', '2025년부터 연장전은 11회까지만', 'KBO 정규시즌은 2025년 기준 연장전을 최대 11회까지만 진행하며, 11회 종료 후에도 승부가 나지 않으면 무승부로 처리된다. 선수 보호와 경기 시간 단축을 위한 조치다.', '', '', 114)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-116', '규칙 & 제도', '포스트시즌 서스펜디드', '우천 시 이어서 경기', 'KBO 포스트시즌에서는 우천 등으로 경기가 중단되면 콜드게임이 아닌 서스펜디드로 진행된다. 즉, 다음 날 중단 시점부터 경기를 이어간다.', '', '', 115)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-117', '규칙 & 제도', '피치클락(Pitch Clock)', '주자 없으면 20초, 주자 있으면 25초', '2025시즌부터 피치클락이 정식 시행되어 투수는 주자 없을 때 20초, 주자 있을 때 25초 안에 투구를 시작해야 한다. 위반 시 투수는 자동 볼, 타자는 자동 스트라이크 판정을 받는다.', '', '', 116)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-118', '규칙 & 제도', '비디오 판독', '감독당 2회, 성공 시 유지', 'KBO의 비디오 판독은 홈런, 아웃/세이프, 파울/페어, 주루 방해 등 다양한 상황에 적용된다. 감독은 정규이닝 기준 2회까지 신청 가능하며, 성공 시 횟수가 유지된다.', '', '', 117)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-119', '규칙 & 제도', '콜드게임 규정', '5회 이상·10점 차 조기 종료', '정규시즌 경기에서 5회 이상 진행 후 10점 차 이상 벌어지면 심판 재량으로 콜드게임을 선언할 수 있다. 관중·선수 안전과 경기 운영 효율화를 위한 제도다.', '', '', 118)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-120', '규칙 & 제도', '포수 마운드 방문 제한', '정규이닝 기준 2회까지', '포수는 경기당 2회까지만 마운드를 방문할 수 있으며, 연장 진입 시 1회 추가된다. 경기 지연을 방지하기 위한 스피드업 규정이다.', '', '', 119)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-121', '규칙 & 제도', '주루 방해 규정', '야수·주자 간 충돌 시 우선권 중요', '야수는 수비 시 우선권이 있으며, 주자가 방해하면 아웃된다. 반대로 야수가 수비 없이 주로를 막으면 주루 방해로 판정된다.', '', '', 120)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-122', '규칙 & 제도', '퓨처스리그 승부치기', '10회부터 1,2루 자동 주자', '퓨처스리그에서는 10회부터 승부치기를 도입하여 1·2루에 주자를 자동 배치한다. 경기 시간을 단축하고 빠른 승부를 유도하기 위한 제도다.', '', '', 121)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-123', '흥미로운 TMI', '덕아웃 전자기기 금지', '휴대폰·무전기 사용 불가', 'KBO 리그 규정상 경기 중 덕아웃 내 전자기기 사용은 금지된다. 단, 전력 분석용 리스트밴드나 페이퍼만 제한적으로 허용된다.', '', '', 122)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-124', '흥미로운 TMI', '고척돔 천장 그라운드룰', '천장 맞으면 판정 달라짐', '고척스카이돔에서는 타구가 천장에 닿으면 구간에 따라 판정이 달라진다. 내야 쪽은 파울, 외야 상단 통로 이후는 홈런, 천장에 공이 끼면 2루 진루권이 주어진다.', '', '', 123)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-125', '흥미로운 TMI', '팀당 외국인 선수 3명 제한', '최대 3명 보유·2명 출전', 'KBO는 팀당 외국인 선수 최대 3명 보유가 가능하며, 보통 투수 2명+타자 1명으로 구성된다. 리그 균형과 국내 선수 성장 기회를 위한 제한이다.', '', '', 124)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-126', '흥미로운 TMI', '야구공 무게와 구조', '공인구는 148g, 말가죽으로 덮음', 'KBO 공인구는 약 148g이며, 코르크 심에 실을 감고 흰색 말가죽으로 덮는다. 심판은 경기 전 봉인된 공을 직접 확인한다.', '', '', 125)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-127', '흥미로운 TMI', '헤드퍼스트 슬라이딩', '부상 위험 커서 권장하지 않음', '헤드퍼스트 슬라이딩은 허용되지만 손목·어깨 부상 위험이 크다. KBO와 각 구단은 가급적 피할 것을 권장한다.', '', '', 126)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-128', '흥미로운 TMI', '올스타전 승부치기', '10회부터 승부치기 도입', 'KBO 올스타전은 10회부터 승부치기를 도입하여 빠른 승부를 유도한다. 팬들에게 흥미로운 볼거리를 제공하기 위한 규정이다.', '', '', 127)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-129', '역사/기록', '연속 타자 탈삼진 기록', '이대진·조병현, 10타자 연속 삼진', '1998년 해태 타이거즈 이대진은 현대 유니콘스를 상대로 10타자 연속 탈삼진을 기록하며 KBO 최초이자 최다 연속 타자 탈삼진 기록을 세웠다. 26년 뒤인 2024년, SSG 조병현이 구원투수로는 최초로 10타자 연속 탈삼진을 달성해 화제를 모았다.', '', '', 128)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-130', '역사/기록', '시즌 200안타', '서건창·레이예스의 대기록', '넥센 서건창은 2014년 201안타를 기록해 KBO 최초의 시즌 200안타 달성자가 되었고, 2024년 롯데 레이예스가 202안타로 역대 외국인 선수 최초 200안타 기록을 세우며 신기록을 경신했다.', '', '', 129)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-131', '역사/기록', '통산 400홈런', '이승엽, KBO 최초 달성', '삼성 이승엽은 2015년 6월 3일 롯데전에서 KBO 최초로 400홈런 고지를 밟았다. 이후 그는 한·일 통산 600홈런까지 달성하며 ‘국민타자’로 불리는 위엄을 증명했다.', '', '', 130)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-132', '역사/기록', '신인 첫 타석 홈런', '강백호 포함 9명 달성', 'KBO 역사에서 신인 데뷔 첫 타석 홈런을 기록한 선수는 롯데 이석규(1984)를 시작으로 총 9명이 있으며, 그중 KT 강백호는 2018년 개막전에서 18세 고졸 신인으로 첫 타석 홈런을 날리며 화려하게 등장했다.', '', '', 131)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-133', '역사/기록', '외국인 선수 최다 기록', '제이 데이비스·타이론 우즈의 기록', '한화 제이 데이비스는 외국인 선수 통산 최다 안타(979), 타점(591), 득점(538)을 기록했으며, 두산 타이론 우즈는 외국인 최초 시즌 MVP와 한국시리즈·올스타전 MVP를 모두 차지한 전설적 외국인 타자였다.', '', '', 132)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-134', '역사/기록', '박철순 22연승', '1982년 프로 원년 불멸의 대기록', 'OB 베어스 박철순은 1982년 프로 원년 시즌에서 22연승을 달성했다. 선발과 구원을 오가며 기록한 이 연승은 KBO 역사상 가장 깨기 어려운 대기록 중 하나로 꼽힌다.', '', '', 133)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-135', '역사/기록', '최동원 한국시리즈 4승', '1984년 한국시리즈 전설', '1984년 롯데 자이언츠의 최동원은 한국시리즈에서 혼자 4승을 올리며 팀을 창단 첫 우승으로 이끌었다. 단일 시리즈 최다 승리 기록으로 여전히 깨지지 않고 있다.', '', '', 134)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-136', '역사/기록', '선동열 통산 ERA 1.20', '1985~1995년, 불멸의 방어율', '해태 타이거즈의 선동열은 통산 1.20이라는 믿기 힘든 방어율을 기록했다. 전성기 시절 압도적인 구위와 제구로 KBO 역사상 가장 완벽한 투수로 평가된다.', '', '', 135)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-137', '역사/기록', '송진우 통산 210승', 'KBO 최다승 투수', '한화 이글스 송진우는 210승으로 KBO 통산 최다승 투수로 기록되었다. 1989년 데뷔 후 2009년까지 장수하며 꾸준히 승리를 쌓은 ''철인 투수''였다.', '', '', 136)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-138', '역사/기록', '이승엽 56홈런 시즌', '2003년 단일시즌 최다 홈런', '삼성 이승엽은 2003년 시즌 56개의 홈런을 기록하며 KBO 단일 시즌 최다 홈런 기록을 세웠다. 일본과 메이저리그에서도 주목을 받은 기록으로 한국 야구의 위상을 높였다.', '', '', 137)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-139', '역사/기록', '손아섭 2505안타', 'KBO 통산 최다 안타', '2024년 6월 20일 손아섭은 서울 잠실야구장에서 열린 두산과의 원정경기 6회 세번째 타석에서 투수 라울 알칸타라의 공을 받아치며 안타를 만들어 냈다. 손아섭의 개인 통산 2505번째 안타였다. 이로써 손아섭은 박용택이 2020년에 달성한 2504안타를 넘어 KBO 역대 개인 통산 최다 안타의 주인공이 됐다.', '', '', 138)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-140', '역사/기록', '장종훈 최초 40홈런-100타점', '1991년 대기록', '한화 장종훈은 1992년 KBO 최초로 시즌 40홈런과 100타점을 동시에 달성한 선수였다. 리그 타격 기록의 새로운 이정표였다. 1992년 시즌에 41홈런 102타점을 기록하며 이 대기록을 세웠습니다.', '', '', 139)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-141', '역사/기록', '강민호 포수 최다 홈런', 'KBO 역사상 최고의 공격형 포수', '강민호는 KBO 포수 중 최다 홈런 기록을 세운 선수로, 수비와 타격 모두에서 최고의 포수로 평가받는다. KBO 리그 역대 최초로 포수로서 350홈런 달성에 근접했다.', '', '', 140)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-142', '역사/기록', '이종범 84도루', '1994년 단일시즌 최다 도루', '해태 이종범은 1994년에 84개의 도루를 기록하며 KBO 단일시즌 최다 도루 기록을 세웠다. 이 기록은 아직까지도 깨지지 않고 있다.', '', '', 141)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-143', '역사/기록', '오승환 427세이브', 'KBO 통산 최다 세이브', '오승환 KBO에서 427세이브를 기록하며 통산 최다 세이브 투수로 남았다. 일본과 미국에서도 활약한 마무리의 상징이다.', '', '', 142)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-144', '역사/기록', '최연소 20승 투수', '정민철, 1992년 20세', '한화 이글스 정민철은 1992년 20세의 나이로 20승을 기록하며 KBO 최연소 20승 투수가 되었다.', '', '', 143)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-145', '역사/기록', '최다 완봉승', '선동열, 통산 29완봉', '선동열은 통산 29완봉승을 기록하며 KBO 완봉의 대명사로 불린다. 단일 시즌 최다 완봉승 기록은 1986년 선동열과 1995년 김상진(OB)이 기록한 8번입니다.', '', '', 144)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-146', '역사/기록', '최다 연속 경기 홈런', '이대호, 9경기 연속', '롯데 자이언츠 이대호는 기아 타이거즈와의 경기에서 9경기 연속 홈런을 기록하며 KBO 최다 연속 경기 홈런 기록을 세웠다.', '', '', 145)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-147', '역사/기록', '최다 연속 세이브', '오승환, 38연속 세이브', '2006년 8월 24일 사직 두산전부터 9월 22일 수원 KIA전까지 38경기 연속 세이브를 기록했습니다. 이 기록은 2006년 KBO 리그 단일 시즌 최다 세이브 기록(47세이브)을 세우며 달성한 대기록입니다.', '', '', 146)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-148', '역사/기록', '최다 연속 경기 무실점', '김시진, 45 1/3이닝', '김시진은 1980년대 45 1/3이닝 연속 무실점을 기록했다. 이 기록은 KBO 투수 최장 무실점 이닝이다.', '', '', 147)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-149', '역사/기록', '최다 연속 도루 성공', '송성문, 34연속 도루', '송성문은 2024년 34연속 도루에 성공하며 KBO 최다 연속 도루 성공 기록을 세웠다. 2023년 8월 13일 잠실 LG 트윈스전부터 2025년 6월 29일 대구 삼성 라이온즈전까지 34연속 도루 기록을 세웠다.', '', '', 148)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-150', '역사/기록', '단일 시즌 최다 안타', '빅터 레이예스, 2024시즌 202안타', '2024년 롯데 자이언츠 빅터 레이예스는 202안타를 기록하며 KBO 단일 시즌 최다 안타 기록을 세웠다. 이 기록은 2014년 서건창(넥센)이 세운 201안타를 넘어선 것이다.', '', '', 149)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-151', '역사/기록', '단일 시즌 최다 득점', '김도영, 2024시즌 143득점', '2024년 기아 타이거즈 김도영은 143득점을 기록하며 KBO 단일 시즌 최다 득점 기록을 세웠다. 이 기록은 2014년 서건창(넥센)이 세운 135득점을 넘어선 것이다. 아시아 최다 득점 타이 기록과 우타자 최다 득점 신기록이기도 하다.', '', '', 150)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-152', '역사/기록', '단일 시즌 최다 타점', '박병호, 2015시즌 146타점', '2015년 넥센 히어로즈 박병호는 146타점을 기록하며 KBO 단일 시즌 최다 타점 기록을 세웠다. 이 기록은 2003년 이승엽(삼성)과 2016년 최형우(삼성)가 세운 144타점을 넘어선 것이다.', '', '', 151)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-153', '역사/기록', 'KBO 통산 OPS 최고 기록', '에릭 테임즈, 2015시즌 1.288', '2015년 NC 다이노스 에릭 테임즈는 시즌 OPS 1.288을 기록하며 KBO 통산 OPS 최고 기록을 세웠다. 이 기록은 1982년 백인천(MBC 청룡)이 세운 1.242을 넘어선 것이다. 백인천이 세운 기록은 80경기 체제에서 나온 기록이기에, 144경기 체제에서 나온 테임즈의 기록이 더욱 의미가 있다.', '', '', 152)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-154', '역사/기록', 'KBO 통산 wRC+ 최고 기록', '백인천, 1982시즌 237.9', '1982년 MBC 청룡 백인천은 시즌 wRC+ 237.9를 기록하며 KBO 통산 wRC+ 최고 기록을 세웠다.', '', '', 153)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-155', '팀/시리즈 기록', '삼성 4연속 통합우승', '2011~2014 왕조 시대', '삼성 라이온즈는 2011년부터 2014년까지 4년 연속 통합 우승을 차지하며 KBO 역사상 최강의 왕조를 구축했다.', '', '', 154)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-156', '팀/시리즈 기록', '두산 93승 시즌', '2016년, 2018년 최다승 시즌', '2016년 두산 베어스는 93승을 기록하며 단일 시즌 최다승을 달성했다. 이후 2018년에도 93승으로 기록을 경신했다.', '', '', 155)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-157', '팀/시리즈 기록', '해태 9회 한국시리즈 우승', '최다 우승 구단', '해태 타이거즈는 1980~1990년대에만 9회의 한국시리즈 우승을 달성하며 KBO 최다 우승 구단으로 군림했다.', '', '', 156)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-158', '팀/시리즈 기록', 'LG 트윈스 29년 만의 우승', '2023년 감격의 정상', 'LG 트윈스는 2023년 한국시리즈에서 우승하며 29년 만에 정상에 복귀했다. 오랜 기다림 끝의 감격이었다.', '', '', 157)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-159', '팀/시리즈 기록', '넥센/키움 첫 한국시리즈 진출', '2014년 창단 첫 KS', '넥센 히어로즈(현 키움)는 2014년 창단 후 처음으로 한국시리즈에 진출해 신흥 강호로 도약했다.', '', '', 158)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-160', '팀/시리즈 기록', 'SK 와이번스 2007~08 2연패', '창단 첫 KS 2연패', 'SK 와이번스는 2007~08년 연속 한국시리즈 우승을 차지하며 구단 첫 2연패를 달성했다.', '', '', 159)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-161', '팀/시리즈 기록', 'NC 다이노스 첫 우승', '2020년 창단 첫 통합우승', 'NC 다이노스는 2020년 창단 첫 통합우승을 달성하며 KBO의 새로운 강자로 떠올랐다.', '', '', 160)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-162', '팀/시리즈 기록', 'KT 위즈 첫 통합우승', '2021년 신생팀 돌풍', 'KT 위즈는 2021년 창단 첫 통합우승을 차지하며 신생팀의 돌풍을 일으켰다.', '', '', 161)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-163', '팀/시리즈 기록', '한화 이글스 1999년 우승', '창단 첫 한국시리즈 우승', '한화 이글스는 1999년 창단 이후 처음으로 한국시리즈에서 우승을 차지했다.', '', '', 162)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-164', '팀/시리즈 기록', '삼성 7전 8기 첫 우승', '2002년 8번째 도전 만에', '삼성 라이온즈는 2002년 8번째 한국시리즈에 도전한 끝에 4승 2패로 LG 트윈스를 꺾고 창단 첫 우승을 차지했다.', '', '', 163)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-165', '흥미로운 TMI', 'KBO 최초 올스타전', '1982년 동대문야구장', 'KBO 최초의 올스타전은 1982년 동대문야구장에서 열렸으며, 원년 리그의 흥행을 상징하는 이벤트였다.', '', '', 164)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-166', '흥미로운 TMI', 'KBO 최초 외국인 선수', '1998년, 타이론 우즈 등', 'KBO는 1998년부터 외국인 선수 제도를 도입했다. 대표적인 첫 외국인 선수는 두산의 타이론 우즈, 한화의 제이 데이비스 등이 있다.', '', '', 165)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-167', '흥미로운 TMI', '최초의 돔구장', '고척스카이돔, 2016년', 'KBO 최초의 돔구장인 고척스카이돔은 2016년 정규시즌부터 넥센(현 키움)의 홈구장으로 사용됐다.', '', '', 166)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-168', '흥미로운 TMI', 'KBO 최초 10구단 시대', '2015년 KT 위즈 합류', '2015년 KT 위즈가 합류하며 KBO는 사상 최초로 10구단 체제를 갖추었다.', '', '', 167)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-169', '흥미로운 TMI', '최초의 10억 연봉 선수', '삼성 이승엽, 2012년', 'KBO 최초의 10억 연봉 선수는 일본에서 복귀한 이승엽입니다. 이승엽은 2012년 총액 11억 원(연봉 8억 원, 옵션 3억 원)에 삼성 라이온즈와 계약하며 KBO 리그 선수 중 처음으로 10억 원대 연봉 시대를 열었습니다.', '', '', 168)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-170', '흥미로운 TMI', '최초의 아시아 시리즈 우승', '삼성, 2011년', '삼성 라이온즈는 2011년 아시아 시리즈에서 우승하며 KBO 구단 최초로 아시아 정상에 올랐다.', '', '', 169)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-171', '흥미로운 TMI', '최초의 20-20 클럽', '김성한, 1989년', '김성한은 1989년 26홈런-32도루를 달성한 KBO 최초의 20-20 클럽 멤버다.', '', '', 170)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-172', '흥미로운 TMI', '최초의 30-30 클럽', '박재홍, 1996년', '박재홍은 1996년 30홈런-36도루를 동시에 달성하며 KBO 최초의 30-30 클럽에 가입했다.', '', '', 171)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-173', '흥미로운 TMI', '최초의 40-40 클럽', '아직 없음', 'KBO에서는 아직 40홈런-40도루를 동시에 달성한 선수가 없다.', '', '', 172)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-174', '흥미로운 TMI', 'KBO 최초의 사이클링 히트', '오대석, 1982년', '삼성 오대석은 1982년 6월 12일 삼미 슈퍼스타즈를 상대로 KBO 최초로 사이클링 히트를 기록했다.', '', '', 173)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-175', '흥미로운 TMI', 'KBO 최초의 퍼펙트 게임', '아직 없음', 'KBO 리그에서는 아직까지 단 한 번도 공식 퍼펙트 게임이 나오지 않았다.', '', '', 174)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-176', '규정/제도', '대체 외국인 선수 제도', '부상 선수 발생 시 대체 선수 영입 가능', '2024년부터 도입된 제도로, 기존 외국인 선수가 6주 이상 치료가 필요한 부상을 당할 경우, 해당 선수를 재활 리스트에 올리고 새로운 외국인 선수를 영입할 수 있습니다. 교체 횟수(2회)를 소진하지 않으면서 전력 공백을 최소화할 수 있어 팀 운영의 유연성이 크게 증가했습니다.', '', '', 175)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.trivia_items
  (source_key, category, term, short_desc, trivia, detail, fun, sort_order)
values ('trivia-177', '규정/제도', '베이스 크기 확대', '선수 부상 방지 및 도루 활성화', '2024 시즌부터 1, 2, 3루 베이스의 크기가 기존 15인치(38.1cm)에서 18인치(45.7cm)로 확대되었습니다. 베이스가 커지면서 주자와 수비수 간의 충돌 위험이 줄었고, 베이스 간의 실제 거리가 미세하게 짧아져 도루 성공률에 긍정적인 영향을 미치고 있습니다.', '', '', 176)
on conflict (source_key) do update set
  category = excluded.category,
  term = excluded.term,
  short_desc = excluded.short_desc,
  trivia = excluded.trivia,
  detail = excluded.detail,
  fun = excluded.fun,
  sort_order = excluded.sort_order,
  updated_at = now();

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-1', '타율은 무엇을 나타내는 지표인가요?', '타율은 타자가 타석에서 안타를 기록한 비율로, 기본적인 타격 능력을 평가하는 대표적인 지표입니다.', 0)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-1-option-1',
  '안타 ÷ 타수', true, 0
from public.quiz_questions where source_key = 'quiz-1';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-1-option-2',
  '수비 실책 횟수', false, 1
from public.quiz_questions where source_key = 'quiz-1';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-1-option-3',
  '팀의 승률', false, 2
from public.quiz_questions where source_key = 'quiz-1';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-1-option-4',
  '경기당 도루 수', false, 3
from public.quiz_questions where source_key = 'quiz-1';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-2', '출루율은 무엇을 나타내는 지표인가요?', '출루율은 타자가 출루한 비율을 나타내며, 단순한 안타 외에 볼넷과 사구로 얻은 출루도 반영합니다.', 1)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-2-option-1',
  '투수가 마운드를 내려올 시점', false, 0
from public.quiz_questions where source_key = 'quiz-2';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-2-option-2',
  '팀 전체 경기 승률', false, 1
from public.quiz_questions where source_key = 'quiz-2';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-2-option-3',
  '타자의 출루 비율', true, 2
from public.quiz_questions where source_key = 'quiz-2';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-2-option-4',
  '한 경기 평균 투구 수', false, 3
from public.quiz_questions where source_key = 'quiz-2';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-3', '장타율은 무엇을 나타내는 지표인가요?', '장타율은 타자의 장타 생산 능력을 평가하는 지표로, 단타보다 2루타 이상을 많이 친 선수에게 유리합니다.', 2)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-3-option-1',
  '주루 성공률', false, 0
from public.quiz_questions where source_key = 'quiz-3';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-3-option-2',
  '팀의 승률', false, 1
from public.quiz_questions where source_key = 'quiz-3';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-3-option-3',
  '마운드 높이 영향', false, 2
from public.quiz_questions where source_key = 'quiz-3';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-3-option-4',
  '누적 루타 ÷ 타수', true, 3
from public.quiz_questions where source_key = 'quiz-3';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-4', 'OPS은 무엇을 나타내는 지표인가요?', 'OPS는 타자의 출루 능력과 장타 능력을 합친 수치로, 타격 전반의 생산성을 나타냅니다.', 3)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-4-option-1',
  '마무리 투수의 등판 횟수', false, 0
from public.quiz_questions where source_key = 'quiz-4';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-4-option-2',
  '플라이볼 비율', false, 1
from public.quiz_questions where source_key = 'quiz-4';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-4-option-3',
  '출루율 + 장타율', true, 2
from public.quiz_questions where source_key = 'quiz-4';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-4-option-4',
  '팀의 승률', false, 3
from public.quiz_questions where source_key = 'quiz-4';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-5', 'ERA은 무엇을 나타내는 지표인가요?', 'ERA는 평균자책점으로, 투수가 9이닝 동안 허용할 것으로 예상되는 자책점의 평균입니다.', 4)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-5-option-1',
  '희생 번트 성공률', false, 0
from public.quiz_questions where source_key = 'quiz-5';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-5-option-2',
  '(자책점 × 9) ÷ 이닝', true, 1
from public.quiz_questions where source_key = 'quiz-5';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-5-option-3',
  '선수의 체력 지수', false, 2
from public.quiz_questions where source_key = 'quiz-5';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-5-option-4',
  '포수의 송구 능력', false, 3
from public.quiz_questions where source_key = 'quiz-5';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-6', 'WHIP은 무엇을 나타내는 지표인가요?', 'WHIP은 투수가 이닝당 허용한 주자 수(피안타 + 볼넷)로, 투수의 주자 억제 능력을 보여줍니다.', 5)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-6-option-1',
  '이닝당 실점률', false, 0
from public.quiz_questions where source_key = 'quiz-6';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-6-option-2',
  '(볼넷 + 피안타) ÷ 이닝', true, 1
from public.quiz_questions where source_key = 'quiz-6';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-6-option-3',
  '주루 성공률', false, 2
from public.quiz_questions where source_key = 'quiz-6';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-6-option-4',
  '희생 번트 성공률', false, 3
from public.quiz_questions where source_key = 'quiz-6';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-7', 'WAR은 무엇을 나타내는 지표인가요?', 'WAR은 같은 포지션의 평균적인 대체 선수보다 얼마나 팀의 승리에 기여했는지를 수치화한 지표입니다.', 6)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-7-option-1',
  '대체 선수 대비 승리 기여도', true, 0
from public.quiz_questions where source_key = 'quiz-7';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-7-option-2',
  '팀의 승률', false, 1
from public.quiz_questions where source_key = 'quiz-7';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-7-option-3',
  '팀 평균 출루율', false, 2
from public.quiz_questions where source_key = 'quiz-7';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-7-option-4',
  '플라이볼 비율', false, 3
from public.quiz_questions where source_key = 'quiz-7';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-8', 'wRC+은 무엇을 나타내는 지표인가요?', 'wRC+는 리그 평균을 100으로 두고, 그보다 몇 퍼센트 더 많은 득점 기여를 했는지를 나타냅니다.', 7)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-8-option-1',
  '선수의 체력 지수', false, 0
from public.quiz_questions where source_key = 'quiz-8';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-8-option-2',
  '포수의 송구 능력', false, 1
from public.quiz_questions where source_key = 'quiz-8';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-8-option-3',
  '리그 평균 대비 타격 기여도 지표', true, 2
from public.quiz_questions where source_key = 'quiz-8';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-8-option-4',
  '경기당 도루 수', false, 3
from public.quiz_questions where source_key = 'quiz-8';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-9', 'FIP은 무엇을 나타내는 지표인가요?', 'FIP는 수비의 영향을 제거하고 삼진, 볼넷, 홈런만을 기준으로 투수의 능력을 평가한 지표입니다.', 8)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-9-option-1',
  '희생 번트 성공률', false, 0
from public.quiz_questions where source_key = 'quiz-9';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-9-option-2',
  '마운드 높이 영향', false, 1
from public.quiz_questions where source_key = 'quiz-9';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-9-option-3',
  '수비 실책 횟수', false, 2
from public.quiz_questions where source_key = 'quiz-9';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-9-option-4',
  '수비 무관 투수 능력 평가 지표', true, 3
from public.quiz_questions where source_key = 'quiz-9';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-10', 'QS은 무엇을 나타내는 지표인가요?', 'QS(퀄리티 스타트)는 선발 투수가 최소 6이닝 이상을 던지고 3자책점 이하일 때 기록됩니다.', 9)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-10-option-1',
  '타자의 나이와 키 평균', false, 0
from public.quiz_questions where source_key = 'quiz-10';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-10-option-2',
  '플라이볼 비율', false, 1
from public.quiz_questions where source_key = 'quiz-10';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-10-option-3',
  '6이닝 이상 3자책점 이하', true, 2
from public.quiz_questions where source_key = 'quiz-10';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-10-option-4',
  '주루 성공률', false, 3
from public.quiz_questions where source_key = 'quiz-10';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-11', '세이브은 무엇을 나타내는 지표인가요?', '세이브는 투수가 팀의 리드를 지키며 경기를 마무리했을 때 부여되는 기록입니다.', 10)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-11-option-1',
  '리드 상황에서 경기 마무리', true, 0
from public.quiz_questions where source_key = 'quiz-11';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-11-option-2',
  '경기당 도루 수', false, 1
from public.quiz_questions where source_key = 'quiz-11';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-11-option-3',
  '주루 성공률', false, 2
from public.quiz_questions where source_key = 'quiz-11';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-11-option-4',
  '플라이볼 비율', false, 3
from public.quiz_questions where source_key = 'quiz-11';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-12', '홀드은 무엇을 나타내는 지표인가요?', '홀드는 승부가 유지되는 상황에서 구원 투수가 리드를 지키고 마무리 투수에게 넘겨준 경우에 기록됩니다.', 11)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-12-option-1',
  '볼넷과 삼진의 차이', false, 0
from public.quiz_questions where source_key = 'quiz-12';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-12-option-2',
  '리드를 지키고 마무리 전 투수의 기록', true, 1
from public.quiz_questions where source_key = 'quiz-12';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-12-option-3',
  '타자의 나이와 키 평균', false, 2
from public.quiz_questions where source_key = 'quiz-12';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-12-option-4',
  '플라이볼 비율', false, 3
from public.quiz_questions where source_key = 'quiz-12';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-13', 'K/9은 무엇을 나타내는 지표인가요?', 'K/9은 9이닝 기준으로 투수가 기록한 삼진 개수를 나타내며, 탈삼진 능력을 평가하는 지표입니다.', 12)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-13-option-1',
  '팀 평균 출루율', false, 0
from public.quiz_questions where source_key = 'quiz-13';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-13-option-2',
  '구단 연봉 총액', false, 1
from public.quiz_questions where source_key = 'quiz-13';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-13-option-3',
  '마운드 높이 영향', false, 2
from public.quiz_questions where source_key = 'quiz-13';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-13-option-4',
  '(삼진 × 9) ÷ 이닝', true, 3
from public.quiz_questions where source_key = 'quiz-13';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-14', 'BB/9은 무엇을 나타내는 지표인가요?', 'BB/9은 9이닝당 허용한 볼넷 수로, 제구력을 평가할 때 사용됩니다.', 13)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-14-option-1',
  '팀 평균 출루율', false, 0
from public.quiz_questions where source_key = 'quiz-14';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-14-option-2',
  '타자의 홈런 비율', false, 1
from public.quiz_questions where source_key = 'quiz-14';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-14-option-3',
  '수비 실책 횟수', false, 2
from public.quiz_questions where source_key = 'quiz-14';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-14-option-4',
  '(볼넷 × 9) ÷ 이닝', true, 3
from public.quiz_questions where source_key = 'quiz-14';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-15', 'HR/9은 무엇을 나타내는 지표인가요?', 'HR/9은 9이닝당 허용한 홈런 수로, 투수의 장타 억제 능력을 판단하는 데 사용됩니다.', 14)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-15-option-1',
  '팀 평균 출루율', false, 0
from public.quiz_questions where source_key = 'quiz-15';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-15-option-2',
  '(피홈런 × 9) ÷ 이닝', true, 1
from public.quiz_questions where source_key = 'quiz-15';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-15-option-3',
  '경기당 투구 수', false, 2
from public.quiz_questions where source_key = 'quiz-15';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-15-option-4',
  '평균 관중 수', false, 3
from public.quiz_questions where source_key = 'quiz-15';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-16', 'BABIP은 무엇을 나타내는 지표인가요?', 'BABIP은 인플레이된 타구가 안타가 될 확률을 측정하며, 운이나 수비력의 영향을 반영하기도 합니다.', 15)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-16-option-1',
  '포수의 송구 능력', false, 0
from public.quiz_questions where source_key = 'quiz-16';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-16-option-2',
  '인플레이 타구 중 안타 비율', true, 1
from public.quiz_questions where source_key = 'quiz-16';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-16-option-3',
  '마무리 투수의 등판 횟수', false, 2
from public.quiz_questions where source_key = 'quiz-16';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-16-option-4',
  '경기당 도루 수', false, 3
from public.quiz_questions where source_key = 'quiz-16';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-17', 'ISO은 무엇을 나타내는 지표인가요?', 'ISO는 장타율에서 타율을 뺀 값으로, 타자의 순수 장타 능력을 파악할 수 있는 지표입니다.', 16)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-17-option-1',
  '팀 평균 출루율', false, 0
from public.quiz_questions where source_key = 'quiz-17';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-17-option-2',
  '장타력(장타율 - 타율)', true, 1
from public.quiz_questions where source_key = 'quiz-17';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-17-option-3',
  '팀의 승률', false, 2
from public.quiz_questions where source_key = 'quiz-17';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-17-option-4',
  '주루 성공률', false, 3
from public.quiz_questions where source_key = 'quiz-17';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-18', 'LOB%은 무엇을 나타내는 지표인가요?', 'LOB%는 투수가 출루한 주자 중 얼마나 득점을 허용하지 않았는지를 나타냅니다.', 17)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-18-option-1',
  '포수의 송구 능력', false, 0
from public.quiz_questions where source_key = 'quiz-18';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-18-option-2',
  '평균 관중 수', false, 1
from public.quiz_questions where source_key = 'quiz-18';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-18-option-3',
  '출루한 주자를 잔루 처리한 비율', true, 2
from public.quiz_questions where source_key = 'quiz-18';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-18-option-4',
  '마무리 투수의 등판 횟수', false, 3
from public.quiz_questions where source_key = 'quiz-18';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-19', 'ERA+은 무엇을 나타내는 지표인가요?', 'ERA+는 평균자책점을 리그와 홈 구장의 특성을 고려하여 보정한 지표입니다. 100이 평균이며, 100 이상이면 평균 이상입니다.', 18)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-19-option-1',
  '리그 및 구장 보정 평균자책점', true, 0
from public.quiz_questions where source_key = 'quiz-19';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-19-option-2',
  '수비 실책 횟수', false, 1
from public.quiz_questions where source_key = 'quiz-19';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-19-option-3',
  '선수의 체력 지수', false, 2
from public.quiz_questions where source_key = 'quiz-19';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-19-option-4',
  '투수 교체 타이밍', false, 3
from public.quiz_questions where source_key = 'quiz-19';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-20', 'OPS+은 무엇을 나타내는 지표인가요?', 'OPS+는 OPS를 리그 평균을 기준으로 보정한 값이며, 100 이상이면 평균 이상의 생산성을 뜻합니다.', 19)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-20-option-1',
  '리그 평균 대비 출루/장타력 지표', true, 0
from public.quiz_questions where source_key = 'quiz-20';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-20-option-2',
  '타자의 홈런 비율', false, 1
from public.quiz_questions where source_key = 'quiz-20';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-20-option-3',
  '팀 평균 출루율', false, 2
from public.quiz_questions where source_key = 'quiz-20';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-20-option-4',
  '구단 연봉 총액', false, 3
from public.quiz_questions where source_key = 'quiz-20';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-21', '파워-스피드 번호(PSN)는 무엇을 결합해 계산하나요?', 'PSN은 홈런(HR)과 도루(SB)를 조화 평균 방식으로 결합한 지표로, 양쪽 능력을 균형 있게 갖춘 선수를 평가합니다.', 20)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-21-option-1',
  '타율과 출루율', false, 0
from public.quiz_questions where source_key = 'quiz-21';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-21-option-2',
  '홈런 수와 도루 수의 조화', true, 1
from public.quiz_questions where source_key = 'quiz-21';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-21-option-3',
  '장타율과 희생번트', false, 2
from public.quiz_questions where source_key = 'quiz-21';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-21-option-4',
  '볼넷과 삼진', false, 3
from public.quiz_questions where source_key = 'quiz-21';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-22', '예상 wOBA(xwOBA)는 무엇을 기반으로 계산되나요?', 'xwOBA는 타격 결과가 아닌 타구의 질(타구 속도, 발사각도 등)을 기반으로 기대 출루율을 예측하는 지표입니다.', 21)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-22-option-1',
  '공격 지표의 평균', false, 0
from public.quiz_questions where source_key = 'quiz-22';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-22-option-2',
  '타구 속도, 발사각, 스프린트 스피드', true, 1
from public.quiz_questions where source_key = 'quiz-22';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-22-option-3',
  '타율과 출루율의 합', false, 2
from public.quiz_questions where source_key = 'quiz-22';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-22-option-4',
  '실제 득점 데이터', false, 3
from public.quiz_questions where source_key = 'quiz-22';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-23', 'Extrapolated Runs(XR)는 어떤 기여를 평가하나요?', 'XR는 여러 타격 요소에 가중치를 부여해 타자가 득점하는 데 기여한 정도를 수치로 평가하는 지표입니다.', 22)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-23-option-1',
  '타자의 득점 창출 기여도', true, 0
from public.quiz_questions where source_key = 'quiz-23';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-23-option-2',
  '투수의 이닝당 탈삼진 능력', false, 1
from public.quiz_questions where source_key = 'quiz-23';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-23-option-3',
  '팀의 평균 출루율', false, 2
from public.quiz_questions where source_key = 'quiz-23';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-23-option-4',
  '수비 실책 횟수', false, 3
from public.quiz_questions where source_key = 'quiz-23';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-24', 'Similarity Score는 어떤 목적으로 사용되나요?', 'Similarity Score는 현재 선수와 과거 또는 다른 선수 간 유사도를 계산해 미래 성과를 예측하는 데 활용됩니다.', 23)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-24-option-1',
  '두 선수의 유사 경력 비교', true, 0
from public.quiz_questions where source_key = 'quiz-24';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-24-option-2',
  '타율과 출루율 비교', false, 1
from public.quiz_questions where source_key = 'quiz-24';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-24-option-3',
  '팀 승률 예측', false, 2
from public.quiz_questions where source_key = 'quiz-24';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-24-option-4',
  '투수의 구속 비교', false, 3
from public.quiz_questions where source_key = 'quiz-24';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-25', 'OpenWAR는 무엇을 목표로 한 WAR 지표인가요?', 'OpenWAR는 데이터 투명성과 계산 방식의 공개성을 강조한 WAR 지표로, 누구나 확인 가능한 방식으로 기여도를 산출합니다.', 24)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-25-option-1',
  '비공개 계산 방식', false, 0
from public.quiz_questions where source_key = 'quiz-25';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-25-option-2',
  '공개된 데이터 기반의 WAR', true, 1
from public.quiz_questions where source_key = 'quiz-25';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-25-option-3',
  '단순화된 타율 평가', false, 2
from public.quiz_questions where source_key = 'quiz-25';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-25-option-4',
  '리그 평균 보정 없이 계산', false, 3
from public.quiz_questions where source_key = 'quiz-25';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-26', '피치 프레이밍은 무엇을 평가합니까?', '피치 프레이밍은 포수가 투수의 공을 효과적으로 잡아 심판이 스트라이크로 판정하도록 유도하는 기술적 능력을 측정합니다.', 25)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-26-option-1',
  '스트라이크 존 판단 유도', true, 0
from public.quiz_questions where source_key = 'quiz-26';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-26-option-2',
  '타자의 스윙 크기', false, 1
from public.quiz_questions where source_key = 'quiz-26';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-26-option-3',
  '수비수의 송구 속도', false, 2
from public.quiz_questions where source_key = 'quiz-26';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-26-option-4',
  '심판의 판정결정 속도', false, 3
from public.quiz_questions where source_key = 'quiz-26';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-27', 'Base-running Runs(BRR)는 무엇을 나타내는 지표인가요?', 'BRR은 주루로 인해 얻은 추가 득점을 계산하여, 주자의 주루 능력이 팀 득점에 얼마나 기여했는지를 나타냅니다.', 26)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-27-option-1',
  '수비 기여도', false, 0
from public.quiz_questions where source_key = 'quiz-27';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-27-option-2',
  '주루로 얻은 득점 기여', true, 1
from public.quiz_questions where source_key = 'quiz-27';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-27-option-3',
  '타격 정확도', false, 2
from public.quiz_questions where source_key = 'quiz-27';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-27-option-4',
  '이닝당 출루율', false, 3
from public.quiz_questions where source_key = 'quiz-27';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-28', 'SIERA는 어떤 유형의 지표인가요?', 'SIERA는 삼진, 홈런, 뜬공 등 여러 요소를 종합해 수비 영향을 최소화하여 투수의 실질 성과를 평가하는 고급 지표입니다.', 27)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-28-option-1',
  '출루율 지표', false, 0
from public.quiz_questions where source_key = 'quiz-28';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-28-option-2',
  '수비 중심 지표', false, 1
from public.quiz_questions where source_key = 'quiz-28';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-28-option-3',
  '투수 평가용 ERA 대체 지표', true, 2
from public.quiz_questions where source_key = 'quiz-28';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-28-option-4',
  '타자 장타 능력 지표', false, 3
from public.quiz_questions where source_key = 'quiz-28';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-29', '피타고리안 승률(Pythagorean Expectation)은 무엇을 예측하나요?', '피타고리안 승률은 팀의 득점과 실점을 기반으로, 실제 승률이 아닌 이론적으로 기대되는 승률을 계산하는 수식입니다.', 28)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-29-option-1',
  '타자의 장타율', false, 0
from public.quiz_questions where source_key = 'quiz-29';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-29-option-2',
  '팀의 이론적 승률', true, 1
from public.quiz_questions where source_key = 'quiz-29';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-29-option-3',
  '투수의 탈삼진 수치', false, 2
from public.quiz_questions where source_key = 'quiz-29';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-29-option-4',
  '타자의 출루율', false, 3
from public.quiz_questions where source_key = 'quiz-29';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-30', 'Win Shares는 어떻게 산정되나요?', 'Win Shares는 팀 승리를 일정 비율로 환산한 후, 선수의 공격·수비·투수 기여도를 고려해 승리에 대한 개인 기여도를 배분한 지표입니다.', 29)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-30-option-1',
  '승리를 세 등분하여 선수에 분배', true, 0
from public.quiz_questions where source_key = 'quiz-30';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-30-option-2',
  '타자의 출루율 비율', false, 1
from public.quiz_questions where source_key = 'quiz-30';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-30-option-3',
  '타석당 득점률', false, 2
from public.quiz_questions where source_key = 'quiz-30';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-30-option-4',
  '타율과 장타율의 합', false, 3
from public.quiz_questions where source_key = 'quiz-30';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-31', 'KBO 리그 최초의 노히트노런을 기록한 선수는 누구인가요?', 'KBO 최초의 노히트노런은 1984년 삼성 라이온즈의 김일융이 기록했습니다. 그는 롯데 자이언츠를 상대로 이 업적을 달성했습니다.', 30)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-31-option-1',
  '선동열', false, 0
from public.quiz_questions where source_key = 'quiz-31';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-31-option-2',
  '김시진', false, 1
from public.quiz_questions where source_key = 'quiz-31';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-31-option-3',
  '김일융', true, 2
from public.quiz_questions where source_key = 'quiz-31';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-31-option-4',
  '박철순', false, 3
from public.quiz_questions where source_key = 'quiz-31';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-32', 'KBO 리그에서 ''피치 클락'' 제도는 무엇을 의미하나요?', '2025년부터 KBO는 피치 클락 제도를 도입하여 투수는 주자 없을 때 20초, 주자 있을 때 25초 이내에 투구를 시작해야 합니다.', 31)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-32-option-1',
  '타자가 타석에 들어설 제한 시간', false, 0
from public.quiz_questions where source_key = 'quiz-32';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-32-option-2',
  '감독이 마운드 방문할 수 있는 시간', false, 1
from public.quiz_questions where source_key = 'quiz-32';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-32-option-3',
  '투수가 일정 시간 안에 투구해야 하는 규정', true, 2
from public.quiz_questions where source_key = 'quiz-32';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-32-option-4',
  '포수가 공을 던져야 하는 시간 제한', false, 3
from public.quiz_questions where source_key = 'quiz-32';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-33', '다음 중 타자의 장타력을 평가하기 위한 지표는 무엇인가요?', 'ISO는 장타율에서 타율을 뺀 값으로, 타자의 순수 장타력을 나타내는 지표입니다.', 32)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-33-option-1',
  'OBP', false, 0
from public.quiz_questions where source_key = 'quiz-33';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-33-option-2',
  'BABIP', false, 1
from public.quiz_questions where source_key = 'quiz-33';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-33-option-3',
  'ISO', true, 2
from public.quiz_questions where source_key = 'quiz-33';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-33-option-4',
  'ERA', false, 3
from public.quiz_questions where source_key = 'quiz-33';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-34', '''인필드 플라이'' 규칙이 적용되는 상황은?', '인필드 플라이는 무사 또는 1사, 주자 1,2루 또는 만루 상황에서 고의 낙구로 병살을 막기 위해 타자를 자동 아웃시키는 규칙입니다.', 33)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-34-option-1',
  '2사 주자 1루일 때 외야 플라이', false, 0
from public.quiz_questions where source_key = 'quiz-34';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-34-option-2',
  '무사 주자 만루일 때 내야 플라이', false, 1
from public.quiz_questions where source_key = 'quiz-34';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-34-option-3',
  '1사 주자 1,2루일 때 내야 플라이', true, 2
from public.quiz_questions where source_key = 'quiz-34';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-34-option-4',
  '2사 주자 2,3루일 때 외야 플라이', false, 3
from public.quiz_questions where source_key = 'quiz-34';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-35', 'KBO 리그의 정규시즌 연장전은 몇 회까지 진행되나요? (2025년 기준)', '2025년 KBO 정규시즌은 연장 11회까지 허용되며, 승부가 나지 않으면 무승부로 처리됩니다.', 34)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-35-option-1',
  '9회', false, 0
from public.quiz_questions where source_key = 'quiz-35';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-35-option-2',
  '10회', false, 1
from public.quiz_questions where source_key = 'quiz-35';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-35-option-3',
  '11회', true, 2
from public.quiz_questions where source_key = 'quiz-35';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-35-option-4',
  '12회', false, 3
from public.quiz_questions where source_key = 'quiz-35';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-36', 'KBO 리그에서 최초로 창단된 팀은 어디인가요?', '1982년 KBO 리그 출범 당시 창단된 팀 중 하나로, OB 베어스는 최초의 KBO 리그 경기에서 첫 홈런을 기록한 김유동 선수를 배출했습니다.', 35)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-36-option-1',
  '삼성 라이온즈', false, 0
from public.quiz_questions where source_key = 'quiz-36';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-36-option-2',
  'OB 베어스', true, 1
from public.quiz_questions where source_key = 'quiz-36';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-36-option-3',
  '해태 타이거즈', false, 2
from public.quiz_questions where source_key = 'quiz-36';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-36-option-4',
  'MBC 청룡', false, 3
from public.quiz_questions where source_key = 'quiz-36';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-37', 'KBO 리그에서 ''콜드게임''은 어떤 상황에서 선언되나요?', 'KBO 리그에서는 5회 이상 경기 후 10점 차 이상일 경우 심판 재량에 따라 콜드게임을 선언할 수 있습니다.', 36)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-37-option-1',
  '경기장이 정전되었을 때', false, 0
from public.quiz_questions where source_key = 'quiz-37';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-37-option-2',
  '5회 이상 진행 후 10점 차 이상일 때', true, 1
from public.quiz_questions where source_key = 'quiz-37';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-37-option-3',
  '심판의 판단으로 경기 취소 시', false, 2
from public.quiz_questions where source_key = 'quiz-37';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-37-option-4',
  '경기 중 심한 부상이 발생했을 때', false, 3
from public.quiz_questions where source_key = 'quiz-37';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-38', 'KBO 리그의 비디오 판독 신청은 한 경기당 감독에게 몇 번 허용되나요? (정규이닝 기준)', 'KBO 리그에서는 감독당 정규이닝 기준 2회의 비디오 판독 요청 기회가 있으며, 성공하면 기회는 유지됩니다.', 37)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-38-option-1',
  '1회', false, 0
from public.quiz_questions where source_key = 'quiz-38';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-38-option-2',
  '2회', true, 1
from public.quiz_questions where source_key = 'quiz-38';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-38-option-3',
  '3회', false, 2
from public.quiz_questions where source_key = 'quiz-38';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-38-option-4',
  '제한 없음', false, 3
from public.quiz_questions where source_key = 'quiz-38';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-39', '''피치 클락'' 위반 시 어떤 판정이 내려지나요?', '피치 클락 위반 시, 타자는 자동 스트라이크, 투수는 자동 볼 판정을 받게 됩니다.', 38)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-39-option-1',
  '자동 아웃', false, 0
from public.quiz_questions where source_key = 'quiz-39';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-39-option-2',
  '타자는 자동 스트라이크, 투수는 자동 볼', true, 1
from public.quiz_questions where source_key = 'quiz-39';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-39-option-3',
  '경기 일시 정지', false, 2
from public.quiz_questions where source_key = 'quiz-39';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-39-option-4',
  '포수가 퇴장됨', false, 3
from public.quiz_questions where source_key = 'quiz-39';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-40', 'KBO 리그에서 경기당 외국인 선수 출전 제한은 어떻게 되나요?', 'KBO 리그는 팀당 외국인 선수 3명까지 보유 가능하며, 경기 출전은 2명으로 제한됩니다.', 39)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-40-option-1',
  '무제한', false, 0
from public.quiz_questions where source_key = 'quiz-40';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-40-option-2',
  '최대 3명 보유, 3명 출전 가능', false, 1
from public.quiz_questions where source_key = 'quiz-40';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-40-option-3',
  '최대 3명 보유, 2명 출전 가능', true, 2
from public.quiz_questions where source_key = 'quiz-40';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-40-option-4',
  '최대 2명 보유, 2명 출전 가능', false, 3
from public.quiz_questions where source_key = 'quiz-40';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-41', 'KBO 리그에서 타자의 타격 성공률을 나타내는 기본적인 지표는 무엇인가요?', '타율은 타자가 타석에서 안타를 기록한 비율을 나타내며, 가장 기본적인 타격 지표입니다.', 40)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-41-option-1',
  'ERA', false, 0
from public.quiz_questions where source_key = 'quiz-41';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-41-option-2',
  '타율', true, 1
from public.quiz_questions where source_key = 'quiz-41';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-41-option-3',
  'WHIP', false, 2
from public.quiz_questions where source_key = 'quiz-41';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-41-option-4',
  'WAR', false, 3
from public.quiz_questions where source_key = 'quiz-41';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-42', 'KBO 리그에서 경기 중 ''수비방해''가 발생했을 때 어떤 판정이 내려지나요?', '야수가 주자의 주루를 방해했을 경우 수비방해가 선언되며, 주자는 자동으로 아웃됩니다.', 41)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-42-option-1',
  '주자는 세이프', false, 0
from public.quiz_questions where source_key = 'quiz-42';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-42-option-2',
  '해당 수비수 퇴장', false, 1
from public.quiz_questions where source_key = 'quiz-42';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-42-option-3',
  '모든 주자는 진루', false, 2
from public.quiz_questions where source_key = 'quiz-42';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-42-option-4',
  '주자는 자동 아웃', true, 3
from public.quiz_questions where source_key = 'quiz-42';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-43', 'KBO 리그에서 ''대주자''는 어떤 역할을 하나요?', '대주자는 이미 출루한 타자 대신 주자로 투입되어 주루만 수행하는 역할을 합니다.', 42)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-43-option-1',
  '수비 전문 교체', false, 0
from public.quiz_questions where source_key = 'quiz-43';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-43-option-2',
  '타자 대체자', false, 1
from public.quiz_questions where source_key = 'quiz-43';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-43-option-3',
  '주자로 나와 주루만 담당', true, 2
from public.quiz_questions where source_key = 'quiz-43';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-43-option-4',
  '감독을 보좌하는 역할', false, 3
from public.quiz_questions where source_key = 'quiz-43';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-44', 'KBO 리그의 ''지명타자(DH)'' 제도는 어떤 목적을 갖고 있나요?', '지명타자 제도는 투수 대신 타자만 기용함으로써 투수의 타격 부담을 줄이기 위한 목적입니다.', 43)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-44-option-1',
  '타자의 체력 안배', false, 0
from public.quiz_questions where source_key = 'quiz-44';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-44-option-2',
  '관객 수 증가', false, 1
from public.quiz_questions where source_key = 'quiz-44';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-44-option-3',
  '투수의 타격 부담 완화', true, 2
from public.quiz_questions where source_key = 'quiz-44';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-44-option-4',
  '주자의 부상 방지', false, 3
from public.quiz_questions where source_key = 'quiz-44';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-45', 'KBO 리그에서 ''홈런''은 몇 점이 될 수 있나요?', '홈런은 주자의 수에 따라 최대 4점(만루 홈런)까지 기록될 수 있습니다.', 44)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-45-option-1',
  '항상 1점', false, 0
from public.quiz_questions where source_key = 'quiz-45';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-45-option-2',
  '최대 3점', false, 1
from public.quiz_questions where source_key = 'quiz-45';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-45-option-3',
  '최대 4점', true, 2
from public.quiz_questions where source_key = 'quiz-45';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-45-option-4',
  '항상 2점', false, 3
from public.quiz_questions where source_key = 'quiz-45';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-46', 'KBO 리그에서 ''삼진 낫아웃'' 상황 시 타자는 언제 1루로 갈 수 있나요?', '포수가 삼진 후 공을 놓쳤을 때 2아웃이거나 1루가 비어 있을 경우 타자는 1루로 달릴 수 있습니다.', 45)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-46-option-1',
  '항상 진루 가능', false, 0
from public.quiz_questions where source_key = 'quiz-46';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-46-option-2',
  '2아웃 또는 1루 비었을 때', true, 1
from public.quiz_questions where source_key = 'quiz-46';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-46-option-3',
  '2루에 주자 있을 때', false, 2
from public.quiz_questions where source_key = 'quiz-46';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-46-option-4',
  '주자가 만루일 때만', false, 3
from public.quiz_questions where source_key = 'quiz-46';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-47', 'KBO 리그의 공식 경기 수는 몇 경기인가요? (2025년 기준)', '2025년 기준 KBO 정규시즌은 팀당 144경기로 구성되어 있습니다.', 46)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-47-option-1',
  '144경기', true, 0
from public.quiz_questions where source_key = 'quiz-47';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-47-option-2',
  '150경기', false, 1
from public.quiz_questions where source_key = 'quiz-47';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-47-option-3',
  '162경기', false, 2
from public.quiz_questions where source_key = 'quiz-47';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-47-option-4',
  '120경기', false, 3
from public.quiz_questions where source_key = 'quiz-47';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-48', 'KBO 리그에서 ''병살타''는 어떤 상황인가요?', '병살타는 타자가 친 타구로 인해 두 명의 주자가 연속으로 아웃되는 상황입니다.', 47)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-48-option-1',
  '한 타석에 두 번 스트라이크', false, 0
from public.quiz_questions where source_key = 'quiz-48';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-48-option-2',
  '두 주자가 동시에 홈으로 진루', false, 1
from public.quiz_questions where source_key = 'quiz-48';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-48-option-3',
  '한 타구로 두 명 아웃', true, 2
from public.quiz_questions where source_key = 'quiz-48';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-48-option-4',
  '한 선수가 두 번 연속 안타', false, 3
from public.quiz_questions where source_key = 'quiz-48';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-49', 'KBO 리그에서 ''희생플라이''는 어떤 조건에서 타점이 인정되나요?', '희생플라이는 타자가 플라이볼을 치고 아웃되더라도 주자가 득점하면 타점이 인정됩니다.', 48)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-49-option-1',
  '주자가 홈에서 아웃될 경우', false, 0
from public.quiz_questions where source_key = 'quiz-49';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-49-option-2',
  '플라이볼 이후 주자가 진루하지 못할 경우', false, 1
from public.quiz_questions where source_key = 'quiz-49';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-49-option-3',
  '플라이볼로 주자가 득점할 경우', true, 2
from public.quiz_questions where source_key = 'quiz-49';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-49-option-4',
  '플라이볼로 2루 진루만 할 경우', false, 3
from public.quiz_questions where source_key = 'quiz-49';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-50', 'KBO 리그에서 ''콜드게임''이 선언되기 위한 최소 조건은?', 'KBO에서는 5회 이후 10점 차 이상이 되면 심판 재량으로 콜드게임을 선언할 수 있습니다.', 49)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-50-option-1',
  '3이닝 이후 10점 차', false, 0
from public.quiz_questions where source_key = 'quiz-50';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-50-option-2',
  '5이닝 이후 10점 차', true, 1
from public.quiz_questions where source_key = 'quiz-50';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-50-option-3',
  '9이닝 이후 5점 차', false, 2
from public.quiz_questions where source_key = 'quiz-50';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-50-option-4',
  '7이닝 이후 15점 차', false, 3
from public.quiz_questions where source_key = 'quiz-50';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-51', 'KBO 리그에서 ''선발 투수''가 승리 투수 요건을 충족하려면 몇 이닝을 던져야 하나요?', '선발 투수가 승리 투수로 인정받기 위해선 최소 5이닝 이상 던지고 팀이 리드를 유지해야 합니다.', 50)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-51-option-1',
  '2이닝', false, 0
from public.quiz_questions where source_key = 'quiz-51';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-51-option-2',
  '4이닝', false, 1
from public.quiz_questions where source_key = 'quiz-51';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-51-option-3',
  '5이닝', true, 2
from public.quiz_questions where source_key = 'quiz-51';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-51-option-4',
  '6이닝', false, 3
from public.quiz_questions where source_key = 'quiz-51';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-52', 'KBO 리그에서 주자가 ''포스 아웃''되는 상황은?', '포스 아웃은 주자가 다음 루로 반드시 진루해야 하는 상황에서, 수비수가 해당 루를 먼저 밟으면 아웃됩니다.', 51)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-52-option-1',
  '주자가 수비를 방해할 때', false, 0
from public.quiz_questions where source_key = 'quiz-52';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-52-option-2',
  '타자의 타구를 맞았을 때', false, 1
from public.quiz_questions where source_key = 'quiz-52';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-52-option-3',
  '주자가 다음 루로 진루 의무가 있을 때 해당 루를 수비가 먼저 밟으면', true, 2
from public.quiz_questions where source_key = 'quiz-52';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-52-option-4',
  '주자가 슬라이딩하지 않았을 때', false, 3
from public.quiz_questions where source_key = 'quiz-52';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-53', 'KBO 리그에서 ''볼넷''은 어떤 결과를 초래하나요?', '볼넷은 투수가 4개의 볼을 던져 타자가 자동으로 1루에 진루하는 상황입니다.', 52)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-53-option-1',
  '타자는 아웃', false, 0
from public.quiz_questions where source_key = 'quiz-53';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-53-option-2',
  '주자 전원 진루', false, 1
from public.quiz_questions where source_key = 'quiz-53';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-53-option-3',
  '타자는 자동으로 1루 진루', true, 2
from public.quiz_questions where source_key = 'quiz-53';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-53-option-4',
  '경기 중단', false, 3
from public.quiz_questions where source_key = 'quiz-53';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-54', 'KBO 리그에서 ''OPS''는 어떤 두 지표의 합인가요?', 'OPS는 출루율과 장타율을 더한 값으로, 타자의 전반적인 공격력을 종합적으로 평가하는 지표입니다.', 53)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-54-option-1',
  '타율 + 도루율', false, 0
from public.quiz_questions where source_key = 'quiz-54';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-54-option-2',
  '출루율 + 장타율', true, 1
from public.quiz_questions where source_key = 'quiz-54';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-54-option-3',
  '삼진율 + 볼넷율', false, 2
from public.quiz_questions where source_key = 'quiz-54';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-54-option-4',
  '타점 + 홈런', false, 3
from public.quiz_questions where source_key = 'quiz-54';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-55', 'KBO 리그의 ''피치 클락'' 위반 시 타자에게 적용되는 판정은?', '피치 클락을 위반하면 타자에게는 자동 스트라이크가 적용됩니다.', 54)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-55-option-1',
  '자동 볼', false, 0
from public.quiz_questions where source_key = 'quiz-55';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-55-option-2',
  '자동 스트라이크', true, 1
from public.quiz_questions where source_key = 'quiz-55';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-55-option-3',
  '자동 아웃', false, 2
from public.quiz_questions where source_key = 'quiz-55';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-55-option-4',
  '타자 퇴장', false, 3
from public.quiz_questions where source_key = 'quiz-55';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-56', 'KBO 리그에서 ''WAR''은 어떤 선수 평가 지표인가요?', 'WAR은 해당 선수가 같은 포지션의 평균적인 대체 선수보다 팀 승리에 얼마나 더 기여했는지를 나타내는 종합 지표입니다.', 55)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-56-option-1',
  '팀 성적', false, 0
from public.quiz_questions where source_key = 'quiz-56';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-56-option-2',
  '대체 선수 대비 승리 기여도', true, 1
from public.quiz_questions where source_key = 'quiz-56';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-56-option-3',
  '평균 관중 수', false, 2
from public.quiz_questions where source_key = 'quiz-56';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-56-option-4',
  '수비 실책률', false, 3
from public.quiz_questions where source_key = 'quiz-56';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-57', 'KBO 리그의 경기 시간 단축을 위해 도입된 제도는?', '경기 시간 단축을 위해 KBO는 피치 클락 제도를 도입해 투수가 일정 시간 안에 투구해야 합니다.', 56)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-57-option-1',
  '스트라이크존 확대', false, 0
from public.quiz_questions where source_key = 'quiz-57';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-57-option-2',
  '피치 클락', true, 1
from public.quiz_questions where source_key = 'quiz-57';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-57-option-3',
  '공 던짐 금지', false, 2
from public.quiz_questions where source_key = 'quiz-57';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-57-option-4',
  '코칭 타임 제한', false, 3
from public.quiz_questions where source_key = 'quiz-57';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-58', 'KBO 리그의 ''수비율''은 무엇을 평가하나요?', '수비율은 수비 기회 중 실책을 제외한 아웃 처리 비율로, 수비수의 안정성을 나타내는 지표입니다.', 57)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-58-option-1',
  '수비수가 뛴 거리', false, 0
from public.quiz_questions where source_key = 'quiz-58';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-58-option-2',
  '수비 성공률', true, 1
from public.quiz_questions where source_key = 'quiz-58';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-58-option-3',
  '수비 에러 수', false, 2
from public.quiz_questions where source_key = 'quiz-58';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-58-option-4',
  '수비 위치 변동', false, 3
from public.quiz_questions where source_key = 'quiz-58';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-59', 'KBO 리그에서 ''지명타자''는 어떤 포지션을 대체하나요?', '지명타자는 투수 대신 타격만을 담당하며 수비에는 참여하지 않습니다.', 58)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-59-option-1',
  '포수', false, 0
from public.quiz_questions where source_key = 'quiz-59';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-59-option-2',
  '1루수', false, 1
from public.quiz_questions where source_key = 'quiz-59';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-59-option-3',
  '투수', true, 2
from public.quiz_questions where source_key = 'quiz-59';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-59-option-4',
  '외야수', false, 3
from public.quiz_questions where source_key = 'quiz-59';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-60', 'KBO 리그에서 ''낫아웃''이 가능한 조건은?', '낫아웃은 삼진 상황에서 포수가 공을 놓쳤을 경우, 2아웃이거나 1루가 비어 있을 때 타자가 1루로 달릴 수 있는 규칙입니다.', 59)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-60-option-1',
  '언제든지 가능', false, 0
from public.quiz_questions where source_key = 'quiz-60';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-60-option-2',
  '2아웃 또는 1루 비어 있을 때', true, 1
from public.quiz_questions where source_key = 'quiz-60';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-60-option-3',
  '주자가 3루에 있을 때', false, 2
from public.quiz_questions where source_key = 'quiz-60';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-60-option-4',
  '선수가 항의할 때', false, 3
from public.quiz_questions where source_key = 'quiz-60';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-61', 'KBO 리그에서 ''페어'' 타구란 어떤 타구인가요?', '페어 타구는 파울 라인 안쪽 또는 라인 위로 떨어진 타구를 말하며, 정식 플레이로 인정됩니다.', 60)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-61-option-1',
  '관중석으로 들어간 타구', false, 0
from public.quiz_questions where source_key = 'quiz-61';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-61-option-2',
  '라인 바깥으로 벗어난 타구', false, 1
from public.quiz_questions where source_key = 'quiz-61';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-61-option-3',
  '라인 안쪽 또는 라인 위로 떨어진 타구', true, 2
from public.quiz_questions where source_key = 'quiz-61';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-61-option-4',
  '글러브에 맞고 튄 타구', false, 3
from public.quiz_questions where source_key = 'quiz-61';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-62', 'KBO 리그에서 ''데드볼''은 어떤 상황을 뜻하나요?', '데드볼은 타자가 투수의 공에 몸에 맞아 자동으로 1루로 진루하는 상황입니다.', 61)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-62-option-1',
  '경기장 정전', false, 0
from public.quiz_questions where source_key = 'quiz-62';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-62-option-2',
  '주자가 슬라이딩하지 않을 때', false, 1
from public.quiz_questions where source_key = 'quiz-62';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-62-option-3',
  '타자가 투수의 공에 맞았을 때', true, 2
from public.quiz_questions where source_key = 'quiz-62';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-62-option-4',
  '수비수가 공을 놓쳤을 때', false, 3
from public.quiz_questions where source_key = 'quiz-62';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-63', 'KBO 리그의 ''콜드게임''이 선언되면 어떤 결과가 되나요?', '콜드게임은 정식 경기로 인정되며, 당시 점수 결과로 경기가 조기 종료됩니다.', 62)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-63-option-1',
  '경기 무효 처리', false, 0
from public.quiz_questions where source_key = 'quiz-63';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-63-option-2',
  '경기 결과 유지 후 종료', true, 1
from public.quiz_questions where source_key = 'quiz-63';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-63-option-3',
  '경기 재개', false, 2
from public.quiz_questions where source_key = 'quiz-63';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-63-option-4',
  '팀 벌점 부과', false, 3
from public.quiz_questions where source_key = 'quiz-63';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-64', 'KBO 리그에서 ''사구''는 어떤 기록으로 분류되나요?', '사구는 투수의 공이 타자의 몸에 맞아 타자가 출루하게 되는 상황으로, 출루 기록에 포함됩니다.', 63)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-64-option-1',
  '안타', false, 0
from public.quiz_questions where source_key = 'quiz-64';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-64-option-2',
  '볼넷', false, 1
from public.quiz_questions where source_key = 'quiz-64';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-64-option-3',
  '몸에 맞는 공', true, 2
from public.quiz_questions where source_key = 'quiz-64';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-64-option-4',
  '실책', false, 3
from public.quiz_questions where source_key = 'quiz-64';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-65', 'KBO 리그에서 ''번트''는 어떤 타격 방식인가요?', '번트는 배트를 가볍게 앞으로 내밀어 공을 살짝 맞춰 내야로 보내는 타격 방식입니다.', 64)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-65-option-1',
  '강하게 밀어치는 타격', false, 0
from public.quiz_questions where source_key = 'quiz-65';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-65-option-2',
  '배트를 잡고 수직으로 휘두르는 타격', false, 1
from public.quiz_questions where source_key = 'quiz-65';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-65-option-3',
  '배트를 들고 가볍게 맞추는 타격', true, 2
from public.quiz_questions where source_key = 'quiz-65';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-65-option-4',
  '회전력을 최대한 활용한 타격', false, 3
from public.quiz_questions where source_key = 'quiz-65';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-66', 'KBO 리그에서 ''유격수''의 위치는 어디인가요?', '유격수는 2루와 3루 사이에 위치하며, 내야 수비에서 중심적인 역할을 수행합니다.', 65)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-66-option-1',
  '1루와 2루 사이', false, 0
from public.quiz_questions where source_key = 'quiz-66';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-66-option-2',
  '2루와 3루 사이', true, 1
from public.quiz_questions where source_key = 'quiz-66';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-66-option-3',
  '홈과 1루 사이', false, 2
from public.quiz_questions where source_key = 'quiz-66';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-66-option-4',
  '외야 오른쪽', false, 3
from public.quiz_questions where source_key = 'quiz-66';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-67', 'KBO 리그에서 ''사이클링 히트''란 어떤 성과인가요?', '사이클링 히트는 1루타, 2루타, 3루타, 홈런을 한 경기에서 모두 기록하는 것을 의미합니다.', 66)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-67-option-1',
  '4타수 4안타', false, 0
from public.quiz_questions where source_key = 'quiz-67';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-67-option-2',
  '한 경기에서 1루타~홈런 모두 기록', true, 1
from public.quiz_questions where source_key = 'quiz-67';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-67-option-3',
  '연속 안타 기록', false, 2
from public.quiz_questions where source_key = 'quiz-67';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-67-option-4',
  '3루타 두 번 이상 기록', false, 3
from public.quiz_questions where source_key = 'quiz-67';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-68', 'KBO 리그에서 ''마무리 투수''의 주요 역할은 무엇인가요?', '마무리 투수는 팀이 리드 중인 경기 후반에 등판하여 승리를 지키는 중요한 역할을 합니다.', 67)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-68-option-1',
  '경기 초반 선발 투수 대기', false, 0
from public.quiz_questions where source_key = 'quiz-68';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-68-option-2',
  '중간 계투 역할 수행', false, 1
from public.quiz_questions where source_key = 'quiz-68';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-68-option-3',
  '경기 후반 리드 상황 마무리', true, 2
from public.quiz_questions where source_key = 'quiz-68';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-68-option-4',
  '타석 대타 출전', false, 3
from public.quiz_questions where source_key = 'quiz-68';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-69', 'KBO 리그에서 ''세이브 상황''이 성립되기 위한 조건은?', '세이브는 3점 차 이내 리드에서 최소 1이닝 이상 투구하며 리드를 지켜야 인정됩니다.', 68)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-69-option-1',
  '5점 차 이하에서 9회 등판', false, 0
from public.quiz_questions where source_key = 'quiz-69';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-69-option-2',
  '3점 차 이내에서 등판해 최소 1이닝 투구', true, 1
from public.quiz_questions where source_key = 'quiz-69';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-69-option-3',
  '6회 이전에 등판한 모든 구원 상황', false, 2
from public.quiz_questions where source_key = 'quiz-69';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-69-option-4',
  '아웃 카운트 1개 이상만 잡으면 됨', false, 3
from public.quiz_questions where source_key = 'quiz-69';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-70', 'KBO 리그에서 ''번트 성공''이 공식 기록으로 남는 조건은?', '주자가 진루하면 타자가 진루하지 못하더라도 희생번트로 인정되어 기록에 남습니다.', 69)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-70-option-1',
  '타자가 번트 후 진루에 성공했을 때만', false, 0
from public.quiz_questions where source_key = 'quiz-70';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-70-option-2',
  '주자를 진루시키기만 해도', true, 1
from public.quiz_questions where source_key = 'quiz-70';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-70-option-3',
  '수비 실책이 발생했을 경우만', false, 2
from public.quiz_questions where source_key = 'quiz-70';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-70-option-4',
  '기록되지 않음', false, 3
from public.quiz_questions where source_key = 'quiz-70';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-71', 'KBO 리그에서 ''낫아웃''은 어떤 경우에 적용되나요?', '낫아웃은 삼진 상황에서 포수가 공을 놓쳤을 때 2아웃이거나 1루가 비어 있으면 타자가 1루로 진루할 수 있는 규칙입니다.', 70)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-71-option-1',
  '1루에 주자가 있고 1아웃일 때', false, 0
from public.quiz_questions where source_key = 'quiz-71';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-71-option-2',
  '2아웃이거나 1루 비었을 때 포수가 삼진 공을 잡지 못한 경우', true, 1
from public.quiz_questions where source_key = 'quiz-71';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-71-option-3',
  '주자가 2루에 있을 때', false, 2
from public.quiz_questions where source_key = 'quiz-71';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-71-option-4',
  '포수가 사인을 잘못 보냈을 때', false, 3
from public.quiz_questions where source_key = 'quiz-71';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-72', 'KBO 리그에서 ''피안타''는 무엇을 의미하나요?', '피안타는 투수가 상대 타자에게 허용한 안타를 의미하며, 투수의 투구 결과 중 하나입니다.', 71)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-72-option-1',
  '투수가 맞은 공', false, 0
from public.quiz_questions where source_key = 'quiz-72';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-72-option-2',
  '투수가 허용한 안타', true, 1
from public.quiz_questions where source_key = 'quiz-72';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-72-option-3',
  '포수가 실수한 공', false, 2
from public.quiz_questions where source_key = 'quiz-72';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-72-option-4',
  '심판이 잘못 본 판정', false, 3
from public.quiz_questions where source_key = 'quiz-72';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-73', 'KBO 리그에서 ''풀카운트''는 어떤 상황을 의미하나요?', '풀카운트는 볼 3개, 스트라이크 2개의 상황으로 다음 투구가 중요한 분기점이 되는 상황입니다.', 72)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-73-option-1',
  '스트라이크 3개', false, 0
from public.quiz_questions where source_key = 'quiz-73';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-73-option-2',
  '볼 4개', false, 1
from public.quiz_questions where source_key = 'quiz-73';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-73-option-3',
  '볼 3개, 스트라이크 2개', true, 2
from public.quiz_questions where source_key = 'quiz-73';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-73-option-4',
  '볼 2개, 스트라이크 2개', false, 3
from public.quiz_questions where source_key = 'quiz-73';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-74', 'KBO 리그에서 ''희생번트''의 목적은 무엇인가요?', '희생번트는 타자가 일부러 아웃되더라도 주자를 다음 루로 진루시키는 것이 목적입니다.', 73)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-74-option-1',
  '타자의 진루', false, 0
from public.quiz_questions where source_key = 'quiz-74';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-74-option-2',
  '주자의 진루', true, 1
from public.quiz_questions where source_key = 'quiz-74';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-74-option-3',
  '득점', false, 2
from public.quiz_questions where source_key = 'quiz-74';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-74-option-4',
  '볼넷 유도', false, 3
from public.quiz_questions where source_key = 'quiz-74';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-75', 'KBO 리그에서 ''삼진''은 어떤 상황인가요?', '삼진은 타자가 스트라이크 3개를 받아 타석에서 아웃되는 상황입니다.', 74)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-75-option-1',
  '3루에서 아웃', false, 0
from public.quiz_questions where source_key = 'quiz-75';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-75-option-2',
  '3개의 스트라이크로 타자 아웃', true, 1
from public.quiz_questions where source_key = 'quiz-75';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-75-option-3',
  '3개의 안타', false, 2
from public.quiz_questions where source_key = 'quiz-75';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-75-option-4',
  '3개의 볼', false, 3
from public.quiz_questions where source_key = 'quiz-75';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-76', 'KBO 리그에서 ''볼넷''이 나오면 어떤 결과가 발생하나요?', '볼넷은 투수가 볼 4개를 던지면 타자는 자동으로 1루로 진루하게 됩니다.', 75)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-76-option-1',
  '타자가 다시 타격', false, 0
from public.quiz_questions where source_key = 'quiz-76';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-76-option-2',
  '타자가 2루 진루', false, 1
from public.quiz_questions where source_key = 'quiz-76';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-76-option-3',
  '타자가 1루 진루', true, 2
from public.quiz_questions where source_key = 'quiz-76';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-76-option-4',
  '아무 일도 없음', false, 3
from public.quiz_questions where source_key = 'quiz-76';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-77', 'KBO 리그에서 ''병살''은 어떤 결과인가요?', '병살은 한 번의 타구로 두 명의 주자가 아웃되는 상황으로 수비 성공의 좋은 예입니다.', 76)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-77-option-1',
  '한 번의 타구로 두 명의 수비수가 충돌', false, 0
from public.quiz_questions where source_key = 'quiz-77';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-77-option-2',
  '한 번의 타구로 두 명의 주자가 아웃', true, 1
from public.quiz_questions where source_key = 'quiz-77';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-77-option-3',
  '한 타자가 두 번 타격', false, 2
from public.quiz_questions where source_key = 'quiz-77';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-77-option-4',
  '두 명의 투수가 교체됨', false, 3
from public.quiz_questions where source_key = 'quiz-77';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-78', 'KBO 리그에서 ''타점''은 언제 기록되나요?', '타점은 타자의 타격으로 주자가 득점에 성공했을 때 타자에게 부여되는 기록입니다.', 77)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-78-option-1',
  '타자가 안타를 칠 때', false, 0
from public.quiz_questions where source_key = 'quiz-78';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-78-option-2',
  '타자가 주자를 홈으로 불러들였을 때', true, 1
from public.quiz_questions where source_key = 'quiz-78';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-78-option-3',
  '타자가 도루했을 때', false, 2
from public.quiz_questions where source_key = 'quiz-78';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-78-option-4',
  '타자가 아웃됐을 때', false, 3
from public.quiz_questions where source_key = 'quiz-78';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-79', 'KBO 리그에서 ''홈런왕''은 어떤 기준으로 선정되나요?', '홈런왕은 한 시즌 동안 가장 많은 홈런을 기록한 선수에게 주어지는 타이틀입니다.', 78)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-79-option-1',
  '가장 많은 안타를 친 선수', false, 0
from public.quiz_questions where source_key = 'quiz-79';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-79-option-2',
  '가장 많은 경기를 뛴 선수', false, 1
from public.quiz_questions where source_key = 'quiz-79';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-79-option-3',
  '가장 많은 홈런을 친 선수', true, 2
from public.quiz_questions where source_key = 'quiz-79';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-79-option-4',
  '가장 많은 타점을 기록한 선수', false, 3
from public.quiz_questions where source_key = 'quiz-79';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-80', 'KBO 리그에서 ''장타율''은 어떤 비율인가요?', '장타율은 타자가 얻은 총 루타수를 타수로 나눈 값으로, 장타력을 나타내는 지표입니다.', 79)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-80-option-1',
  '안타 ÷ 타수', false, 0
from public.quiz_questions where source_key = 'quiz-80';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-80-option-2',
  '루타 ÷ 타수', true, 1
from public.quiz_questions where source_key = 'quiz-80';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-80-option-3',
  '홈런 ÷ 안타', false, 2
from public.quiz_questions where source_key = 'quiz-80';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-80-option-4',
  '2루타 ÷ 타수', false, 3
from public.quiz_questions where source_key = 'quiz-80';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-81', 'KBO 리그에서 ''도루''는 어떤 플레이인가요?', '도루는 투수의 투구 동작 중 주자가 다음 루로 도전적으로 진루하는 플레이입니다.', 80)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-81-option-1',
  '타자가 홈런을 치는 것', false, 0
from public.quiz_questions where source_key = 'quiz-81';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-81-option-2',
  '투수가 공을 던지기 전에 주자가 다음 루로 가는 것', true, 1
from public.quiz_questions where source_key = 'quiz-81';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-81-option-3',
  '포수가 공을 던지는 것', false, 2
from public.quiz_questions where source_key = 'quiz-81';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-81-option-4',
  '타자가 안타를 치고 2루까지 가는 것', false, 3
from public.quiz_questions where source_key = 'quiz-81';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-82', 'KBO 리그에서 ''OPS''는 무엇을 합친 지표인가요?', 'OPS는 출루율과 장타율을 더한 값으로 타자의 종합적인 공격력을 나타내는 지표입니다.', 81)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-82-option-1',
  '타율과 도루율', false, 0
from public.quiz_questions where source_key = 'quiz-82';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-82-option-2',
  '출루율과 장타율', true, 1
from public.quiz_questions where source_key = 'quiz-82';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-82-option-3',
  '삼진율과 볼넷율', false, 2
from public.quiz_questions where source_key = 'quiz-82';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-82-option-4',
  '타점과 홈런', false, 3
from public.quiz_questions where source_key = 'quiz-82';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-83', 'KBO 리그에서 ''사구''는 어떤 상황인가요?', '사구는 투수의 투구가 타자의 몸에 맞아 타자가 1루로 진루하게 되는 상황입니다.', 82)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-83-option-1',
  '투수가 타자의 몸에 공을 맞힌 경우', true, 0
from public.quiz_questions where source_key = 'quiz-83';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-83-option-2',
  '타자가 공을 놓친 경우', false, 1
from public.quiz_questions where source_key = 'quiz-83';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-83-option-3',
  '수비수가 실책한 경우', false, 2
from public.quiz_questions where source_key = 'quiz-83';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-83-option-4',
  '주자가 도루한 경우', false, 3
from public.quiz_questions where source_key = 'quiz-83';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-84', 'KBO 리그에서 ''빠른 교체''는 보통 어떤 상황에서 일어나나요?', '빠른 교체는 투수가 흔들리거나 위기 상황에서 경기 흐름을 바꾸기 위해 감독이 결단을 내리는 경우가 많습니다.', 83)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-84-option-1',
  '팬들의 요청이 있을 때', false, 0
from public.quiz_questions where source_key = 'quiz-84';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-84-option-2',
  '경기 초반 점수가 날 때', false, 1
from public.quiz_questions where source_key = 'quiz-84';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-84-option-3',
  '투수가 부진하거나 위기일 때', true, 2
from public.quiz_questions where source_key = 'quiz-84';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-84-option-4',
  '타자의 홈런 후', false, 3
from public.quiz_questions where source_key = 'quiz-84';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-85', 'KBO 리그에서 ''릴레이 플레이''는 어떤 상황에서 발생하나요?', '릴레이 플레이는 외야수가 잡은 공을 내야수에게 넘기며 빠르게 본루 등으로 송구하는 전략적 수비입니다.', 84)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-85-option-1',
  '내야수가 투수를 교체하는 상황', false, 0
from public.quiz_questions where source_key = 'quiz-85';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-85-option-2',
  '타자가 타순을 바꾸는 경우', false, 1
from public.quiz_questions where source_key = 'quiz-85';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-85-option-3',
  '외야수가 공을 내야로 빠르게 전달하는 수비', true, 2
from public.quiz_questions where source_key = 'quiz-85';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-85-option-4',
  '주자가 실책으로 진루하는 경우', false, 3
from public.quiz_questions where source_key = 'quiz-85';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-86', 'KBO 리그에서 ''고의 4구''는 어떤 전략인가요?', '고의 4구는 특정 타자를 상대하지 않고 자동으로 1루에 보내기 위해 의도적으로 볼넷을 허용하는 전략입니다.', 85)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-86-option-1',
  '타자를 일부러 볼넷으로 보내는 것', true, 0
from public.quiz_questions where source_key = 'quiz-86';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-86-option-2',
  '투수가 실수로 볼을 던지는 것', false, 1
from public.quiz_questions where source_key = 'quiz-86';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-86-option-3',
  '포수가 수비를 포기하는 것', false, 2
from public.quiz_questions where source_key = 'quiz-86';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-86-option-4',
  '심판이 판정을 번복하는 것', false, 3
from public.quiz_questions where source_key = 'quiz-86';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-87', 'KBO 리그에서 ''희생플라이''는 어떤 조건을 충족해야 하나요?', '희생플라이는 플라이볼로 타자가 아웃되더라도 주자가 득점하면 타자에게 타점이 인정됩니다.', 86)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-87-option-1',
  '타자가 홈런을 쳐야 함', false, 0
from public.quiz_questions where source_key = 'quiz-87';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-87-option-2',
  '주자가 3루에 있어야 함', false, 1
from public.quiz_questions where source_key = 'quiz-87';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-87-option-3',
  '타자가 플라이볼로 아웃되더라도 주자가 홈에 들어오면 됨', true, 2
from public.quiz_questions where source_key = 'quiz-87';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-87-option-4',
  '투수가 스트라이크를 던져야 함', false, 3
from public.quiz_questions where source_key = 'quiz-87';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-88', 'KBO 리그에서 ''비디오 판독''은 어떤 상황에서 사용되나요?', '비디오 판독은 홈런 여부, 세이프/아웃, 파울/페어와 같이 경기 결과에 큰 영향을 미치는 상황에서 사용됩니다.', 87)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-88-option-1',
  '모든 볼 판정', false, 0
from public.quiz_questions where source_key = 'quiz-88';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-88-option-2',
  '심판의 스트라이크 콜', false, 1
from public.quiz_questions where source_key = 'quiz-88';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-88-option-3',
  '홈런, 아웃/세이프 등 명확한 상황 판정', true, 2
from public.quiz_questions where source_key = 'quiz-88';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-88-option-4',
  '관중의 요청', false, 3
from public.quiz_questions where source_key = 'quiz-88';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-89', 'KBO 리그에서 ''덕아웃''은 어떤 공간인가요?', '덕아웃은 선수들과 코칭스태프가 경기를 지켜보거나 대기하는 벤치 공간으로, 각 팀에 하나씩 있습니다.', 88)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-89-option-1',
  '선수들이 훈련하는 공간', false, 0
from public.quiz_questions where source_key = 'quiz-89';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-89-option-2',
  '팬들이 모이는 공간', false, 1
from public.quiz_questions where source_key = 'quiz-89';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-89-option-3',
  '선수와 코칭스태프가 대기하는 벤치 공간', true, 2
from public.quiz_questions where source_key = 'quiz-89';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-89-option-4',
  '심판들이 판정하는 공간', false, 3
from public.quiz_questions where source_key = 'quiz-89';

with upserted_question as (
  insert into public.quiz_questions
    (source_key, question, explanation, sort_order)
  values ('quiz-90', 'KBO 리그에서 ''토종 선수''는 어떤 선수를 의미하나요?', '토종 선수는 외국인 선수가 아닌 국내 국적을 가진 KBO 소속 선수를 뜻하는 표현입니다.', 89)
  on conflict (source_key) do update set
    question = excluded.question,
    explanation = excluded.explanation,
    sort_order = excluded.sort_order,
    updated_at = now()
  returning id
)
delete from public.quiz_options
where question_id = (select id from upserted_question);

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-90-option-1',
  'KBO에서만 뛴 선수', false, 0
from public.quiz_questions where source_key = 'quiz-90';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-90-option-2',
  '외국 국적이 아닌 국내 선수', true, 1
from public.quiz_questions where source_key = 'quiz-90';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-90-option-3',
  '지명타자만 하는 선수', false, 2
from public.quiz_questions where source_key = 'quiz-90';

insert into public.quiz_options
  (question_id, source_key, option_text, is_correct, sort_order)
select id, 'quiz-90-option-4',
  '트레이드된 선수', false, 3
from public.quiz_questions where source_key = 'quiz-90';

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-1', '야구는 90%가 정신이고, 나머지 50%는 육체다.', '요기 베라', 0)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-2', '실패를 두려워하지 마라. 그것이 성공의 열쇠다.', '베이브 루스', 1)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-3', '노력은 배신하지 않는다.', '이승엽', 2)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-4', '오늘의 홈런은 내일의 승리를 만든다.', '박찬호', 3)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-5', '포기하지 않는 것이 진짜 승리다.', '류현진', 4)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-6', '야구는 인생과 같다. 매일 배우는 것이다.', '켄 그리피 주니어', 5)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-7', '실패를 두려워하지 말고, 도전하라.', '추신수', 6)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-8', '팀워크가 승리를 만든다.', '김현수', 7)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-9', '기회는 준비된 자에게 온다.', '손아섭', 8)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

insert into public.quotes
  (source_key, quote, author, sort_order)
values ('quote-10', '끝까지 포기하지 않는 것이 진짜 실력이다.', '양현종', 9)
on conflict (source_key) do update set
  quote = excluded.quote,
  author = excluded.author,
  sort_order = excluded.sort_order,
  updated_at = now();

commit;
