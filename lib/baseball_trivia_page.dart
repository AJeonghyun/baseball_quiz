import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_ui.dart';
import 'data/content_repository.dart';
import 'models/content_models.dart';

class BaseballTriviaPage extends StatefulWidget {
  final ContentRepository repository;
  final String? ruleName;
  final String? trivia;
  final String? detail;
  final String? category;
  final String? fun;

  const BaseballTriviaPage({
    super.key,
    required this.repository,
    this.ruleName,
    this.trivia,
    this.detail,
    this.category,
    this.fun,
  });

  @override
  State<BaseballTriviaPage> createState() => _BaseballTriviaPageState();
}

class _BaseballTriviaPageState extends State<BaseballTriviaPage> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _listScrollController = ScrollController();
  final ScrollController _categoryScrollController = ScrollController();
  String _searchQuery = '';
  String? _selectedCategory;

  late final Future<List<TriviaItem>> _triviaFuture;

  @override
  void initState() {
    super.initState();
    _triviaFuture = widget.repository.loadTriviaItems();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _listScrollController.dispose();
    _categoryScrollController.dispose();
    super.dispose();
  }

  bool get _isDetail => widget.ruleName != null && widget.trivia != null;

  @override
  Widget build(BuildContext context) {
    if (_isDetail) return _buildDetail();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        backgroundColor: AppPalette.accent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              '알쓸야잡',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
            ),
            Text(
              '야구 상식을 이야기로 넓혀보세요',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<TriviaItem>>(
          future: _triviaFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const AppStatePanel(
                icon: Icons.auto_stories_rounded,
                title: '트리비아를 불러오는 중입니다',
                message: '읽기 좋은 야구 이야기를 준비하고 있어요.',
              );
            } else if (snapshot.hasError) {
              return const AppStatePanel(
                icon: Icons.wifi_off_rounded,
                title: '트리비아를 불러오지 못했습니다',
                message: '네트워크 상태를 확인한 뒤 다시 시도해 주세요.',
              );
            }

            final triviaList = snapshot.data ?? const <TriviaItem>[];
            final seenCategories = <String>{};
            final categories = <String>[
              for (final item in triviaList)
                if (item.category.isNotEmpty &&
                    seenCategories.add(item.category))
                  item.category,
            ];

            final filteredList = triviaList.where((item) {
              final query = _searchQuery.toLowerCase();
              final matchesQuery = item.term.toLowerCase().contains(query) ||
                  item.trivia.toLowerCase().contains(query) ||
                  item.shortDesc.toLowerCase().contains(query);
              final matchesCategory = _selectedCategory == null ||
                  item.category == _selectedCategory;
              return matchesQuery && matchesCategory;
            }).toList();

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
                  child: TextField(
                    controller: _searchController,
                    decoration: appSearchDecoration(
                      '트리비아를 검색해보세요',
                      accent: AppPalette.accent,
                    ),
                    style:
                        const TextStyle(fontSize: 16, color: AppPalette.text),
                    cursorColor: AppPalette.accent,
                    onChanged: (value) {
                      setState(() {
                        _searchQuery = value.trim();
                      });
                    },
                  ),
                ),
                if (categories.isNotEmpty)
                  SizedBox(
                    height: 42,
                    child: ListView.separated(
                      key: const PageStorageKey('trivia_category_list'),
                      controller: _categoryScrollController,
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      itemCount: categories.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 8),
                      itemBuilder: (context, index) {
                        final category = categories[index];
                        return AppPill(
                          label: category,
                          selected: _selectedCategory == category,
                          accent: AppPalette.accent,
                          onTap: () {
                            setState(() {
                              _selectedCategory = _selectedCategory == category
                                  ? null
                                  : category;
                            });
                          },
                        );
                      },
                    ),
                  ),
                const SizedBox(height: 8),
                Expanded(
                  child: filteredList.isEmpty
                      ? const AppStatePanel(
                          icon: Icons.search_off_rounded,
                          title: '검색 결과가 없습니다',
                          message: '검색어를 바꾸거나 다른 카테고리를 선택해 보세요.',
                        )
                      : ListView.separated(
                          controller: _listScrollController,
                          padding: const EdgeInsets.fromLTRB(20, 8, 20, 28),
                          itemCount: filteredList.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(height: 12),
                          itemBuilder: (context, index) =>
                              _buildTriviaCard(filteredList[index]),
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetail() {
    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        title: const Text('알쓸야잡'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.screen),
          children: [
            AppCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: AppPalette.accent.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: const Center(
                          child: FaIcon(
                            FontAwesomeIcons.lightbulb,
                            color: AppPalette.accent,
                            size: 18,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.ruleName!,
                          style: const TextStyle(
                            fontSize: 22,
                            height: 1.25,
                            fontWeight: FontWeight.w900,
                            color: AppPalette.text,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Text(
                    widget.trivia!,
                    style: const TextStyle(
                      fontSize: 17,
                      color: AppPalette.text,
                      height: 1.65,
                    ),
                  ),
                  if (widget.detail != null && widget.detail!.isNotEmpty) ...[
                    const SizedBox(height: 22),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppPalette.surfaceMuted,
                        borderRadius: BorderRadius.circular(14),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            '자세히 알아보기',
                            style: TextStyle(
                              color: AppPalette.primary,
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.detail!,
                            style: const TextStyle(
                              fontSize: 15,
                              color: AppPalette.text,
                              height: 1.55,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                  const SizedBox(height: 22),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      if (widget.category != null &&
                          widget.category!.isNotEmpty)
                        AppPill(
                          label: widget.category!,
                          selected: true,
                          accent: AppPalette.accent,
                        ),
                      if (widget.fun != null && widget.fun!.isNotEmpty)
                        AppPill(
                          label: '재미도 ${widget.fun}',
                          selected: true,
                          accent: AppPalette.warning,
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTriviaCard(TriviaItem item) {
    return AppCard(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => BaseballTriviaPage(
              repository: widget.repository,
              ruleName: item.term,
              trivia: item.trivia,
              detail: item.detail,
              category: item.category,
              fun: item.fun,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FaIcon(
                FontAwesomeIcons.lightbulb,
                color: AppPalette.accent,
                size: 18,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  item.term,
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 17,
                    color: AppPalette.text,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.shortDesc.isNotEmpty ? item.shortDesc : item.trivia,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 15,
              color: AppPalette.textMuted,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              if (item.category.isNotEmpty)
                AppPill(
                  label: item.category,
                  selected: true,
                  accent: AppPalette.accent,
                ),
              if (item.fun.isNotEmpty)
                AppPill(
                  label: '재미도 ${item.fun}',
                  selected: true,
                  accent: AppPalette.warning,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
