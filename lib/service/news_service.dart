import 'dart:convert';

import 'package:flutter_getx_simple_news_app/constants/constants.dart';
import 'package:flutter_getx_simple_news_app/models/article.dart';
import 'package:http/http.dart' as http;

class NewsWebService {
  static var client = http.Client();

  static Future<List<Article>?> fetchNews() async {
    var response = await client.get(Uri.parse(Constants.topHeadlines));

    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);

      return (jsonData['articles'] as List)
          .map((e) => Article.fromJson(e))
          .toList();
    } else {
      return null;
    }
  }
}
