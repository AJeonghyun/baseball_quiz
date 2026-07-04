import 'package:baseball_quiz/models/content_models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('quiz questions parse option ids without requiring answer metadata', () {
    final question = QuizQuestion.fromSupabase(
      {'id': 'question-1', 'question': '질문'},
      [
        {
          'id': 'option-2',
          'option_text': '두 번째',
          'sort_order': 2,
        },
        {
          'id': 'option-1',
          'option_text': '첫 번째',
          'sort_order': 1,
        },
      ],
    );

    expect(question.optionIds, ['option-1', 'option-2']);
    expect(question.options, ['첫 번째', '두 번째']);
  });

  test('quiz answer results parse the RPC response', () {
    final result = QuizAnswerResult.fromSupabase({
      'is_correct': true,
      'explanation': '해설',
    });

    expect(result.isCorrect, isTrue);
    expect(result.explanation, '해설');
  });
}
