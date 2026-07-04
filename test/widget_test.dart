import 'package:baseball_quiz/data/content_repository.dart';
import 'package:baseball_quiz/main.dart';
import 'package:baseball_quiz/models/content_models.dart';
import 'package:flutter_test/flutter_test.dart';

class FakeContentRepository implements ContentRepository {
  const FakeContentRepository();

  @override
  Future<List<DictionaryTerm>> loadDictionaryTerms() async {
    return const [
      DictionaryTerm(
        category: '타자',
        term: '홈런',
        description: '타구가 펜스를 넘어 득점이 인정되는 타격.',
      ),
    ];
  }

  @override
  Future<List<QuoteItem>> loadQuotes() async {
    return const [
      QuoteItem(quote: '야구는 끝날 때까지 끝난 게 아니다.', author: '요기 베라'),
    ];
  }

  @override
  Future<List<QuizQuestion>> loadQuizQuestions() async {
    return const [
      QuizQuestion(
        id: 'test-question',
        question: '타율은 무엇을 나타내는 지표인가요?',
        optionIds: ['option-1', 'option-2', 'option-3', 'option-4'],
        options: ['안타 / 타수', '실책', '승률', '도루'],
      ),
    ];
  }

  @override
  Future<QuizAnswerResult> checkQuizAnswer({
    required String questionId,
    required String optionId,
  }) async {
    return QuizAnswerResult(
      isCorrect: optionId == 'option-1',
      explanation: '타율은 안타를 타수로 나눈 지표입니다.',
    );
  }

  @override
  Future<RecordRoomData> loadRecordRoom() async {
    return const RecordRoomData(
      years: [2024, 2025],
      teamRanks: {
        'LG': [3, 1],
        '한화': [8, 2],
      },
      hitterRecords: {
        '홈런': [
          {
            'rank': '1',
            'name': '르윈 디아즈',
            'team': '삼성',
            'value': '50',
            'year': '2025',
          },
        ],
      },
      pitcherRecords: {
        '승리': [
          {
            'rank': '1',
            'name': '코디 폰세',
            'team': '한화',
            'value': '17',
            'year': '2025',
          },
        ],
      },
    );
  }

  @override
  Future<List<TriviaItem>> loadTriviaItems() async {
    return const [
      TriviaItem(
        category: '규칙',
        term: '정규시즌 경기수',
        shortDesc: '각 구단 144경기',
        trivia: 'KBO 정규시즌은 각 구단이 144경기를 치른다.',
        detail: '',
        fun: '3',
      ),
    ];
  }
}

void main() {
  testWidgets('shows the main navigation shell', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MyApp(repository: FakeContentRepository()),
    );
    await tester.pumpAndSettle();

    expect(find.text('⚾️ Play Ball ⚾️'), findsOneWidget);
    expect(find.text('홈'), findsOneWidget);
    expect(find.text('용어사전'), findsOneWidget);
    expect(find.text('알쓸야잡'), findsOneWidget);
    expect(find.text('기록'), findsOneWidget);
    expect(find.text('오늘의 용어'), findsOneWidget);
  });
}
