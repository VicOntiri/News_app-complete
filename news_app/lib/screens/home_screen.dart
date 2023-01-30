import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/widgets/news_article.dart';
import 'package:news_app/widgets/search_area.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _newsData = ref.watch(newsProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Discover',
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              'Top headlines from all over the world',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            CustomSearchWidget(),
            _newsData.when(
              data: (_newsData) {
                return Expanded(
                  child: ListView(
                    children: [
                      ..._newsData.map(
                        (news) => NewsArticleWidget(news: news),
                      ),
                    ],
                  ),
                );
              },
              error: (err, s) => Text(err.toString()),
              loading: () => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
