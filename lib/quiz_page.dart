import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;
import 'package:auto_size_text/auto_size_text.dart';
import 'kbo_teams.dart'; // 팀 색상 정보 import
import 'result_page.dart'; // 결과 페이지 import

class QuizPage extends StatefulWidget {
  final int selectedTeam;
  const QuizPage({super.key, this.selectedTeam = 0});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> questions = [];
  int currentIndex = 0;
  int? selectedOption;
  bool showResult = false;
  int correctCount = 0; // <- 추가
  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String jsonString = await rootBundle.loadString('assets/quiz.json');
    final List<dynamic> jsonData = json.decode(jsonString);

    final random = Random();
    final List<Map<String, dynamic>> allQuestions =
        jsonData.cast<Map<String, dynamic>>();
    final List<Map<String, dynamic>> selectedQuestions = [];
    final Set<int> usedIndexes = {};

    while (selectedQuestions.length < 10 &&
        usedIndexes.length < allQuestions.length) {
      int idx = random.nextInt(allQuestions.length);
      if (!usedIndexes.contains(idx)) {
        usedIndexes.add(idx);
        selectedQuestions.add(allQuestions[idx]);
      }
    }

    setState(() {
      questions = selectedQuestions;
    });
  }

  void selectOption(int idx) {
    final q = questions[currentIndex];
    final isCorrect = idx == q["answer"];

    setState(() {
      selectedOption = idx;
      showResult = true;
      if (isCorrect) correctCount++; // <- 정답 개수 누적
    });

    Future.delayed(const Duration(milliseconds: 300), () {
      showExplanationDialog();
    });
  }

  void showExplanationDialog() {
    final q = questions[currentIndex];
    final bool isCorrect = selectedOption == q["answer"];
    final teamColor = kboTeams[widget.selectedTeam]["color"] as Color;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Material(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  isCorrect ? Icons.check_circle : Icons.cancel,
                  color: isCorrect ? teamColor : Colors.redAccent,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  isCorrect ? "정답입니다!" : "오답입니다.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? teamColor : Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: teamColor.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    q["explanation"] ?? "설명이 없습니다.",
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isCorrect ? teamColor : Colors.redAccent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text("확인", style: TextStyle(fontSize: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void nextQuestion() {
    setState(() {
      currentIndex++;
      selectedOption = null;
      showResult = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final teamColor = kboTeams[widget.selectedTeam]["color"] as Color;

    if (questions.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final q = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('야구 용어 퀴즈',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: teamColor,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 진행 상황 바
            Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '문제 ${currentIndex + 1} / ${questions.length}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: teamColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: (currentIndex + 1) / questions.length,
                      minHeight: 10,
                      backgroundColor: teamColor.withOpacity(0.15),
                      valueColor: AlwaysStoppedAnimation<Color>(teamColor),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
                decoration: BoxDecoration(
                  color: teamColor.withOpacity(0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: AutoSizeText(
                  q["question"],
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: teamColor,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  minFontSize: 14,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: 32),
            Expanded(
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: q["options"].length,
                itemBuilder: (context, idx) {
                  final isSelected = selectedOption == idx;
                  final isAnswer = q["answer"] == idx;
                  Color optionColor = Colors.white;
                  BorderSide border =
                      BorderSide(color: Colors.grey.shade300, width: 1.5);
                  if (showResult) {
                    if (isSelected && isAnswer) {
                      optionColor = Colors.green.shade100;
                      border = BorderSide(color: teamColor, width: 2.5);
                    } else if (isSelected && !isAnswer) {
                      optionColor = Colors.red.shade100;
                      border = const BorderSide(color: Colors.red, width: 2.5);
                    } else if (isAnswer) {
                      optionColor = Colors.green.shade50;
                      border = BorderSide(color: teamColor, width: 2.5);
                    }
                  } else if (isSelected) {
                    optionColor = teamColor.withOpacity(0.08);
                    border = BorderSide(color: teamColor, width: 2.5);
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Material(
                      color: optionColor,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: showResult ? null : () => selectOption(idx),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.fromBorderSide(border),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 18),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 14,
                                backgroundColor: isSelected
                                    ? teamColor
                                    : Colors.grey.shade300,
                                child: Text(
                                  String.fromCharCode(65 + idx), // A, B, C, D
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: AutoSizeText(
                                  q["options"][idx],
                                  style: TextStyle(
                                    fontSize: 16,
                                    height: 1.4,
                                    color: Colors.black87,
                                    fontWeight: isSelected
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                  maxLines: 2,
                                  minFontSize: 12,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            if (showResult)
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: teamColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(120, 48),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: currentIndex < questions.length - 1
                      ? nextQuestion
                      : () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultPage(
                                correctCount: correctCount,
                                totalCount: questions.length,
                                teamColor: teamColor,
                              ),
                            ),
                          );
                        },
                  child: Text(
                      currentIndex < questions.length - 1 ? "다음 문제" : "퀴즈 종료"),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
