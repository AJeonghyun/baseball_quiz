import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:math';
import 'app_ui.dart';
import 'data/content_repository.dart';
import 'models/content_models.dart';
import 'quiz_page.dart';
import 'baseball_dictionary_page.dart';
import 'baseball_field_position_page.dart';
import 'baseball_trivia_page.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  final repository = await ContentRepositoryProvider.create();
  runApp(MyApp(repository: repository));
}

class MyApp extends StatelessWidget {
  final ContentRepository repository;

  const MyApp({
    super.key,
    required this.repository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '⚾️ Play Ball ⚾️',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppPalette.primary,
          primary: AppPalette.primary,
          secondary: AppPalette.accent,
          surface: AppPalette.surface,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: AppPalette.background,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppPalette.background,
          foregroundColor: AppPalette.text,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: FilledButton.styleFrom(
            backgroundColor: AppPalette.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(0, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppPalette.primary,
            foregroundColor: Colors.white,
            minimumSize: const Size(0, 50),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
        ),
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: AppPalette.text,
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: AppPalette.text,
          ),
        ),
      ),
      home: NavigationRoot(repository: repository),
    );
  }
}

// 네비게이션을 전역에서 관리하는 위젯
class NavigationRoot extends StatefulWidget {
  final ContentRepository repository;

  const NavigationRoot({
    super.key,
    required this.repository,
  });

  @override
  State<NavigationRoot> createState() => _NavigationRootState();
}

class _NavigationRootState extends State<NavigationRoot> {
  int _selectedIndex = 0;

  // 홈에서 필요한 상태 변수들
  List<QuoteItem> quotes = [];
  QuoteItem? currentQuote;
  TriviaItem? todayTrivia;

  List<TriviaItem> triviaList = [];

  // 사전 자동완성용 map: term -> desc
  final Map<String, String> _dictionary = {};

  // 랜덤으로 선택된 사전 항목 (홈에 표시)
  MapEntry<String, String>? _randomDictEntry;

  @override
  void initState() {
    super.initState();
    loadQuotes();
    loadTrivia();
    loadDictionary();
    FlutterNativeSplash.remove();
  }

