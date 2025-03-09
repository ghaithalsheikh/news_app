import 'package:flutter/material.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/services/news_services_search.dart';

class NewsSearchViewModel extends ChangeNotifier {
  List<ArticleModel>? newsSearch;

  Future<List<ArticleModel>> fetchNewsSearch({String searchName = ''}) async {
    List<ArticleModel>? newsSearchData;
    newsSearchData = await NewsServicesSearch().getNewsTopEverythingSearch(
      search: searchName,
    );
    notifyListeners();
    return newsSearchData;
  }
}
