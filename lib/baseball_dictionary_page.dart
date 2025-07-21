import 'package:flutter/material.dart';
import 'baseball_term_detail_page.dart';

class BaseballDictionaryPage extends StatelessWidget {
  const BaseballDictionaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 예시 용어 데이터 (youtubeId 추가)
    final terms = [
      {
        "term": "홈런",
        "desc": "타자가 친 공이 외야 담장을 넘어가는 것. 1점 이상 득점 가능.",
        "youtubeId": "2NNax0aqqqA"
      },
      {
        "term": "삼진",
        "desc": "타자가 세 번 스트라이크를 당해 아웃되는 것.",
        "youtubeId": "1Q8fG0TtVAY"
      },
      {
        "term": "볼넷",
        "desc": "투수가 네 번 볼을 던져 타자가 1루로 진루하는 것.",
        "youtubeId": "w8yQJpP6f8k"
      },
      {
        "term": "도루",
        "desc": "주자가 투수가 던지는 틈을 타 다음 베이스로 진루하는 것.",
        "youtubeId": "QwZT7T-TXT0"
      },
      // ... 더 추가 가능
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('야구 용어 사전'),
        centerTitle: true,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: terms.length,
        separatorBuilder: (_, __) => const Divider(height: 32),
        itemBuilder: (context, idx) {
          final t = terms[idx];
          return ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(
              t["term"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.indigo,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                t["desc"]!,
                style: const TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => BaseballTermDetailPage(
                    term: t["term"]!,
                    desc: t["desc"]!,
                    youtubeId: t["youtubeId"]!,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
