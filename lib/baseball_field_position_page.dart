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
      "x": 500,
      "y": 550
    },
    {
      "name": "포수",
      "short": "C",
      "desc": "홈플레이트 뒤에서 투수의 공을 받는 포지션.",
      "number": "2",
      "x": 500,
      "y": 700
    },
    {
      "name": "1루수",
      "short": "1B",
      "desc": "1루를 지키는 내야수.",
      "number": "3",
      "x": 780,
      "y": 550
    },
    {
      "name": "2루수",
      "short": "2B",
      "desc": "2루를 지키는 내야수.",
      "number": "4",
      "x": 700,
      "y": 400
    },
    {
      "name": "3루수",
      "short": "3B",
      "desc": "3루를 지키는 내야수.",
      "number": "5",
      "x": 220,
      "y": 550
    },
    {
      "name": "유격수",
      "short": "SS",
      "desc": "2루와 3루 사이를 지키는 내야수.",
      "number": "6",
      "x": 300,
      "y": 400
    },
    {
      "name": "좌익수",
      "short": "LF",
      "desc": "왼쪽 외야를 지키는 외야수.",
      "number": "7",
      "x": 120,
      "y": 250
    },
    {
      "name": "중견수",
      "short": "CF",
      "desc": "가운데 외야를 지키는 외야수.",
      "number": "8",
      "x": 500,
      "y": 180
    },
    {
      "name": "우익수",
      "short": "RF",
      "desc": "오른쪽 외야를 지키는 외야수.",
      "number": "9",
      "x": 880,
      "y": 250
    },
    {
      "name": "지명타자",
      "short": "DH",
      "desc": "수비를 하지 않고 타격만 하는 타자.",
      "number": "D",
      "x": 850,
      "y": 700
    },
  ];

  int? tappedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('야구장 포지션 안내'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final imgWidth = constraints.maxWidth;
          final imgHeight = constraints.maxHeight;
          double scaleX(int x) => x / 1000 * imgWidth;
          double scaleY(int y) => y / 1000 * imgHeight;

          return Stack(
            children: [
              Positioned.fill(
                child: ClipRRect(
                  child: Image.asset(
                    'assets/diamond.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ...positions.asMap().entries.map((entry) {
                final i = entry.key;
                final pos = entry.value;
                return Positioned(
                  left: scaleX(pos["x"]) - 28,
                  top: scaleY(pos["y"]) - 28,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        tappedIndex = i;
                      });
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18)),
                          child: Padding(
                            padding: const EdgeInsets.all(24),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CircleAvatar(
                                  radius: 32,
                                  backgroundColor: Colors.indigo.shade400,
                                  child: Text(
                                    pos["number"] ?? "",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 24,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 18),
                                Text(
                                  pos["name"] ?? "",
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.indigo,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  pos["desc"] ?? "",
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 18),
                                SizedBox(
                                  width: double.infinity,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.indigo,
                                      foregroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    onPressed: () => Navigator.pop(context),
                                    child: const Text('닫기'),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    child: Material(
                      color: Colors.transparent,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 180),
                        curve: Curves.easeInOut,
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.indigo.shade400,
                              Colors.indigo.shade200,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo.withOpacity(0.18),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                          border: Border.all(
                              color: tappedIndex == i
                                  ? Colors.amber
                                  : Colors.white,
                              width: 3),
                        ),
                        child: Center(
                          child: Text(
                            pos["short"] ?? pos["name"] ?? "",
                            style: TextStyle(
                              color: tappedIndex == i
                                  ? Colors.amber
                                  : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              shadows: const [
                                Shadow(
                                  color: Colors.black26,
                                  blurRadius: 4,
                                  offset: Offset(0, 2),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ],
          );
        },
      ),
    );
  }
}
