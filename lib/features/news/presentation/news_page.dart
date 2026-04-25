import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'article_list_tile.dart';
import 'news_providers.dart';

class NewsPage extends ConsumerWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final articlesAsync = ref.watch(articlesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('News App (Week 5)'),
        actions: [
          IconButton(
            onPressed: () => ref.refresh(articlesProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: articlesAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Unable to load articles.\nCheck Supabase URL, anon key, and table setup.',
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 12),
                    FilledButton(
                      onPressed: () => ref.refresh(articlesProvider),
                      child: const Text('Try Again'),
                    ),
                  ],
                ),
              ),
            ),
        data: (articles) {
          if (articles.isEmpty) {
            return const Center(child: Text('No articles found.'));
          }

          return RefreshIndicator(
            onRefresh: () async {
              ref.invalidate(articlesProvider);
              await ref.read(articlesProvider.future);
            },
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: articles.length,
              separatorBuilder: (_, __) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final article = articles[index];
                return ArticleListTile(article: article);
              },
            ),
          );
        },
      ),
    );
  }
}
