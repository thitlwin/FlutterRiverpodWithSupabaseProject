import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../core/config.dart';
import 'article.dart';

class NewsApiService {
  const NewsApiService(this._client);

  final http.Client _client;

  Future<List<Article>> fetchArticles() async {
    final uri = Uri.parse(
      '${AppConfig.supabaseUrl}/rest/v1/articles?select=*&order=published_at.desc',
    );

    final response = await _client.get(
      uri,
      headers: {
        'apikey': AppConfig.supabaseAnonKey,
        'Authorization': 'Bearer ${AppConfig.supabaseAnonKey}',
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load articles: ${response.statusCode}');
    }

    final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
    return jsonList
        .map((item) => Article.fromJson(item as Map<String, dynamic>))
        .toList();
  }
}
