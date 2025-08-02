import 'package:flutter/material.dart';

class BaseballTriviaPage extends StatelessWidget {
  final String? ruleName;
  final String? trivia;
  final String? detail;
  final String? category;
  final String? fun;

  const BaseballTriviaPage({
    super.key,
    this.ruleName,
    this.trivia,
    this.detail,
    this.category,
    this.fun,
  });

  // 트리비아 샘플 데이터 (카테고리, 재미도 등 포함)
  static final List<Map<String, String>> triviaList = [
    {
      'category': '역사/기록',
      'term': 'KBO 개막전 첫 홈런',
      'shortDesc': '1982년 3월 27일, OB 김유동',
      'trivia':
          'KBO 역사상 첫 홈런은 1982년 3월 27일 개막전에서 OB 베어스 김유동 선수가 MBC 청룡을 상대로 기록했다. '
              '이 홈런은 한국 프로야구의 시작을 알린 상징적인 장면으로 남아있다.'
    },
    {
      'category': '역사/기록',
      'term': 'KBO 첫 노히트노런',
      'shortDesc': '1984년 5월 14일, 삼성 김일융',
      'trivia': 'KBO 최초의 노히트노런은 1984년 삼성 라이온즈 김일융이 롯데 자이언츠를 상대로 달성했다. '
          '이 기록은 리그 초창기 투수력 우위를 보여주는 상징적인 사건이었다.'
    },
    {
      'category': '역사/기록',
      'term': '최장 경기 시간',
      'shortDesc': '6시간 35분, 2009년 4월 16일',
      'trivia':
          '2009년 4월 16일 사직구장에서 열린 롯데와 삼성의 경기는 연장 12회까지 이어지며 6시간 35분 동안 진행됐다. '
              '이 경기는 KBO 역사상 최장 경기로 기록되었다.'
    },
    {
      'category': '역사/기록',
      'term': '최단 경기 시간',
      'shortDesc': '1시간 39분, 1982년',
      'trivia':
          '1982년 해태 타이거즈와 MBC 청룡의 경기에서 1시간 39분 만에 경기가 종료되며 KBO 최단 경기 기록을 세웠다. '
              '투수전과 빠른 경기 진행이 만들어낸 기록이었다.'
    },
    {
      'category': '역사/기록',
      'term': '첫 한국시리즈 우승팀',
      'shortDesc': '1982년 OB 베어스',
      'trivia': '1982년 한국시리즈에서 OB 베어스가 삼성 라이온즈를 4승 1패로 꺾고 초대 챔피언이 되었다. '
          '이 우승은 프로야구 초창기 팬들의 큰 호응을 불러왔다.'
    },

    // ------------------ 규칙 & 제도 ------------------
    {
      'category': '규칙 & 제도',
      'term': '정규시즌 연장 11회 제한',
      'shortDesc': '2025년부터 연장전은 11회까지만',
      'trivia': 'KBO 정규시즌은 2025년 기준 연장전을 최대 11회까지만 진행하며, '
          '11회 종료 후에도 승부가 나지 않으면 무승부로 처리된다. '
          '선수 보호와 경기 시간 단축을 위한 조치다.'
    },
    {
      'category': '규칙 & 제도',
      'term': '포스트시즌 서스펜디드',
      'shortDesc': '우천 시 이어서 경기',
      'trivia': 'KBO 포스트시즌에서는 우천 등으로 경기가 중단되면 콜드게임이 아닌 서스펜디드로 진행된다. '
          '즉, 다음 날 중단 시점부터 경기를 이어간다.'
    },
    {
      'category': '규칙 & 제도',
      'term': '피치클락(Pitch Clock)',
      'shortDesc': '주자 없으면 20초, 주자 있으면 25초',
      'trivia':
          '2025시즌부터 피치클락이 정식 시행되어 투수는 주자 없을 때 20초, 주자 있을 때 25초 안에 투구를 시작해야 한다. '
              '위반 시 투수는 자동 볼, 타자는 자동 스트라이크 판정을 받는다.'
    },
    {
      'category': '규칙 & 제도',
      'term': '비디오 판독',
      'shortDesc': '감독당 2회, 성공 시 유지',
      'trivia': 'KBO의 비디오 판독은 홈런, 아웃/세이프, 파울/페어, 주루 방해 등 다양한 상황에 적용된다. '
          '감독은 정규이닝 기준 2회까지 신청 가능하며, 성공 시 횟수가 유지된다.'
    },
    {
      'category': '규칙 & 제도',
      'term': '콜드게임 규정',
      'shortDesc': '5회 이상·10점 차 조기 종료',
      'trivia': '정규시즌 경기에서 5회 이상 진행 후 10점 차 이상 벌어지면 심판 재량으로 콜드게임을 선언할 수 있다. '
          '관중·선수 안전과 경기 운영 효율화를 위한 제도다.'
    },
    {
      'category': '규칙 & 제도',
      'term': '포수 마운드 방문 제한',
      'shortDesc': '정규이닝 기준 2회까지',
      'trivia': '포수는 경기당 2회까지만 마운드를 방문할 수 있으며, 연장 진입 시 1회 추가된다. '
          '경기 지연을 방지하기 위한 스피드업 규정이다.'
    },
    {
      'category': '규칙 & 제도',
      'term': '주루 방해 규정',
      'shortDesc': '야수·주자 간 충돌 시 우선권 중요',
      'trivia': '야수는 수비 시 우선권이 있으며, 주자가 방해하면 아웃된다. '
          '반대로 야수가 수비 없이 주로를 막으면 주루 방해로 판정된다.'
    },
    {
      'category': '규칙 & 제도',
      'term': '퓨처스리그 승부치기',
      'shortDesc': '10회부터 1,2루 자동 주자',
      'trivia': '퓨처스리그에서는 10회부터 승부치기를 도입하여 1·2루에 주자를 자동 배치한다. '
          '경기 시간을 단축하고 빠른 승부를 유도하기 위한 제도다.'
    },

    // ------------------ 흥미로운 TMI ------------------
    {
      'category': '흥미로운 TMI',
      'term': '덕아웃 전자기기 금지',
      'shortDesc': '휴대폰·무전기 사용 불가',
      'trivia': 'KBO 리그 규정상 경기 중 덕아웃 내 전자기기 사용은 금지된다. '
          '단, 전력 분석용 리스트밴드나 페이퍼만 제한적으로 허용된다.'
    },
    {
      'category': '흥미로운 TMI',
      'term': '고척돔 천장 그라운드룰',
      'shortDesc': '천장 맞으면 판정 달라짐',
      'trivia': '고척스카이돔에서는 타구가 천장에 닿으면 구간에 따라 판정이 달라진다. '
          '내야 쪽은 파울, 외야 상단 통로 이후는 홈런, 천장에 공이 끼면 2루 진루권이 주어진다.'
    },
    {
      'category': '흥미로운 TMI',
      'term': '1루 오버런',
      'shortDesc': '1루만 자유롭게 오버런 가능',
      'trivia': '타자가 1루를 지나친 후 바로 귀루하면 아웃이 아니지만, '
          '2루 이상에서 오버런 후 태그되면 아웃이다.'
    },
    {
      'category': '흥미로운 TMI',
      'term': '팀당 외국인 선수 3명 제한',
      'shortDesc': '최대 3명 보유·2명 출전',
      'trivia': 'KBO는 팀당 외국인 선수 최대 3명 보유가 가능하며, 보통 투수 2명+타자 1명으로 구성된다. '
          '리그 균형과 국내 선수 성장 기회를 위한 제한이다.'
    },
    {
      'category': '흥미로운 TMI',
      'term': '야구공 무게와 구조',
      'shortDesc': '공인구는 148g, 말가죽으로 덮음',
      'trivia': 'KBO 공인구는 약 148g이며, 코르크 심에 실을 감고 흰색 말가죽으로 덮는다. '
          '심판은 경기 전 봉인된 공을 직접 확인한다.'
    },
    {
      'category': '흥미로운 TMI',
      'term': '헤드퍼스트 슬라이딩',
      'shortDesc': '부상 위험 커서 권장하지 않음',
      'trivia': '헤드퍼스트 슬라이딩은 허용되지만 손목·어깨 부상 위험이 크다. '
          'KBO와 각 구단은 가급적 피할 것을 권장한다.'
    },
    {
      'category': '흥미로운 TMI',
      'term': '올스타전 승부치기',
      'shortDesc': '10회부터 승부치기 도입',
      'trivia': 'KBO 올스타전은 10회부터 승부치기를 도입하여 빠른 승부를 유도한다. '
          '팬들에게 흥미로운 볼거리를 제공하기 위한 규정이다.'
    },
    {
      'category': '흥미로운 TMI',
      'term': '은퇴경기 특별 등록',
      'shortDesc': '은퇴 선수는 당일만 등록 가능',
      'trivia': '은퇴경기를 치르는 선수는 정원 초과 등록이 허용되며, 경기가 끝나면 자동 말소된다. '
          '경기가 취소되면 1회에 한해 재등록할 수 있다.'
    }
    // ...더 추가 가능...
  ];

