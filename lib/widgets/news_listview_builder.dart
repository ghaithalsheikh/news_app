import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/viewmodel/viewmodel_news.dart';
import 'package:news/widgets/news_tile_hive_listview.dart';
import 'package:news/widgets/news_tile_listview.dart';
import 'package:news/widgets/shimmer_widget.dart';
import 'package:provider/provider.dart';

import '../Hive/constant.dart';

class NewsListViewBuilder extends StatefulWidget {
  const NewsListViewBuilder({
    super.key,
    required this.categoryName,
    required this.searchCategoryName,
    required this.future,
  });
  final String categoryName;
  final String? searchCategoryName;

  final dynamic future;
  @override
  State<NewsListViewBuilder> createState() => _NewsListViewBuilderState();
}

class _NewsListViewBuilderState extends State<NewsListViewBuilder> {
  dynamic future;
  final Box<ArticleModel> box = Hive.box<ArticleModel>(HiveBoxes.newsBox);
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    future = NewsViewModel().fetchNews(
      categoryName: widget.categoryName,
      search: widget.searchCategoryName ?? '',
    );
  }

  @override
  void didUpdateWidget(covariant NewsListViewBuilder oldWidget) {
    super.didUpdateWidget(oldWidget);
    future = NewsViewModel().fetchNews(
      categoryName: widget.categoryName,
      search: widget.searchCategoryName ?? '',
    );
  }

  @override
  Widget build(BuildContext context) {
    final newsViewModel = Provider.of<NewsViewModel>(context, listen: false);
    return FutureBuilder<List<ArticleModel>>(
      future: widget.future ?? future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          newsViewModel.news = snapshot.data;
          return const NewsTileListView();
        } else if (snapshot.hasError) {
          return NewsTileHiveListView(newsBox: box);
        }
        return const SliverToBoxAdapter(child: ShimmerWidget());
      },
    );
  }
}
