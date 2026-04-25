class Article {
  const Article({
    required this.id,
    required this.title,
    required this.summary,
    required this.author,
    required this.publishedAt,
  });

  final int id;
  final String title;
  final String summary;
  final String author;
  final DateTime publishedAt;

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: (json['id'] as num?)?.toInt() ?? 0,
      title: json['title'] as String? ?? 'Untitled',
      summary: json['summary'] as String? ?? '',
      author: json['author'] as String? ?? 'Unknown',
      publishedAt:
          DateTime.tryParse(json['published_at'] as String? ?? '') ??
          DateTime.fromMillisecondsSinceEpoch(0),
    );
  }
}
