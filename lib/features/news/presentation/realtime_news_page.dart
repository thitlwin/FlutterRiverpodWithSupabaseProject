import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'article_list_tile.dart';
import 'news_providers.dart';

class RealtimeNewsPage extends ConsumerWidget {
  const RealtimeNewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final realtimeArticles = ref.watch(realtimeArticlesProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Realtime News (StreamProvider)')),
      body: realtimeArticles.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error:
            (error, stackTrace) => Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  'Realtime stream error:\n$error',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
        data: (articles) {
          if (articles.isEmpty) {
            return const Center(
              child: Text(
                'No articles yet.\nInsert one in Supabase to see updates.',
              ),
            );
          }

          return Column(
            children: [
              Container(
                width: double.infinity,
                color: Colors.green.withValues(alpha: 0.12),
                padding: const EdgeInsets.all(12),
                child: Text(
                  'Listening to Supabase Realtime on "articles" (${articles.length} items)',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: articles.length,
                  separatorBuilder: (_, __) => const Divider(height: 1),
                  itemBuilder: (context, index) {
                    return ArticleListTile(article: articles[index]);
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
