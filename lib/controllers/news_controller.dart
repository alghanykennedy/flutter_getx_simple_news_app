import 'package:flutter_getx_simple_news_app/models/article.dart';
import 'package:flutter_getx_simple_news_app/service/news_service.dart';
import 'package:get/get.dart';

class NewsController extends GetxController {
  var articles = <Article>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchArticle();
  }

  void fetchArticle() async {
    isLoading(true);

    try {
      isLoading(true);
      var articleTemp = await NewsWebService.fetchNews();
      if (articleTemp != null) {
        articles(articleTemp);
      }
    } finally {
      isLoading(false);
    }
  }
}