  Future<void> loadDictionary() async {
    try {
      final terms = await widget.repository.loadDictionaryTerms();
      _dictionary.clear();
      for (final term in terms) {
        _dictionary[term.term] = term.description;
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
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> loadQuotes() async {
    final loadedQuotes = await widget.repository.loadQuotes();
    if (!mounted) return;
    setState(() {
      quotes = loadedQuotes;
      currentQuote =
          quotes.isNotEmpty ? quotes[Random().nextInt(quotes.length)] : null;
    });
  }

  Future<void> loadTrivia() async {
    final loadedTrivia = await widget.repository.loadTriviaItems();
    if (!mounted) return;
    setState(() {
      triviaList = loadedTrivia;
      todayTrivia =
          triviaList.isNotEmpty ? (triviaList.toList()..shuffle()).first : null;
    });
  }

  void _showDictionaryDetail(String term) {
    final desc = _dictionary[term] ?? '설명이 없습니다.';
    showDialog(
      context: context,
      builder: (_) => Dialog(
        backgroundColor: AppPalette.surface,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Padding(
          padding: const EdgeInsets.all(22),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                term,
                style: const TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w800,
                  color: AppPalette.primary,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                desc,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.55,
                  color: AppPalette.text,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: FilledButton(
                  onPressed: () => Navigator.pop(context),
                  child: const Text('확인'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _openQuiz() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => QuizPage(repository: widget.repository),
      ),
    );
  }

  void _selectTab(int index) {
    setState(() {
      _selectedIndex = index;
      if (_selectedIndex == 0) {
        todayTrivia = triviaList.isNotEmpty
            ? (triviaList.toList()..shuffle()).first
            : null;
      }
      if (_dictionary.isNotEmpty) {
        final keys = _dictionary.keys.toList();
        final k = keys[Random().nextInt(keys.length)];
        _randomDictEntry = MapEntry(k, _dictionary[k]!);
      } else {
        _randomDictEntry = null;
      }
    });
  }

  Widget _buildHome() {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(
          AppSpacing.screen,
          18,
          AppSpacing.screen,
          28,
        ),
        children: [
          const Text(
            'Play Ball',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: AppPalette.primary,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '오늘의 용어를 익히고 퀴즈로 바로 확인해보세요.',
            style: TextStyle(
              fontSize: 16,
              height: 1.45,
              color: AppPalette.textMuted,
            ),
          ),
          const SizedBox(height: AppSpacing.section),
          AppCard(
            color: AppPalette.primary,
            border: BorderSide.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '오늘의 학습 미션',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '10문제로 야구 감각 점검하기',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    height: 1.25,
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '정답 해설까지 이어지는 짧은 학습 루프입니다.',
                  style: TextStyle(color: Colors.white70, height: 1.45),
                ),
                const SizedBox(height: 18),
                FilledButton.icon(
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: AppPalette.primary,
                  ),
                  onPressed: _openQuiz,
                  icon: const FaIcon(FontAwesomeIcons.play, size: 16),
                  label: const Text('퀴즈 시작'),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.section),
          const AppSectionHeader(
            title: '오늘 익힐 개념',
            subtitle: '먼저 뜻을 보고, 상식과 기록으로 조금씩 넓혀갑니다.',
          ),
          const SizedBox(height: AppSpacing.item),
          if (_randomDictEntry != null)
            AppCard(
              onTap: () => _showDictionaryDetail(_randomDictEntry!.key),
              child: _HomeContentPreview(
                eyebrow: '오늘의 용어',
                title: _randomDictEntry!.key,
                body: _randomDictEntry!.value,
                icon: FontAwesomeIcons.book,
                accent: AppPalette.primary,
              ),
            )
          else
            const AppStatePanel(
              icon: Icons.menu_book_rounded,
              title: '용어를 준비하고 있습니다',
              message: '데이터를 불러오면 오늘의 용어를 보여드릴게요.',
            ),
          const SizedBox(height: AppSpacing.item),
          if (todayTrivia != null)
            AppCard(
              onTap: () => _selectTab(2),
              child: _HomeContentPreview(
                eyebrow: '오늘의 알쓸야잡',
                title: todayTrivia!.term,
                body: todayTrivia!.shortDesc.isNotEmpty
                    ? todayTrivia!.shortDesc
                    : todayTrivia!.trivia,
                icon: FontAwesomeIcons.lightbulb,
                accent: AppPalette.accent,
              ),
            ),
          const SizedBox(height: AppSpacing.section),
          Row(
            children: [
              Expanded(
                child: _QuickLinkCard(
                  title: '용어 찾기',
                  description: '헷갈리는 표현을 바로 검색',
                  icon: FontAwesomeIcons.magnifyingGlass,
                  onTap: () => _selectTab(1),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _QuickLinkCard(
                  title: '기록실',
                  description: '역대 기록과 팀 흐름 보기',
                  icon: FontAwesomeIcons.chartLine,
                  onTap: () => _selectTab(3),
                ),
              ),
            ],
          ),
          if (currentQuote != null) ...[
            const SizedBox(height: AppSpacing.section),
            AppCard(
              color: AppPalette.surfaceMuted,
              border: BorderSide.none,
              child: Text(
                '"${currentQuote!.quote}"\n- ${currentQuote!.author}',
                style: const TextStyle(
                  color: AppPalette.textMuted,
                  fontSize: 14,
                  height: 1.55,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget bodyWidget;
    PreferredSizeWidget? appBarWidget;

    if (_selectedIndex == 0) {
      // 홈 화면(메인)
      appBarWidget = AppBar(
        title: const Text('Play Ball'),
        centerTitle: true,
        backgroundColor: AppPalette.primary,
        foregroundColor: Colors.white,
      );
      bodyWidget = _buildHome();
    } else if (_selectedIndex == 1) {
      appBarWidget = null;
      bodyWidget = BaseballDictionaryPage(repository: widget.repository);
    } else if (_selectedIndex == 2) {
      appBarWidget = null;
      bodyWidget = BaseballTriviaPage(repository: widget.repository);
    } else {
      appBarWidget = null;
      bodyWidget = BaseballFieldPositionPage(repository: widget.repository);
    }

    return Scaffold(
      appBar: appBarWidget,
      body: bodyWidget,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppPalette.surface,
        currentIndex: _selectedIndex,
        selectedItemColor: AppPalette.primary,
        unselectedItemColor: AppPalette.textMuted,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w800),
        onTap: _selectTab,
        items: const [
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.house),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book),
            label: '용어사전',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.bookOpenReader),
            label: '알쓸야잡',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.baseball),
            label: '기록',
          ),
        ],
      ),
    );
  }
}

class _HomeContentPreview extends StatelessWidget {
  final String eyebrow;
  final String title;
  final String body;
  final IconData icon;
  final Color accent;

  const _HomeContentPreview({
    required this.eyebrow,
    required this.title,
    required this.body,
    required this.icon,
    required this.accent,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: accent.withValues(alpha: 0.10),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Center(
            child: FaIcon(icon, color: accent, size: 18),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eyebrow,
                style: TextStyle(
                  color: accent,
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppPalette.text,
                ),
              ),
              if (body.isNotEmpty) ...[
                const SizedBox(height: 8),
                Text(
                  body,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 15,
                    height: 1.45,
                    color: AppPalette.textMuted,
                  ),
                ),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _QuickLinkCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final VoidCallback onTap;

  const _QuickLinkCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FaIcon(icon, color: AppPalette.primary, size: 20),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 16,
              color: AppPalette.text,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            description,
            style: const TextStyle(
              height: 1.35,
              fontSize: 13,
              color: AppPalette.textMuted,
            ),
          ),
        ],
      ),
    );
  }
}
