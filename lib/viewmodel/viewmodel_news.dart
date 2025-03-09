import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/services/news_services.dart';

class NewsViewModel extends ChangeNotifier {
  List<ArticleModel>? news;

  Future<List<ArticleModel>> fetchNews({
    String categoryName = 'general',
    String? search,
  }) async {
    List<ArticleModel>? newsData;
    newsData = await NewsServices().getNewsTopHeadLines(
      category: categoryName,
      search: search ?? '',
    );
    notifyListeners();
    return newsData;
  }
}
