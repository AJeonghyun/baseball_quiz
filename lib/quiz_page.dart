import 'package:flutter/material.dart';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'data/content_repository.dart';
import 'models/content_models.dart';

// 팀 색상 정보 import
import 'result_page.dart'; // 결과 페이지 import
import 'explanation_page.dart'; // 해설 페이지 import

class QuizPage extends StatefulWidget {
  final ContentRepository repository;

  const QuizPage({
    super.key,
    required this.repository,
  });

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<QuizQuestion> questions = [];
  int currentIndex = 0;
  int? selectedOption;
  bool showResult = false;
  bool isCheckingAnswer = false;
  bool? selectedAnswerIsCorrect;
  String answerExplanation = '';
  int correctCount = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final random = Random();
    final List<QuizQuestion> allQuestions =
        await widget.repository.loadQuizQuestions();
    final List<QuizQuestion> selectedQuestions = [];
    final Set<int> usedIndexes = {};

    while (selectedQuestions.length < 10 &&
        usedIndexes.length < allQuestions.length) {
      int idx = random.nextInt(allQuestions.length);
      if (!usedIndexes.contains(idx)) {
        usedIndexes.add(idx);
        selectedQuestions.add(allQuestions[idx]);
      }
    }

    if (!mounted) return;
    setState(() {
      questions = selectedQuestions;
    });
  }

  Future<void> selectOption(int idx) async {
    if (showResult || isCheckingAnswer) return;

    final q = questions[currentIndex];
    setState(() {
      selectedOption = idx;
      isCheckingAnswer = true;
    });

    try {
      final result = await widget.repository.checkQuizAnswer(
        questionId: q.id,
        optionId: q.optionIds[idx],
      );
      if (!mounted) return;

      setState(() {
        isCheckingAnswer = false;
        selectedAnswerIsCorrect = result.isCorrect;
        answerExplanation = result.explanation;
        showResult = true;
        if (result.isCorrect) correctCount++;
      });

      if (result.isCorrect) {
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) showExplanationDialog();
        });
      }
    } catch (_) {
      if (!mounted) return;
      setState(() {
        selectedOption = null;
        isCheckingAnswer = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('정답을 확인하지 못했습니다. 다시 시도해 주세요.')),
      );
    }
  }

  void showExplanationDialog() {
    final isCorrect = selectedAnswerIsCorrect == true;

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
                FaIcon(
                  isCorrect
                      ? FontAwesomeIcons.circleCheck
                      : FontAwesomeIcons.circleXmark,
                  color: isCorrect ? Colors.black : Colors.redAccent,
                  size: 48,
                ),
                const SizedBox(height: 16),
                Text(
                  isCorrect ? "정답입니다!" : "오답입니다.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? Colors.black : Colors.redAccent,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.05),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    answerExplanation.isEmpty ? "설명이 없습니다." : answerExplanation,
                    style: const TextStyle(fontSize: 16, color: Colors.black87),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isCorrect ? Colors.black : Colors.redAccent,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(0, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (isCorrect) {
                        if (currentIndex < questions.length - 1) {
                          nextQuestion();
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultPage(
                                correctCount: correctCount,
                                totalCount: questions.length,
                                teamColor: Colors.black,
                              ),
                            ),
                          );
                        }
                      }
                    },
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
      selectedAnswerIsCorrect = null;
      answerExplanation = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

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
        backgroundColor: Colors.black,
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
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: LinearProgressIndicator(
                      value: (currentIndex + 1) / questions.length,
                      minHeight: 10,
                      backgroundColor: Colors.black.withValues(alpha: 0.15),
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(Colors.black),
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
                  color: Colors.black.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: AutoSizeText(
                  q.question,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontSize: 20,
                    height: 1.5,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
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
                itemCount: q.options.length,
                itemBuilder: (context, idx) {
                  final isSelected = selectedOption == idx;
                  final isCorrectSelection =
                      isSelected && selectedAnswerIsCorrect == true;
                  Color optionColor = Colors.white;
                  BorderSide border =
                      BorderSide(color: Colors.grey.shade300, width: 1.5);
                  if (showResult) {
                    if (isCorrectSelection) {
                      optionColor = Colors.green.shade100;
                      border =
                          const BorderSide(color: Colors.black, width: 2.5);
                    } else if (isSelected) {
                      optionColor = Colors.red.shade100;
                      border = const BorderSide(color: Colors.red, width: 2.5);
                    }
                  } else if (isSelected) {
                    optionColor = Colors.black.withValues(alpha: 0.08);
                    border = const BorderSide(color: Colors.black, width: 2.5);
                  }
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: Material(
                      color: optionColor,
                      borderRadius: BorderRadius.circular(16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: showResult || isCheckingAnswer
                            ? null
                            : () => selectOption(idx),
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
                                    ? Colors.black
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
                                  q.options[idx],
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
            // 오답이고 해설을 아직 안 본 경우 해설보기 버튼과 다음 문제 버튼을 가로로 배치
            if (showResult &&
                selectedOption != null &&
                selectedAnswerIsCorrect == false)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton.icon(
                      icon: const FaIcon(FontAwesomeIcons.lightbulb),
                      label: const Text("해설 보기"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber.shade600,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 48),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ExplanationPage(
                              explanation: answerExplanation.isEmpty
                                  ? "설명이 없습니다."
                                  : answerExplanation,
                              teamColor: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(0, 48),
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
                                    teamColor: Colors.black,
                                  ),
                                ),
                              );
                            },
                      child: Text(currentIndex < questions.length - 1
                          ? "다음 문제"
                          : "퀴즈 종료"),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
