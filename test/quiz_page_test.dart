import 'package:baseball_quiz/data/content_repository.dart';
import 'package:baseball_quiz/models/content_models.dart';
import 'package:baseball_quiz/quiz_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

class _QuizRepository implements ContentRepository {
  String? checkedQuestionId;
  String? checkedOptionId;

  @override
  Future<List<QuizQuestion>> loadQuizQuestions() async {
    return const [
      QuizQuestion(
        id: 'question-1',
        question: '정답을 고르세요.',
        optionIds: ['option-1', 'option-2'],
        options: ['정답', '오답'],
      ),
    ];
  }

  @override
  Future<QuizAnswerResult> checkQuizAnswer({
    required String questionId,
    required String optionId,
  }) async {
    checkedQuestionId = questionId;
    checkedOptionId = optionId;
    return QuizAnswerResult(
      isCorrect: optionId == 'option-1',
      explanation: '서버에서 받은 해설',
    );
  }

  @override
  Future<List<DictionaryTerm>> loadDictionaryTerms() async => [];

  @override
  Future<List<QuoteItem>> loadQuotes() async => [];

  @override
  Future<RecordRoomData> loadRecordRoom() async {
    return const RecordRoomData(
      years: [],
      teamRanks: {},
      hitterRecords: {},
      pitcherRecords: {},
    );
  }

  @override
  Future<List<TriviaItem>> loadTriviaItems() async => [];
}

void main() {
  testWidgets('checks a selected option through the repository',
      (tester) async {
    final repository = _QuizRepository();

    await tester.pumpWidget(
      MaterialApp(home: QuizPage(repository: repository)),
    );
    await tester.pumpAndSettle();

    await tester.tap(find.text('정답'));
    await tester.pump();

    expect(repository.checkedQuestionId, 'question-1');
    expect(repository.checkedOptionId, 'option-1');

    await tester.pump(const Duration(milliseconds: 300));
    await tester.pumpAndSettle();

    expect(find.text('정답입니다!'), findsOneWidget);
    expect(find.text('서버에서 받은 해설'), findsOneWidget);
  });
}
