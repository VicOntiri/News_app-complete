import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:news_app/models/news.dart';

String apiKey = '66f21f3b8f58423aa0b7aa3eb4e174c9';

class ApiService {
  String endpoint =
      'https://newsapi.org/v2/top-headlines?country=us&apiKey=${apiKey}';

  Future<List<News>> getNews() async {
    Response response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['articles'];
      return result.map(((e) => News.fromJson(e))).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final newsApiProvider = Provider<ApiService>((ref) => ApiService());
