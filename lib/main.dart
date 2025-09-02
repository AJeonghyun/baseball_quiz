import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'quiz_page.dart';
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
      title: '⚾️ Play Ball! ⚾️',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
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
      home: const NavigationRoot(),
    );
  }
}

// 네비게이션을 전역에서 관리하는 위젯
class NavigationRoot extends StatefulWidget {
  const NavigationRoot({super.key});
  @override
  State<NavigationRoot> createState() => _NavigationRootState();
}

class _NavigationRootState extends State<NavigationRoot> {
  int _selectedIndex = 0;

  // 홈에서 필요한 상태 변수들
  List<Map<String, dynamic>> quotes = [];
  Map<String, dynamic>? currentQuote;
  String? dailyRuleName;
  String? dailyRuleTrivia;
  Map<String, String>? todayTrivia;

  List<Map<String, dynamic>> triviaList = [];

  // 사전 자동완성용 map: term -> desc
  final Map<String, String> _dictionary = {};

  // 랜덤으로 선택된 사전 항목 (홈에 표시)
  MapEntry<String, String>? _randomDictEntry;

  bool _dictLoaded = false;

  @override
  void initState() {
    super.initState();
    loadQuotes();
    loadTrivia();
    loadDictionary();
  }

  Future<void> loadDictionary() async {
    try {
      final String jsonString =
          await rootBundle.loadString('assets/dictionary.json');
      final Map<String, dynamic> data = json.decode(jsonString);
      _dictionary.clear();
      for (final entry in data.entries) {
        final List<dynamic> list = entry.value;
        for (final item in list) {
          final Map<String, dynamic> m = Map<String, dynamic>.from(item);
          final String term = (m['term'] ?? m['name'] ?? '').toString();
          final String desc = (m['desc'] ?? '').toString();
          if (term.isNotEmpty) _dictionary[term] = desc;
        }
      }
      // 랜덤 항목 선택
      if (_dictionary.isNotEmpty) {
        final keys = _dictionary.keys.toList();
        final k = keys[Random().nextInt(keys.length)];
        _randomDictEntry = MapEntry(k, _dictionary[k]!);
      } else {
        _randomDictEntry = null;
      }
    } catch (e) {
      // 실패해도 앱이 멈추지 않도록
      _dictionary.clear();
      _randomDictEntry = null;
    } finally {
      setState(() => _dictLoaded = true);
    }
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

  Future<void> loadTrivia() async {
    final String jsonString = await rootBundle.loadString('assets/trivia.json');
    final List<dynamic> jsonData = json.decode(jsonString);
    setState(() {
      triviaList = jsonData.cast<Map<String, dynamic>>();
      todayTrivia = triviaList.isNotEmpty
          ? ((triviaList.toList()..shuffle()).first.cast<String, String>())
          : null;
    });
  }

  void _showDictionaryDetail(String term) {
    final desc = _dictionary[term] ?? '설명이 없습니다.';
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(term,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(desc, style: const TextStyle(fontSize: 15)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white),
                onPressed: () => Navigator.pop(context),
                child: const Text('닫기'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    PreferredSizeWidget? appBarWidget;

    final Color primary = Theme.of(context).colorScheme.primary;

    if (_selectedIndex == 0) {
      // 홈 화면(메인)
      appBarWidget = AppBar(
        title: const Text(
          '⚾️ Play Ball! ⚾️',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      );

      bodyWidget = SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // 검색 창 제거 — 대신 dictionary.json에서 뽑은 랜덤 항목 카드 (트리비아 카드 스타일로 변경)
                if (_randomDictEntry != null)
                  Card(
                    color: Colors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () => _showDictionaryDetail(_randomDictEntry!.key),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '오늘의 용어',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _randomDictEntry!.key,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: primary,
                              ),
                            ),
                            if ((_randomDictEntry!.value ?? '').isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  _randomDictEntry!.value,
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
                        setState(() {
                          _selectedIndex = 2; // 트리비아 탭으로 이동
                        });
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
                // 퀴즈 바로가기 카드
                Card(
                  color: Colors.white,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          backgroundColor: Colors.white, // 배경을 흰색으로 고정
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Icon(Icons.lightbulb_circle_rounded,
                                    color: Colors.black, size: 40),
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
                                      backgroundColor: Colors.black,
                                      foregroundColor: Colors.white,
                                      minimumSize: const Size(0, 48),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const QuizPage()),
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
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 22, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '오늘의 퀴즈 도전',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '랜덤 10문제를 풀며 야구 지식을 확인하세요!',
                            style: TextStyle(
                                fontSize: 15,
                                color: Colors.black87,
                                height: 1.5),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                // 앱 안내 카드
                Card(
                  color: Colors.grey.shade100,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                    child: Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.black, size: 28),
                        SizedBox(width: 12),
                        Expanded(
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
              ],
            ),
          ),
        ),
      );
    } else if (_selectedIndex == 1) {
      appBarWidget = null;
      bodyWidget = const BaseballDictionaryPage();
    } else if (_selectedIndex == 2) {
      appBarWidget = null;
      bodyWidget = const BaseballTriviaPage();
    } else {
      appBarWidget = null;
      bodyWidget = const BaseballFieldPositionPage();
    }

    return Scaffold(
      appBar: appBarWidget,
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        onTap: (idx) {
          setState(() {
            _selectedIndex = idx;
            // 홈 진입 시 todayTrivia 갱신
            if (_selectedIndex == 0) {
              todayTrivia = triviaList.isNotEmpty
                  ? Map<String, String>.from(
                      (triviaList.toList()..shuffle()).first)
                  : null;
            }
            // 탭 변경 시마다 dictionary에서 랜덤 항목 갱신
            if (_dictionary.isNotEmpty) {
              final keys = _dictionary.keys.toList();
              final k = keys[Random().nextInt(keys.length)];
              _randomDictEntry = MapEntry(k, _dictionary[k]!);
            } else {
              _randomDictEntry = null;
            }
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: '용어사전',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: '알쓸야잡',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_baseball),
            label: '포지션',
          ),
        ],
      ),
    );
  }
}
