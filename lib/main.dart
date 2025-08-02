import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'quiz_page.dart';
import 'kbo_teams.dart';
import 'baseball_dictionary_page.dart';
import 'baseball_field_position_page.dart';
import 'baseball_trivia_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '야구 용어 퀴즈 & 상식',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        fontFamily: 'Pretendard',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: Colors.black,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> quotes = [];
  Map<String, dynamic>? currentQuote;
  int selectedTeam = 0;

  // 🆕 오늘의 규칙/트리비아 state 변수 추가
  String? dailyRuleName;
  String? dailyRuleTrivia;

  Map<String, String>? todayTrivia;

  @override
  void initState() {
    super.initState();
    loadQuotes();

    // 트리비아 샘플 데이터 BaseballTriviaPage에서 가져오기
    final triviaList = BaseballTriviaPage.triviaList;
    todayTrivia = triviaList.isNotEmpty ? (triviaList..shuffle()).first : null;
  }

  Future<void> loadQuotes() async {
    final String jsonString = await rootBundle.loadString('assets/quotes.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      quotes = jsonData.cast<Map<String, dynamic>>();
      currentQuote =
          quotes.isNotEmpty ? quotes[Random().nextInt(quotes.length)] : null;
    });
  }

  void _refreshQuote() {
    setState(() {
      if (quotes.isNotEmpty) {
        currentQuote = quotes[Random().nextInt(quotes.length)];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final teamColor = kboTeams[selectedTeam]["color"] as Color;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '야구 용어 퀴즈 & 상식',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: teamColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 오늘의 규칙 카드 부분만 수정
                if (dailyRuleName != null && dailyRuleTrivia != null)
                  const SizedBox(height: 24),
                // 오늘의 트리비아 카드
                if (todayTrivia != null)
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const BaseballTriviaPage(),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '오늘의 알쓸야잡',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              todayTrivia!['term'] ?? '',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo,
                              ),
                            ),
                            if ((todayTrivia!['shortDesc'] ?? '').isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  todayTrivia!['shortDesc'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            if ((todayTrivia!['trivia'] ?? '').isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  todayTrivia!['trivia'] ?? '',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.black87,
                                    height: 1.5,
                                  ),
                                ),
                              ),
                            const SizedBox(height: 10),
                          ],
                        ),
                      ),
                    ),
                  ),
                const SizedBox(height: 24),
                // 퀴즈 바로가기
                ElevatedButton.icon(
                  icon: const Icon(Icons.quiz, size: 24),
                  label: const Text(
                    '퀴즈 풀기',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teamColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.all(24),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.quiz, color: teamColor, size: 40),
                              const SizedBox(height: 16),
                              const Text(
                                '야구 용어 퀴즈 안내',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 12),
                              const Text(
                                '총 10문제가 랜덤으로 출제됩니다.\n각 문제의 정답을 선택하면 해설과 함께 정답 여부가 표시됩니다.',
                                style: TextStyle(fontSize: 16, height: 1.5),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 24),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: teamColor,
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(0, 48),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.pop(context); // 안내창 닫기
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => QuizPage(
                                              selectedTeam: selectedTeam)),
                                    );
                                  },
                                  child: const Text('퀴즈 시작',
                                      style: TextStyle(fontSize: 18)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                // 야구 용어 사전 바로가기
                ElevatedButton.icon(
                  icon: const Icon(Icons.menu_book, size: 24),
                  label: const Text(
                    '야구 용어 사전',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teamColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BaseballDictionaryPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                // 야구장 포지션 안내 바로가기
                ElevatedButton.icon(
                  icon: const Icon(Icons.sports_baseball, size: 24),
                  label: const Text(
                    '야구장 포지션 안내',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teamColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 56),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BaseballFieldPositionPage(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 24),
                // 앱 안내 카드
                Card(
                  color: Colors.grey.shade100,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: teamColor, size: 28),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Text(
                            '야구 용어와 상식을 재미있게 배워보세요!',
                            style:
                                TextStyle(fontSize: 16, color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // 하단 네비게이션(예시)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
