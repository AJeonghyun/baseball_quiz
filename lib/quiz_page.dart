import 'package:flutter/material.dart';
import 'dart:math';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'app_ui.dart';
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
  bool showExplanation = false; // 추가: 설명 표시 여부
  int correctCount = 0; // <- 추가
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

  void selectOption(int idx) {
    final q = questions[currentIndex];
    final isCorrect = idx == q.answer;

    setState(() {
      selectedOption = idx;
      showResult = true;
      showExplanation = !isCorrect; // 오답일 때만 설명 표시
      if (isCorrect) correctCount++;
    });

    if (isCorrect) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!mounted) return;
        showExplanationDialog();
      });
    }
  }

  void showExplanationDialog() {
    final q = questions[currentIndex];
    final bool isCorrect = selectedOption == q.answer;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        child: Material(
          color: AppPalette.surface,
          borderRadius: BorderRadius.circular(18),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 28, horizontal: 22),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                FaIcon(
                  isCorrect
                      ? FontAwesomeIcons.circleCheck
                      : FontAwesomeIcons.circleXmark,
                  color: isCorrect ? AppPalette.success : AppPalette.error,
                  size: 42,
                ),
                const SizedBox(height: 16),
                Text(
                  isCorrect ? "정답입니다!" : "오답입니다.",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: isCorrect ? AppPalette.success : AppPalette.error,
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppPalette.surfaceMuted,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Text(
                    q.explanation.isEmpty ? "설명이 없습니다." : q.explanation,
                    style: const TextStyle(
                      fontSize: 16,
                      height: 1.55,
                      color: AppPalette.text,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isCorrect ? AppPalette.success : AppPalette.error,
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
                        // 정답이면 다음 문제로 이동하거나 마지막이면 결과 페이지로 이동
                        if (currentIndex < questions.length - 1) {
                          nextQuestion();
                        } else {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (_) => ResultPage(
                                correctCount: correctCount,
                                totalCount: questions.length,
                                teamColor: AppPalette.primary,
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
      showExplanation = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    if (questions.isEmpty) {
      return const Scaffold(
        backgroundColor: AppPalette.background,
        body: AppStatePanel(
          icon: Icons.quiz_rounded,
          title: '퀴즈를 준비하는 중입니다',
          message: 'Supabase에서 문제를 불러오고 있어요.',
        ),
      );
    }

    final q = questions[currentIndex];

    return Scaffold(
      backgroundColor: AppPalette.background,
      appBar: AppBar(
        title: const Text('야구 용어 퀴즈'),
        centerTitle: true,
        backgroundColor: AppPalette.primary,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                        color: AppPalette.text,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: LinearProgressIndicator(
                        value: (currentIndex + 1) / questions.length,
                        minHeight: 10,
                        backgroundColor:
                            AppPalette.primary.withValues(alpha: 0.14),
                        valueColor: const AlwaysStoppedAnimation<Color>(
                            AppPalette.primary),
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
                    color: AppPalette.surface,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: AppPalette.border),
                  ),
                  child: AutoSizeText(
                    q.question,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontSize: 20,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                      color: AppPalette.text,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 4,
                    minFontSize: 12,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: q.options.length,
                  itemBuilder: (context, idx) {
                    final isSelected = selectedOption == idx;
                    final isAnswer = q.answer == idx;
                    Color optionColor = Colors.white;
                    BorderSide border = const BorderSide(
                      color: AppPalette.border,
                      width: 1.4,
                    );
                    if (showResult) {
                      if (isSelected && isAnswer) {
                        optionColor = AppPalette.successSoft;
                        border = const BorderSide(
                            color: AppPalette.success, width: 2);
                      } else if (isSelected && !isAnswer) {
                        optionColor = AppPalette.errorSoft;
                        border =
                            const BorderSide(color: AppPalette.error, width: 2);
                      } else if (isAnswer) {
                        optionColor = AppPalette.successSoft;
                        border = const BorderSide(
                            color: AppPalette.success, width: 2);
                      }
                    } else if (isSelected) {
                      optionColor = AppPalette.primary.withValues(alpha: 0.08);
                      border =
                          const BorderSide(color: AppPalette.primary, width: 2);
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
                                      ? AppPalette.primary
                                      : AppPalette.surfaceMuted,
                                  child: Text(
                                    String.fromCharCode(65 + idx), // A, B, C, D
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : AppPalette.textMuted,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: AutoSizeText(
                                    q.options[idx],
                                    style: TextStyle(
                                      fontSize: 16,
                                      height: 1.4,
                                      color: AppPalette.text,
                                      fontWeight: isSelected
                                          ? FontWeight.bold
                                          : FontWeight.normal,
                                    ),
                                    maxLines: 3,
                                    minFontSize: 10,
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
                  selectedOption != q.answer)
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        icon: const FaIcon(FontAwesomeIcons.lightbulb),
                        label: const Text("해설 보기"),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppPalette.warningSoft,
                          foregroundColor: AppPalette.text,
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
                                explanation: q.explanation.isEmpty
                                    ? "설명이 없습니다."
                                    : q.explanation,
                                teamColor: AppPalette.primary,
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
                          backgroundColor: AppPalette.primary,
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
                                      teamColor: AppPalette.primary,
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
      ),
    );
  }
}
