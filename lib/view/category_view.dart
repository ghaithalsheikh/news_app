import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/view/category_Details_page.dart';
import 'package:news/widgets/card_category.dart';
import 'package:news/widgets/navigate_right_to_left.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key, this.urlImage, this.nameCategory});
  final String? urlImage;
  final String? nameCategory;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(tr('Categoreis News')),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: ScreenUtil().setWidth(10)),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardCategory(
                urlImage: 'assets/technology.jpeg',
                nameCategory: tr('Technology'),
                onTap: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder:
                          (context) =>
                              const CategoryDetailsView(name: 'Technology'),
                    ),
                  );
                },
              ),
              CardCategory(
                urlImage: 'assets/spor.jfif',
                nameCategory: tr('Sports'),
                onTap: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder:
                          (context) =>
                              const CategoryDetailsView(name: 'Sports'),
                    ),
                  );
                },
              ),
              CardCategory(
                urlImage: 'assets/busi.jfif',
                nameCategory: tr('Business'),
                onTap: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder:
                          (context) =>
                              const CategoryDetailsView(name: 'Business'),
                    ),
                  );
                },
              ),
              CardCategory(
                urlImage: 'assets/enterta.jfif',
                nameCategory: tr('Entertainment'),
                onTap: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder:
                          (context) =>
                              const CategoryDetailsView(name: 'Entertainment'),
                    ),
                  );
                },
              ),
              CardCategory(
                urlImage: 'assets/heal.jfif',
                nameCategory: tr('Health'),
                onTap: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder:
                          (context) =>
                              const CategoryDetailsView(name: 'Health'),
                    ),
                  );
                },
              ),
              CardCategory(
                urlImage: 'assets/scien.jfif',
                nameCategory: tr('Science'),
                onTap: () {
                  Navigator.of(context).push(
                    RightToLeftPageRoute(
                      builder:
                          (context) =>
                              const CategoryDetailsView(name: 'Science'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
