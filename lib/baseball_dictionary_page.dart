import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'baseball_term_detail_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    loadTermsFromJson();
  }

  Future<void> loadTermsFromJson() async {
    final String jsonString =
        await rootBundle.loadString('assets/dictionary.json');
    final Map<String, dynamic> jsonData = json.decode(jsonString);

    // Map<String, List<Map<String, String>>> 형태로 변환
    termsByCategory = {};
    for (final entry in jsonData.entries) {
      final List<dynamic> list = entry.value;
      termsByCategory[entry.key] =
          list.map((e) => Map<String, String>.from(e)).toList();
    }
    allTerms = termsByCategory.values.expand((list) => list).toList();

    _tabController =
        TabController(length: termsByCategory.keys.length, vsync: this);

    setState(() {
      _isLoading = false;
    });
  }

  List<Map<String, String>> getFilteredTerms(String category) {
    final terms = termsByCategory[category] ?? [];
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
        title: Text(
          t["term"] ?? "",
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            t["desc"] ?? "",
            style: const TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => BaseballTermDetailPage(
                term: t["term"] ?? "",
                desc: t["desc"] ?? "",
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    final List<String> categories =
        termsByCategory.keys.toList().cast<String>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('📚 야구 용어 사전 📚'),
        centerTitle: true,
        titleTextStyle: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Pretendard',
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(96),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "용어 또는 설명으로 검색",
                    // 아이콘에 여백을 주어 왼쪽/위쪽으로 띄워서 배치
                    prefixIcon: const Padding(
                      padding:
                          EdgeInsets.only(left: 12.0, top: 6.0, bottom: 6.0),
                      child: FaIcon(FontAwesomeIcons.magnifyingGlass,
                          color: Colors.black),
                    ),
                    // 아이콘 컨테이너 최소 크기 조정(필요 시 변경)
                    prefixIconConstraints:
                        const BoxConstraints(minWidth: 40, minHeight: 40),
                    filled: true,
                    fillColor: const Color.fromARGB(
                        179, 241, 241, 241), // 백그라운드 흰색으로 고정
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 0, horizontal: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      searchText = value.trim();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 44,
                child: TabBar(
                  controller: _tabController,
                  isScrollable: false, // 고정
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.black,
                  labelStyle: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 17),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.normal),
                  tabs: [
                    for (final String cat in categories)
                      SizedBox(
                        width: MediaQuery.of(context).size.width /
                            categories.length,
                        child: Center(
                          child: Text(
                            cat,
                            style: const TextStyle(
                              fontFamily: 'NotoSansKR',
                              fontSize: 15,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 2),
            ],
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          for (final cat in categories)
            getFilteredTerms(cat).isEmpty
                ? const Center(
                    child: Text(
                      "검색 결과가 없습니다.",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  )
                : ListView.builder(
                    padding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                    itemCount: getFilteredTerms(cat).length,
                    itemBuilder: (context, idx) {
                      final t = getFilteredTerms(cat)[idx];
                      return buildTermCard(t);
                    },
                  ),
        ],
      ),
    );
  }
}
