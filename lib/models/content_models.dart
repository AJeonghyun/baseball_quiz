class DictionaryTerm {
  final String category;
  final String term;
  final String description;

  const DictionaryTerm({
    required this.category,
    required this.term,
    required this.description,
  });

  factory DictionaryTerm.fromSupabase(Map<String, dynamic> json) {
    return DictionaryTerm(
      category: (json['category'] ?? '').toString(),
      term: (json['term'] ?? '').toString(),
      description: (json['description'] ?? json['desc'] ?? '').toString(),
    );
  }
}

class TriviaItem {
  final String category;
  final String term;
  final String shortDesc;
  final String trivia;
  final String detail;
  final String fun;

  const TriviaItem({
    required this.category,
    required this.term,
    required this.shortDesc,
    required this.trivia,
    required this.detail,
    required this.fun,
  });

  factory TriviaItem.fromJson(Map<String, dynamic> json) {
    return TriviaItem(
      category: (json['category'] ?? '').toString(),
      term: (json['term'] ?? '').toString(),
      shortDesc: (json['shortDesc'] ?? json['short_desc'] ?? '').toString(),
      trivia: (json['trivia'] ?? '').toString(),
      detail: (json['detail'] ?? '').toString(),
      fun: (json['fun'] ?? '').toString(),
    );
  }
}

class QuizQuestion {
  final String id;
  final String question;
  final List<String> options;
  final int answer;
  final String explanation;

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.options,
    required this.answer,
    required this.explanation,
  });

  factory QuizQuestion.fromSupabase(
    Map<String, dynamic> json,
    List<Map<String, dynamic>> optionRows,
  ) {
    final sortedOptions = optionRows.toList()
      ..sort(
        (a, b) => (a['sort_order'] as int? ?? 0)
            .compareTo(b['sort_order'] as int? ?? 0),
      );
    final answerIndex =
        sortedOptions.indexWhere((option) => option['is_correct'] == true);

    return QuizQuestion(
      id: (json['id'] ?? '').toString(),
      question: (json['question'] ?? '').toString(),
      options: sortedOptions
          .map((option) => (option['option_text'] ?? '').toString())
          .toList(),
      answer: answerIndex < 0 ? 0 : answerIndex,
      explanation: (json['explanation'] ?? '').toString(),
    );
  }
}

class QuoteItem {
  final String quote;
  final String author;

  const QuoteItem({
    required this.quote,
    required this.author,
  });

  factory QuoteItem.fromJson(Map<String, dynamic> json) {
    return QuoteItem(
      quote: (json['quote'] ?? '').toString(),
      author: (json['author'] ?? '').toString(),
    );
  }
}
