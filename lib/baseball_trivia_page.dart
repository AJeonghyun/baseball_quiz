import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';

class BaseballTriviaPage extends StatefulWidget {
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

  @override
  State<BaseballTriviaPage> createState() => _BaseballTriviaPageState();
}

class _BaseballTriviaPageState extends State<BaseballTriviaPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Load trivia data from assets/trivia.json
  Future<List<Map<String, dynamic>>> loadTrivia() async {
    final String jsonString = await rootBundle.loadString('assets/trivia.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    // Ensure all entries are Map<String, dynamic>
    return jsonList.cast<Map<String, dynamic>>();
  }

  @override
  Widget build(BuildContext context) {
    // 상세 페이지
    if (widget.ruleName != null && widget.trivia != null) {
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
                  widget.ruleName!,
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
                widget.trivia!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.6,
                ),
              ),
              if (widget.detail != null && widget.detail!.isNotEmpty) ...[
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
                    widget.detail!,
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
                  if (widget.category != null && widget.category!.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEE3D1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        widget.category!,
                        style: const TextStyle(
                          color: Color(0xFFF97B3F),
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  const Spacer(),
                  if (widget.fun != null && widget.fun!.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.star,
                            color: Color(0xFFF9B03F), size: 20),
                        const SizedBox(width: 3),
                        Text(
                          '재미도 ${widget.fun}',
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

    // 전체 트리비아 사전 리스트 (카드형) - load from JSON asset
    return Scaffold(
      resizeToAvoidBottomInset: true, // 이 줄을 추가!
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
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: loadTrivia(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('트리비아 데이터를 불러오는 데 실패했습니다.'));
          }
          final triviaList = snapshot.data ?? [];
          final filteredList = triviaList.where((t) {
            final term = (t['term'] ?? '').toString().toLowerCase();
            final trivia = (t['trivia'] ?? '').toString().toLowerCase();
            final query = _searchQuery.toLowerCase();
            return term.contains(query) || trivia.contains(query);
          }).toList();
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "트리비아를 검색해보세요",
                    prefixIcon: const Icon(Icons.search, color: Colors.indigo),
                    filled: true,
                    fillColor: Colors.indigo.withOpacity(0.08),
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: const TextStyle(
                      color: Color(0xFF8A98B2),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.indigo,
                      fontWeight: FontWeight.w500),
                  cursorColor: Colors.indigo,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value.trim();
                    });
                  },
                ),
              ),
              Expanded(
                child: ListView.separated(
                  padding:
                      const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                  itemCount: filteredList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 18),
                  itemBuilder: (context, idx) {
                    final t = filteredList[idx];
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
                                  if (t['fun'] != null &&
                                      (t['fun'] as String).isNotEmpty)
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
          );
        },
      ),
    );
  }
}
