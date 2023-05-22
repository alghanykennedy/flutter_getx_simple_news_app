import 'package:flutter/material.dart';
import 'package:flutter_getx_simple_news_app/controllers/news_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final NewsController _newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,
        backgroundColor: const Color(0xff535FF7),
        centerTitle: true,
        title: const Text(
          'News',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() => _newsController.isLoading.value
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _newsController.articles.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: const EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5.0),
                      border: Border.all(
                          color: const Color.fromRGBO(205, 213, 223, 1),
                          width: 1.0)),
                  child: Center(
                    child: Text(
                      _newsController.articles[index].title!,
                      style: const TextStyle(
                        color: Color.fromRGBO(76, 85, 102, 1),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                );
              })),
    );
  }
}
