import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/screens/news_article_screen.dart';

class NewsArticleWidget extends StatelessWidget {
  final News news;
  const NewsArticleWidget({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
    );
  }
}
