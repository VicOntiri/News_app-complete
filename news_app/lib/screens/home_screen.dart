import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/news_article_screen.dart';

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
            TextField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 15.0),
                fillColor: Colors.grey[100],
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Colors.white,
                  ),
                ),
                hintText: 'Search',
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 10.0, left: 15.0),
                  child: const FaIcon(
                    FontAwesomeIcons.magnifyingGlass,
                    size: 17.0,
                    color: Colors.grey,
                  ),
                ),
                suffixIcon: IconButton(
                  icon: const FaIcon(
                    FontAwesomeIcons.sliders,
                    size: 15.0,
                  ),
                  onPressed: () {},
                ),
              ),
            ),
            _newsData.when(
              data: (_newsData) {
                return Expanded(
                  child: ListView(
                    children: [
                      ..._newsData.map(
                        (news) => Column(
                          children: [
                            GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => NewsArticle(
                                    singleNewsArticle: news,
                                  ),
                                ),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image(
                                      image: NetworkImage(news.image),
                                      height: 150.0,
                                      width: MediaQuery.of(context).size.width,
                                      fit: BoxFit.cover,
                                    ),
                                    SizedBox(
                                      height: 5.0,
                                    ),
                                    Text(
                                      news.title,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          DateFormat("dd-MM-yy").format(
                                            DateTime.parse(news.publishedAt),
                                          ),
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Text(
                                          news.author,
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
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
