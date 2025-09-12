import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
    if (ratio == 1) return "프로선수";
    if (ratio >= 0.8) return "세미프로";
    if (ratio >= 0.5) return "아마추어";
    return "루키";
  }

  IconData getGradeIcon(String grade) {
    switch (grade) {
      case "프로선수":
        return FontAwesomeIcons.trophy;
      case "세미프로":
        return FontAwesomeIcons.medal;
      case "아마추어":
        return FontAwesomeIcons.award;
      default: // 루키
        return FontAwesomeIcons.graduationCap;
    }
  }

  Color getGradeColor(String grade) {
    switch (grade) {
      case "프로선수":
        return Colors.amber.shade700;
      case "세미프로":
        return Colors.blue.shade600;
      case "아마추어":
        return Colors.green.shade600;
      default: // 루키
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
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              color: Colors.white,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 36, horizontal: 28),
                child: Column(
                  children: [
                    FaIcon(gradeIcon, color: gradeColor, size: 48),
                    const SizedBox(height: 16),
                    Text(
                      "등급: $grade",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: gradeColor,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "$correctCount / $totalCount 정답",
                      style: const TextStyle(
                        fontSize: 18,
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
              icon: const FaIcon(FontAwesomeIcons.house),
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
