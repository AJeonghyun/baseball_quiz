import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/content_models.dart';

abstract class ContentRepository {
  Future<List<DictionaryTerm>> loadDictionaryTerms();

  Future<List<TriviaItem>> loadTriviaItems();

  Future<List<QuizQuestion>> loadQuizQuestions();

  Future<List<QuoteItem>> loadQuotes();

  Future<RecordRoomData> loadRecordRoom();
}

class SupabaseContentRepository implements ContentRepository {
  final SupabaseClient _client;

  const SupabaseContentRepository(this._client);

  @override
  Future<List<DictionaryTerm>> loadDictionaryTerms() async {
    final rows = await _client
        .from('dictionary_terms')
        .select()
        .eq('published', true)
        .order('category')
        .order('sort_order');
    return (rows as List<dynamic>)
        .map(
          (row) => DictionaryTerm.fromSupabase(
              Map<String, dynamic>.from(row as Map)),
        )
        .where((term) => term.term.isNotEmpty)
        .toList();
  }

  @override
  Future<List<TriviaItem>> loadTriviaItems() async {
    final rows = await _client
        .from('trivia_items')
        .select()
        .eq('published', true)
        .order('category')
        .order('sort_order');
    return (rows as List<dynamic>)
        .map(
            (row) => TriviaItem.fromJson(Map<String, dynamic>.from(row as Map)))
        .toList();
  }

  @override
  Future<List<QuizQuestion>> loadQuizQuestions() async {
    final rows = await _client
        .from('quiz_questions')
        .select(
            'id, question, explanation, quiz_options(option_text, is_correct, sort_order)')
        .eq('published', true)
        .order('sort_order');

    return (rows as List<dynamic>)
        .map((row) {
          final questionRow = Map<String, dynamic>.from(row as Map);
          final options = (questionRow['quiz_options'] as List<dynamic>? ?? [])
              .map((option) => Map<String, dynamic>.from(option as Map))
              .toList();
          return QuizQuestion.fromSupabase(questionRow, options);
        })
        .where((question) =>
            question.question.isNotEmpty && question.options.isNotEmpty)
        .toList();
  }

  @override
  Future<List<QuoteItem>> loadQuotes() async {
    final rows = await _client
        .from('quotes')
        .select()
        .eq('published', true)
        .order('sort_order');
    return (rows as List<dynamic>)
        .map((row) => QuoteItem.fromJson(Map<String, dynamic>.from(row as Map)))
        .toList();
  }

  @override
  Future<RecordRoomData> loadRecordRoom() async {
    final teamRows = await _client
        .from('team_rank_history')
        .select()
        .order('season')
        .order('sort_order');
    final recordRows = await _client
        .from('player_all_time_records')
        .select()
        .order('category')
        .order('sort_order')
        .order('rank');

    final teamEntries = (teamRows as List<dynamic>)
        .map(
          (row) =>
              TeamRankEntry.fromSupabase(Map<String, dynamic>.from(row as Map)),
        )
        .where((entry) => entry.teamName.isNotEmpty)
        .toList();
    final playerEntries = (recordRows as List<dynamic>)
        .map(
          (row) => PlayerRecordEntry.fromAllTimeSupabase(
            Map<String, dynamic>.from(row as Map),
          ),
        )
        .where((entry) =>
            entry.metric.isNotEmpty &&
            entry.playerName.isNotEmpty &&
            entry.value.isNotEmpty)
        .toList();

    final years = teamEntries.map((entry) => entry.season).toSet().toList()
      ..sort();
    final teamNames = <String>[];
    for (final entry in teamEntries) {
      if (!teamNames.contains(entry.teamName)) {
        teamNames.add(entry.teamName);
      }
    }

    final ranksBySeason = <int, Map<String, int>>{};
    for (final entry in teamEntries) {
      ranksBySeason.putIfAbsent(entry.season, () => {})[entry.teamName] =
          entry.rank;
    }
    final teamRanks = <String, List<int>>{};
    for (final teamName in teamNames) {
      teamRanks[teamName] = [
        for (final year in years) ranksBySeason[year]?[teamName] ?? 10,
      ];
    }

    return RecordRoomData(
      years: years,
      teamRanks: teamRanks,
      hitterRecords: _recordsByMetric(playerEntries, 'hitter'),
      pitcherRecords: _recordsByMetric(playerEntries, 'pitcher'),
    );
  }

  Map<String, List<Map<String, String>>> _recordsByMetric(
    List<PlayerRecordEntry> entries,
    String groupType,
  ) {
    final result = <String, List<Map<String, String>>>{};
    for (final entry
        in entries.where((entry) => entry.groupType == groupType)) {
      result.putIfAbsent(entry.metric, () => []).add({
        'rank': entry.rank.toString(),
        'name': entry.playerName,
        'team': entry.teamName,
        'value': entry.value,
        'year':
            entry.achievedYear?.toString() ?? _scopeLabel(entry.recordScope),
      });
    }
    for (final records in result.values) {
      records.sort(
        (a, b) => _rankValue(a['rank']).compareTo(_rankValue(b['rank'])),
      );
    }
    return result;
  }

  int _rankValue(String? rank) {
    return int.tryParse(rank ?? '') ?? 999;
  }

  String _scopeLabel(String scope) {
    return switch (scope) {
      'career' => '통산',
      'single_season' => '단일 시즌',
      'single_game' => '한 경기',
      _ => scope,
    };
  }
}

class ContentRepositoryProvider {
  static const _definedSupabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const _definedSupabaseAnonKey =
      String.fromEnvironment('SUPABASE_ANON_KEY');

  static String get supabaseUrl => _definedSupabaseUrl.isNotEmpty
      ? _definedSupabaseUrl
      : _env('SUPABASE_URL');

  static String get supabaseAnonKey => _definedSupabaseAnonKey.isNotEmpty
      ? _definedSupabaseAnonKey
      : _env('SUPABASE_ANON_KEY');

  static bool get hasSupabaseConfig =>
      supabaseUrl.isNotEmpty && supabaseAnonKey.isNotEmpty;

  static Future<ContentRepository> create() async {
    await dotenv.load(fileName: '.env', isOptional: true);

    if (!hasSupabaseConfig) {
      throw StateError(
        'Supabase config is missing. Set SUPABASE_URL and SUPABASE_ANON_KEY in .env.',
      );
    }

    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );

    return SupabaseContentRepository(Supabase.instance.client);
  }

  static String _env(String key) {
    if (!dotenv.isInitialized) return '';
    return dotenv.env[key] ?? '';
  }
}
