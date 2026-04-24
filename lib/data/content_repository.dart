import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../models/content_models.dart';

abstract class ContentRepository {
  Future<List<DictionaryTerm>> loadDictionaryTerms();

  Future<List<TriviaItem>> loadTriviaItems();

  Future<List<QuizQuestion>> loadQuizQuestions();

  Future<List<QuoteItem>> loadQuotes();
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
