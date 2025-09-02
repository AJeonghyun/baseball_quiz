import 'package:flutter/material.dart';

class BaseballFieldPositionPage extends StatefulWidget {
  const BaseballFieldPositionPage({super.key});

  @override
  State<BaseballFieldPositionPage> createState() =>
      _BaseballFieldPositionPageState();
}

class _BaseballFieldPositionPageState extends State<BaseballFieldPositionPage> {
  final List<Map<String, dynamic>> positions = [
    {
      "name": "투수",
      "short": "P",
      "desc": "공을 던져 타자를 상대하는 포지션.",
      "number": "1",
    },
    {
      "name": "포수",
      "short": "C",
      "desc": "홈플레이트 뒤에서 투수의 공을 받는 포지션.",
      "number": "2",
    },
    {
      "name": "1루수",
      "short": "1B",
      "desc": "1루를 지키는 내야수.",
      "number": "3",
    },
    {
      "name": "2루수",
      "short": "2B",
      "desc": "2루를 지키는 내야수.",
      "number": "4",
    },
    {
      "name": "3루수",
      "short": "3B",
      "desc": "3루를 지키는 내야수.",
      "number": "5",
    },
    {
      "name": "유격수",
      "short": "SS",
      "desc": "2루와 3루 사이를 지키는 내야수.",
      "number": "6",
    },
    {
      "name": "좌익수",
      "short": "LF",
      "desc": "왼쪽 외야를 지키는 외야수.",
      "number": "7",
    },
    {
      "name": "중견수",
      "short": "CF",
      "desc": "가운데 외야를 지키는 외야수.",
      "number": "8",
    },
    {
      "name": "우익수",
      "short": "RF",
      "desc": "오른쪽 외야를 지키는 외야수.",
      "number": "9",
    },
    {
      "name": "지명타자",
      "short": "DH",
      "desc": "수비를 하지 않고 타격만 하는 타자.",
      "number": "D",
    },
  ];

  // 내야/외야 구분
  List<Map<String, dynamic>> get infieldPositions => positions.where((p) {
        return ['투수', '포수', '1루수', '2루수', '3루수', '유격수', '지명타자']
            .contains(p['name']);
      }).toList();

  List<Map<String, dynamic>> get outfieldPositions => positions.where((p) {
        return ['좌익수', '중견수', '우익수'].contains(p['name']);
      }).toList();

  void _showDetail(Map<String, dynamic> pos) {
    const Color primary = Color(0xFF2563EB); // 모던한 블루 톤 (팀 색 의존성 없음)
    showDialog(
      context: context,
      builder: (_) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
        backgroundColor: Theme.of(context).colorScheme.surface,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: primary,
              child: Text(
                pos['number'] ?? '',
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              pos['name'] ?? '',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              pos['desc'] ?? '',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15, color: Colors.black87),
            ),
            const SizedBox(height: 14),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('닫기'),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildPositionCard(Map<String, dynamic> pos, VoidCallback onTap) {
    const Color primary = Color(0xFF2563EB);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(14),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            child: Row(
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(
                      pos['short'] ?? '',
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    pos['name'] ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                ),
                Icon(Icons.chevron_right, color: Colors.grey.shade400),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    const Color primary = Color(0xFF2563EB);
    final Color bg = Colors.grey.shade50;
    final Color sectionTitle = Colors.grey.shade800;

    return Scaffold(
      appBar: AppBar(
        title: const Text('라인업 안내'),
        centerTitle: true,
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      backgroundColor: bg,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
        child: Column(
          children: [
            // 내야/외야 확장 가능 리스트 (깔끔한 디자인)
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        unselectedWidgetColor: Colors.grey,
                      ),
                      child: ExpansionTile(
                        initiallyExpanded: true,
                        tilePadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        collapsedBackgroundColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        title: Text('내야수',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: sectionTitle)),
                        children: [
                          Column(
                            children: [
                              for (var p in infieldPositions)
                                _buildPositionCard(p, () => _showDetail(p)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Theme(
                      data: Theme.of(context)
                          .copyWith(dividerColor: Colors.transparent),
                      child: ExpansionTile(
                        initiallyExpanded: false,
                        tilePadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        childrenPadding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 6),
                        collapsedBackgroundColor: Colors.transparent,
                        backgroundColor: Colors.transparent,
                        title: Text('외야수',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: sectionTitle)),
                        children: [
                          Column(
                            children: [
                              for (var p in outfieldPositions)
                                _buildPositionCard(p, () => _showDetail(p)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
