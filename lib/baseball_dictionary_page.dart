import 'package:flutter/material.dart';

import 'app_ui.dart';
import 'baseball_term_detail_page.dart';
import 'data/content_repository.dart';
import 'models/content_models.dart';

class BaseballDictionaryPage extends StatefulWidget {
  final ContentRepository repository;

  const BaseballDictionaryPage({
    super.key,
    required this.repository,
  });

  @override
  State<BaseballDictionaryPage> createState() => _BaseballDictionaryPageState();
}

class _BaseballDictionaryPageState extends State<BaseballDictionaryPage> {
  String searchText = '';
  String? selectedCategory;
  Map<String, List<DictionaryTerm>> termsByCategory = {};
  bool _isLoading = true;
  Object? _loadError;

  @override
  void initState() {
    super.initState();
    loadTerms();
  }

  Future<void> loadTerms() async {
    setState(() {
      _isLoading = true;
      _loadError = null;
    });

    try {
      final terms = await widget.repository.loadDictionaryTerms();
      if (!mounted) return;

      final loadedTermsByCategory = <String, List<DictionaryTerm>>{};
      for (final term in terms) {
        loadedTermsByCategory.putIfAbsent(term.category, () => []).add(term);
      }

      setState(() {
        termsByCategory = loadedTermsByCategory;
        selectedCategory = loadedTermsByCategory.isEmpty
            ? null
            : loadedTermsByCategory.keys.first;
        _isLoading = false;
      });
    } catch (error) {
      if (!mounted) return;
      setState(() {
        _loadError = error;
        _isLoading = false;
      });
    }
  }

  List<DictionaryTerm> get filteredTerms {
    final category = selectedCategory;
    final source = category == null
        ? termsByCategory.values.expand((terms) => terms).toList()
        : termsByCategory[category] ?? const <DictionaryTerm>[];

    if (searchText.isEmpty) return source;
    return source
        .where((term) =>
            term.term.contains(searchText) ||
            term.description.contains(searchText))
        .toList();
  }

  Widget buildTermCard(DictionaryTerm term) {
    return AppCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BaseballTermDetailPage(
              term: term.term,
              desc: term.description,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  term.term,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 18,
                    color: AppPalette.text,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right_rounded,
                color: AppPalette.textMuted,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            term.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              height: 1.45,
              color: AppPalette.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final categories = termsByCategory.keys.toList();

    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        title: const Text('야구 용어 사전'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _buildBody(categories),
      ),
    );
  }

  Widget _buildBody(List<String> categories) {
    if (_isLoading) {
      return const AppStatePanel(
        icon: Icons.menu_book_rounded,
        title: '용어를 불러오는 중입니다',
        message: '야구 표현을 정리하고 있어요.',
      );
    }

    if (_loadError != null) {
      return AppStatePanel(
        icon: Icons.wifi_off_rounded,
        title: '용어를 불러오지 못했습니다',
        message: '네트워크 상태를 확인한 뒤 다시 시도해 주세요.',
        actionLabel: '다시 시도',
        onAction: loadTerms,
      );
    }

    if (categories.isEmpty) {
      return const AppStatePanel(
        icon: Icons.search_off_rounded,
        title: '표시할 용어가 없습니다',
        message: 'Supabase에 용어 데이터가 추가되면 이곳에 표시됩니다.',
      );
    }

    final terms = filteredTerms;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
          child: TextField(
            decoration: appSearchDecoration('용어 또는 설명으로 검색'),
            style: const TextStyle(fontSize: 16, color: AppPalette.text),
            cursorColor: AppPalette.primary,
            onChanged: (value) {
              setState(() {
                searchText = value.trim();
              });
            },
          ),
        ),
        SizedBox(
          height: 42,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            itemCount: categories.length,
            separatorBuilder: (_, __) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              final category = categories[index];
              return AppPill(
                label: category,
                selected: selectedCategory == category,
                onTap: () => setState(() => selectedCategory = category),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: terms.isEmpty
              ? const AppStatePanel(
                  icon: Icons.manage_search_rounded,
                  title: '검색 결과가 없습니다',
                  message: '검색어를 바꾸거나 다른 카테고리를 선택해 보세요.',
                )
              : ListView.separated(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                  itemCount: terms.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) => buildTermCard(terms[index]),
                ),
        ),
      ],
    );
  }
}
