import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'quiz_page.dart';
import 'team_select_page.dart';
import 'kbo_teams.dart';
import 'animate_card.dart';
import 'baseball_dictionary_page.dart';

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

  @override
  void initState() {
    super.initState();
    loadQuotes();
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
    final teamName = kboTeams[selectedTeam]["name"] as String;

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
      body: quotes.isEmpty || currentQuote == null
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // 팀 대표 카드
                      Card(
                        color: teamColor.withOpacity(0.12),
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 16),
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: teamColor,
                                child: const Icon(Icons.sports_baseball,
                                    color: Colors.white),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  teamName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: teamColor,
                                  ),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () async {
                                  final idx = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => TeamSelectPage(
                                          selectedTeam: selectedTeam),
                                    ),
                                  );
                                  if (idx != null) {
                                    setState(() {
                                      selectedTeam = idx;
                                    });
                                  }
                                },
                                icon: Icon(Icons.edit, color: teamColor),
                                label: Text('변경',
                                    style: TextStyle(color: teamColor)),
                                style: TextButton.styleFrom(
                                  minimumSize: const Size(0, 32),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 2),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      // 오늘의 명언 카드
                      QuoteCard(teamColor: teamColor),
                      const SizedBox(height: 28),
                      // 퀴즈 바로가기
                      ElevatedButton.icon(
                        icon: const Icon(Icons.quiz, size: 24),
                        label: const Text(
                          '퀴즈 풀기',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                                    Icon(Icons.quiz,
                                        color: teamColor, size: 40),
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
                                      style:
                                          TextStyle(fontSize: 16, height: 1.5),
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
                                            borderRadius:
                                                BorderRadius.circular(12),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.pop(context); // 안내창 닫기
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => QuizPage(
                                                    selectedTeam:
                                                        selectedTeam)),
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
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
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
                              builder: (context) =>
                                  const BaseballDictionaryPage(),
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
                              Icon(Icons.info_outline,
                                  color: teamColor, size: 28),
                              const SizedBox(width: 12),
                              const Expanded(
                                child: Text(
                                  '야구 용어와 상식을 재미있게 배워보세요!',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.black87),
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
