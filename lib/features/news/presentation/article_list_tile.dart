import 'package:flutter/material.dart';
import '../data/article.dart';

class ArticleListTile extends StatelessWidget {
  const ArticleListTile({super.key, required this.article});

  final Article article;

  @override
  Widget build(BuildContext context) {
    final publishedDate =
        '${article.publishedAt.year}-${article.publishedAt.month.toString().padLeft(2, '0')}-${article.publishedAt.day.toString().padLeft(2, '0')}';

    return ListTile(
      title: Text(
        article.title,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8),
        child: Text(
          '${article.summary}\nBy ${article.author} · $publishedDate',
        ),
      ),
      isThreeLine: true,
    );
  }
}
