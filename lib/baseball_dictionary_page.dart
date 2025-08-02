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
  String searchText = "";

  late Map<String, List<Map<String, String>>> termsByCategory;
  late List<Map<String, String>> allTerms;

  int selectedCategoryIndex = 0;

  @override
  void initState() {
    super.initState();

    // 카테고리 4개(전체, 타자, 투수, 기타)로 축소
    final Map<String, List<Map<String, String>>> baseTerms = {
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

    allTerms = baseTerms.values.expand((list) => list).toList();
    termsByCategory = {
      "전체": allTerms,
      ...baseTerms,
    };

    _tabController =
        TabController(length: termsByCategory.keys.length, vsync: this);
  }

  List<Map<String, String>> getFilteredTerms(String category) {
    final terms = termsByCategory[category]!;
    if (searchText.isEmpty) return terms;
    return terms
        .where((t) =>
            (t["term"] ?? "").contains(searchText) ||
            (t["desc"] ?? "").contains(searchText))
        .toList();
  }

  Widget buildTermCard(Map<String, String> t) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(vertical: 7, horizontal: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Colors.white,
      child: ListTile(
        contentPadding:
            const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo.shade50,
          child: Icon(Icons.sports_baseball, color: Colors.indigo.shade400),
        ),
        title: Text(
          t["term"] ?? "",
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.indigo),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            t["desc"] ?? "",
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
            color: Colors.amber.shade50,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(6),
          child:
              const Icon(Icons.play_circle_fill, color: Colors.amber, size: 26),
        ),
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
    final List<String> categories =
        termsByCategory.keys.toList().cast<String>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('야구 용어 사전'),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.indigo,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: "용어 또는 설명으로 검색",
                prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                filled: true,
                fillColor: Colors.indigo.withOpacity(0.06),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(fontSize: 16),
              onChanged: (value) {
                setState(() {
                  searchText = value.trim();
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SegmentedButton<String>(
              segments: [
                for (final cat in categories)
                  ButtonSegment(
                    value: cat,
                    label: Text(cat, style: const TextStyle(fontSize: 14)),
                  ),
              ],
              selected: <String>{categories[selectedCategoryIndex]},
              onSelectionChanged: (Set<String> newSelection) {
                setState(() {
                  selectedCategoryIndex =
                      categories.indexOf(newSelection.first);
                });
              },
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.indigo.shade50),
                foregroundColor: MaterialStateProperty.all(Colors.indigo),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                )),
              ),
            ),
          ),
          Expanded(
            child: getFilteredTerms(categories[selectedCategoryIndex]).isEmpty
                ? const Center(
                    child: Text(
                      "검색 결과가 없습니다.",
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    itemCount:
                        getFilteredTerms(categories[selectedCategoryIndex])
                            .length,
                    itemBuilder: (context, idx) {
                      final t = getFilteredTerms(
                          categories[selectedCategoryIndex])[idx];
                      return buildTermCard(t);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
