import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:supabase_flutter/supabase_flutter.dart';
import '../data/article.dart';
import '../data/news_api_service.dart';

final httpClientProvider = Provider<http.Client>((ref) {
  final client = http.Client();
  ref.onDispose(client.close);
  return client;
});

final newsApiServiceProvider = Provider<NewsApiService>((ref) {
  return NewsApiService(ref.watch(httpClientProvider));
});

final articlesProvider = FutureProvider<List<Article>>((ref) async {
  return ref.watch(newsApiServiceProvider).fetchArticles();
});

final realtimeArticlesProvider = StreamProvider<List<Article>>((ref) {
  return Supabase.instance.client
      .from('articles')
      .stream(primaryKey: ['id'])
      .order('published_at', ascending: false)
      .map(
        (rows) =>
            rows.map((item) => Article.fromJson(item)).toList(growable: false),
      );
});
