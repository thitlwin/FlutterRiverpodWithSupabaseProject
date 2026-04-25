import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
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
