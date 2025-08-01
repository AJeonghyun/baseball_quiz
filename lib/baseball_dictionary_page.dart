import 'package:flutter/material.dart';
import 'baseball_term_detail_page.dart';

class BaseballDictionaryPage extends StatefulWidget {
  const BaseballDictionaryPage({super.key});

  @override
  State<BaseballDictionaryPage> createState() => _BaseballDictionaryPageState();
}

class _BaseballDictionaryPageState extends State<BaseballDictionaryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final Map<String, List<Map<String, String>>> termsByCategory = {
    "타자": [
      {
        "term": "홈런",
        "desc": "타자가 친 공이 외야 담장을 넘어가는 것. 1점 이상 득점 가능.",
        "youtubeId": "2NNax0aqqqA"
      },
      {
        "term": "볼넷",
        "desc": "투수가 네 번 볼을 던져 타자가 1루로 진루하는 것.",
        "youtubeId": "w8yQJpP6f8k"
      },
      {
        "term": "삼진",
        "desc": "타자가 세 번 스트라이크를 당해 아웃되는 것.",
        "youtubeId": "1Q8fG0TtVAY"
      },
      {
        "term": "타율",
        "desc": "타자가 안타를 친 비율. 안타 ÷ 타수.",
        "youtubeId": "kFvFz2v1Qq4"
      },
      {
        "term": "출루율",
        "desc": "타자가 출루한 비율. (안타 + 볼넷) ÷ 타수.",
        "youtubeId": "2NNax0aqqqA"
      },
      {
        "term": "장타율",
        "desc": "타자가 장타를 친 비율. (1루타 + 2루타*2 + 3루타*3 + 홈런*4) ÷ 타수.",
        "youtubeId": "w8yQJpP6f8k"
      },
      {
        "term": "OPS",
        "desc": "출루율 + 장타율. 타자의 종합적인 타격 능력.",
        "youtubeId": "kFvFz2v1Qq4"
      },
      {
        "term": "타점",
        "desc": "타자가 친 공으로 주자가 득점한 횟수.",
        "youtubeId": "QwZT7T-TXT0"
      },
      {
        "term": "도루",
        "desc": "타자가 투수가 던지는 틈을 타 다음 베이스로 진루하는 것.",
        "youtubeId": "2NNax0aqqqA"
      },
      {
        "term": "병살타",
        "desc": "타자가 친 공으로 두 명의 주자가 아웃되는 것.",
        "youtubeId": "1Q8fG0TtVAY"
      },
      {
        "term": "플라이",
        "desc": "타자가 친 공이 공중으로 뜨는 것. 주자가 진루할 수 있는 상황.",
        "youtubeId": "kFvFz2v1Qq4"
      },
      {
        "term": "안타",
        "desc": "타자가 친 공이 내야를 넘어가거나 외야에 떨어져 주자가 진루하는 것.",
        "youtubeId": "w8yQJpP6f8k"
      },
      {
        "term": "2루타",
        "desc": "타자가 친 공이 2루까지 진루하는 안타.",
        "youtubeId": "QwZT7T-TXT0"
      },
      {
        "term": "3루타",
        "desc": "타자가 친 공이 3루까지 진루하는 안타.",
        "youtubeId": "2NNax0aqqqA"
      },
      {
        "term": "사구",
        "desc": "투수가 공을 던져 타자가 맞거나 몸에 맞아 1루로 진루하는 것.",
        "youtubeId": "kFvFz2v1Qq4"
      },
    ],
    "투수": [
      {
        "term": "ERA",
        "desc": "평균자책점. 투수가 9이닝 동안 허용한 자책점의 평균.",
        "youtubeId": "w8yQJpP6f8k"
      },
      {
        "term": "WHIP",
        "desc": "이닝당 허용한 주자 수. (볼넷+피안타) ÷ 이닝.",
        "youtubeId": "QwZT7T-TXT0"
      },
      {
        "term": "세이브",
        "desc": "투수가 팀의 리드를 지키며 경기를 마무리했을 때 기록.",
        "youtubeId": "2NNax0aqqqA"
      },
      {
        "term": "홀드",
        "desc": "구원 투수가 리드를 지키고 마무리 투수에게 넘겨준 경우.",
        "youtubeId": "1Q8fG0TtVAY"
      },
    ],
    "수비": [
      {
        "term": "실책",
        "desc": "수비수가 평범한 플레이에서 실수하여 주자가 진루한 경우.",
        "youtubeId": "w8yQJpP6f8k"
      },
      {
        "term": "더블플레이",
        "desc": "한 번의 플레이로 두 명의 주자를 아웃시키는 것.",
        "youtubeId": "QwZT7T-TXT0"
      },
      {
        "term": "포스아웃",
        "desc": "주자가 다음 베이스로 진루해야 할 때, 수비가 먼저 베이스를 밟아 아웃시키는 것.",
        "youtubeId": "2NNax0aqqqA"
      },
    ],
    "경기": [
      {
        "term": "이닝",
        "desc": "경기의 한 단위. 각 팀이 한 번씩 공격과 수비를 하는 것.",
        "youtubeId": "kFvFz2v1Qq4"
      },
      {
        "term": "도루",
        "desc": "주자가 투수가 던지는 틈을 타 다음 베이스로 진루하는 것.",
        "youtubeId": "QwZT7T-TXT0"
      },
      {
        "term": "득점",
        "desc": "주자가 홈베이스를 밟아 점수를 얻는 것.",
        "youtubeId": "w8yQJpP6f8k"
      },
    ],
    "기타": [
      {"term": "WAR", "desc": "대체 선수 대비 승리 기여도.", "youtubeId": "2NNax0aqqqA"},
      {
        "term": "OPS",
        "desc": "출루율 + 장타율. 타자의 종합적인 타격 능력.",
        "youtubeId": "kFvFz2v1Qq4"
      },
      {
        "term": "QS",
        "desc": "선발 투수가 6이닝 이상 3자책점 이하로 던진 경기.",
        "youtubeId": "1Q8fG0TtVAY"
      },
    ],
  };

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: termsByCategory.keys.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget buildTermCard(Map<String, String> t) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        title: Text(
          t["term"] ?? "",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.indigo),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            t["desc"] ?? "",
            style: const TextStyle(fontSize: 16, color: Colors.black87),
          ),
        ),
        trailing: const Icon(Icons.play_circle_outline,
            color: Colors.indigo, size: 28),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BaseballTermDetailPage(
                term: t["term"] ?? "",
                desc: t["desc"] ?? "",
                youtubeId: t["youtubeId"] ?? "",
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = termsByCategory.keys.toList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('야구 용어 사전'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Colors.amber,
          labelColor: Colors.amber,
          unselectedLabelColor: Colors.white,
          tabs: [
            for (final cat in categories)
              Tab(
                child: Text(
                  cat,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final cat in categories)
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              itemCount: termsByCategory[cat]!.length,
              itemBuilder: (context, idx) {
                final t = termsByCategory[cat]![idx];
                return buildTermCard(t);
              },
            ),
        ],
      ),
    );
  }
}