  @override
  Widget build(BuildContext context) {
    // 상세 페이지
    if (ruleName != null && trivia != null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F7F7),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              const Icon(Icons.lightbulb_outline,
                  color: Color(0xFFF97B3F), size: 26),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  ruleName!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 19,
                    color: Colors.black87,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.close, color: Colors.black54),
              onPressed: () => Navigator.pop(context),
              tooltip: '닫기',
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                trivia!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              if (detail != null && detail!.isNotEmpty) ...[
                const SizedBox(height: 22),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFF4F8F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '자세히 알아보기',
                        style: TextStyle(
                          color: Color(0xFF2D6A2D),
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      SizedBox(height: 6),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, top: 2),
                  child: Text(
                    detail!,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
              const Spacer(),
              Row(
                children: [
                  if (category != null && category!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEE3D1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        category!,
                        style: const TextStyle(
                          color: Color(0xFFF97B3F),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (fun != null && fun!.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFF9B03F), size: 20),
                        const SizedBox(width: 3),
                        Text(
                          '재미도 $fun',
                          style: const TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 18),
            ],
          ),
        ),
      );
    }

    // 전체 트리비아 사전 리스트 (카드형)
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF97B3F),
        foregroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Column(
          children: [
            Text('⚡️ 알쓸야잡'),
            Text('알아두면 쓸데없는 야구 잡학사전',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
              itemCount: triviaList.length,
              separatorBuilder: (_, __) => const SizedBox(height: 18),
              itemBuilder: (context, idx) {
                final t = triviaList[idx];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BaseballTriviaPage(
                          ruleName: t['term'],
                          trivia: t['trivia'],
                          detail: t['detail'],
                          category: t['category'],
                          fun: t['fun'],
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.04),
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.lightbulb_outline,
                                  color: Color(0xFFF97B3F), size: 22),
                              const SizedBox(width: 7),
                              Expanded(
                                child: Text(
                                  t['term'] ?? '',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            t['trivia'] ?? '',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 3, horizontal: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFEE3D1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  t['category'] ?? '',
                                  style: const TextStyle(
                                    color: Color(0xFFF97B3F),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const Spacer(),
                              if (t['fun'] != null)
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Color(0xFFF9B03F), size: 18),
                                    const SizedBox(width: 3),
                                    Text(
                                      '재미도 ${t['fun']}',
                                      style: const TextStyle(
                                        color: Colors.black54,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13,
                                      ),
                                    ),
                                  ],
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
