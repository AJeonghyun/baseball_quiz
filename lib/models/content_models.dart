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
  final List<String> optionIds;
  final List<String> options;

  const QuizQuestion({
    required this.id,
    required this.question,
    required this.optionIds,
    required this.options,
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

    return QuizQuestion(
      id: (json['id'] ?? '').toString(),
      question: (json['question'] ?? '').toString(),
      optionIds: sortedOptions
          .map((option) => (option['id'] ?? '').toString())
          .toList(),
      options: sortedOptions
          .map((option) => (option['option_text'] ?? '').toString())
          .toList(),
    );
  }
}

class QuizAnswerResult {
  final bool isCorrect;
  final String explanation;

  const QuizAnswerResult({
    required this.isCorrect,
    required this.explanation,
  });

  factory QuizAnswerResult.fromSupabase(Map<String, dynamic> json) {
    return QuizAnswerResult(
      isCorrect: json['is_correct'] == true,
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

class TeamRankEntry {
  final int season;
  final String teamName;
  final int rank;
  final int? wins;
  final int? losses;
  final int? draws;
  final double? winRate;

  const TeamRankEntry({
    required this.season,
    required this.teamName,
    required this.rank,
    this.wins,
    this.losses,
    this.draws,
    this.winRate,
  });

  factory TeamRankEntry.fromSupabase(Map<String, dynamic> json) {
    return TeamRankEntry(
      season: (json['season'] as num).toInt(),
      teamName: (json['team_name'] ?? '').toString(),
      rank: (json['rank'] as num).toInt(),
      wins: (json['wins'] as num?)?.toInt(),
      losses: (json['losses'] as num?)?.toInt(),
      draws: (json['draws'] as num?)?.toInt(),
      winRate: (json['win_rate'] as num?)?.toDouble(),
    );
  }
}

class PlayerRecordEntry {
  final String groupType;
  final String metric;
  final int rank;
  final String playerName;
  final String teamName;
  final String value;
  final String recordScope;
  final int? achievedYear;

  const PlayerRecordEntry({
    required this.groupType,
    required this.metric,
    required this.rank,
    required this.playerName,
    required this.teamName,
    required this.value,
    required this.recordScope,
    this.achievedYear,
  });

  factory PlayerRecordEntry.fromAllTimeSupabase(Map<String, dynamic> json) {
    return PlayerRecordEntry(
      groupType: (json['category'] ?? '').toString(),
      metric: (json['metric'] ?? '').toString(),
      rank: (json['rank'] as num).toInt(),
      playerName: (json['player_name'] ?? '').toString(),
      teamName: (json['team_name'] ?? '').toString(),
      value: (json['value'] ?? '').toString(),
      recordScope: (json['record_scope'] ?? '').toString(),
      achievedYear: (json['achieved_year'] as num?)?.toInt(),
    );
  }
}

class RecordRoomData {
  final List<int> years;
  final Map<String, List<int>> teamRanks;
  final Map<String, List<Map<String, String>>> hitterRecords;
  final Map<String, List<Map<String, String>>> pitcherRecords;

  const RecordRoomData({
    required this.years,
    required this.teamRanks,
    required this.hitterRecords,
    required this.pitcherRecords,
  });
}
