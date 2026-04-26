import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'app_ui.dart';

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
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        title: const Text("퀴즈 결과"),
        centerTitle: true,
        backgroundColor: teamColor,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.screen),
          child: Column(
            children: [
              const SizedBox(height: 24),
              AppCard(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 18),
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
                          color: AppPalette.text,
                        ),
                      ),
                      const SizedBox(height: 14),
                      const Text(
                        '틀린 문제는 해설을 다시 읽고 용어사전에서 개념을 확인해보세요.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                          height: 1.45,
                          color: AppPalette.textMuted,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              FilledButton.icon(
                icon: const FaIcon(FontAwesomeIcons.house),
                label: const Text("홈으로"),
                style: FilledButton.styleFrom(
                  minimumSize: const Size(double.infinity, 52),
                ),
                onPressed: () =>
                    Navigator.popUntil(context, (route) => route.isFirst),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
