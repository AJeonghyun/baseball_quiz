import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final int correctCount;
  final int totalCount;
  final Color teamColor;

  const ResultPage({
    super.key,
    required this.correctCount,
    required this.totalCount,
    required this.teamColor,
  });

  String getGrade(int score, int total) {
    final ratio = score / total;
    if (ratio == 1) return "마스터";
    if (ratio >= 0.8) return "고급";
    if (ratio >= 0.5) return "중급";
    return "초급";
  }

  IconData getGradeIcon(String grade) {
    switch (grade) {
      case "마스터":
        return Icons.emoji_events;
      case "고급":
        return Icons.star;
      case "중급":
        return Icons.trending_up;
      default:
        return Icons.school;
    }
  }

  Color getGradeColor(String grade) {
    switch (grade) {
      case "마스터":
        return Colors.amber.shade700;
      case "고급":
        return Colors.blue.shade600;
      case "중급":
        return Colors.green.shade600;
      default:
        return Colors.grey.shade600;
    }
  }

  @override
  Widget build(BuildContext context) {
    final grade = getGrade(correctCount, totalCount);
    final gradeColor = getGradeColor(grade);
    final gradeIcon = getGradeIcon(grade);

    return Scaffold(
      appBar: AppBar(
        title: const Text("퀴즈 결과"),
        centerTitle: true,
        backgroundColor: teamColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // 티켓 카드
            ClipPath(
              clipper: TicketClipper(),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 36, horizontal: 28),
                color: teamColor.withOpacity(0.08),
                child: Column(
                  children: [
                    Icon(gradeIcon, color: gradeColor, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      "등급: $grade",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: gradeColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "$correctCount / $totalCount 정답",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.home),
              label: const Text("홈으로"),
              style: ElevatedButton.styleFrom(
                backgroundColor: teamColor,
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              onPressed: () =>
                  Navigator.popUntil(context, (route) => route.isFirst),
            ),
          ],
        ),
      ),
    );
  }
}

// 🎟️ 티켓 모양을 위한 클리퍼
class TicketClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    const radius = 20.0;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height * 0.4 - radius);
    path.arcToPoint(
      Offset(size.width, size.height * 0.4 + radius),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(size.width, size.height * 0.6 - radius);
    path.arcToPoint(
      Offset(size.width, size.height * 0.6 + radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );
    path.lineTo(size.width, size.height);

    path.lineTo(0, size.height);

    path.lineTo(0, size.height * 0.6 + radius);
    path.arcToPoint(
      Offset(0, size.height * 0.6 - radius),
      radius: const Radius.circular(radius),
      clockwise: true,
    );
    path.lineTo(0, size.height * 0.4 + radius);
    path.arcToPoint(
      Offset(0, size.height * 0.4 - radius),
      radius: const Radius.circular(radius),
      clockwise: false,
    );
    path.lineTo(0, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
