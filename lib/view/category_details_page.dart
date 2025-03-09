import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/widgets/news_listview_builder.dart';
import 'package:news/widgets/search_bar_categories.dart';
import '../services/news_services.dart';

class CategoryDetailsView extends StatefulWidget {
  const CategoryDetailsView({super.key, required this.name});
  final String name;

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  dynamic future;

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      future = NewsServices().getNewsTopHeadLines(category: widget.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          tr(widget.name),
          style: TextStyle(fontSize: ScreenUtil().setSp(18)),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: SearchOfBarCategories(name: widget.name),
              ),
              SliverToBoxAdapter(
                child: SizedBox(height: ScreenUtil().setHeight(10)),
              ),
              NewsListViewBuilder(
                categoryName: widget.name,
                future: future,
                searchCategoryName: '',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
