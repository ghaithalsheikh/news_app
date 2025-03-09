import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/WebView/test_webview.dart';
import 'package:news/models/articles_model.dart';
import 'package:news/widgets/navigate_right_to_left.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:ui' as ui;

class DetailsNewsTileView extends StatelessWidget {
  const DetailsNewsTileView({super.key, required this.articleModel});
  final ArticleModel articleModel;
  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).toString();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final shimmerColor = isDarkMode ? Colors.grey[600] : Colors.grey[300];
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(tr('Details the News')),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenUtil().setHeight(10.0),
            vertical: ScreenUtil().setHeight(10.0),
          ),
          child:
              articleModel.image == null &&
                      articleModel.description == '[Removed]' &&
                      articleModel.title == '[Removed]'
                  ? Container()
                  : Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(
                          ScreenUtil().radius(8.0),
                        ),
                        child:
                            articleModel.image == null
                                ? SizedBox(
                                  width: double.infinity,
                                  height: ScreenUtil().setHeight(180),
                                  child: Image.asset(
                                    'assets/error404.jpg',
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                )
                                : CachedNetworkImage(
                                  // width: double.infinity,
                                  // height: ScreenUtil().setHeight(200),
                                  imageUrl: articleModel.image!,
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) => Theme(
                                        data: Theme.of(
                                          context,
                                        ).copyWith(brightness: Brightness.dark),
                                        child: ColorFiltered(
                                          colorFilter:
                                              isDarkMode
                                                  ? ColorFilter.mode(
                                                    Colors.grey[600]!,
                                                    BlendMode.srcIn,
                                                  )
                                                  : ColorFilter.mode(
                                                    Colors.grey[300]!,
                                                    BlendMode.srcIn,
                                                  ),
                                          child: Shimmer.fromColors(
                                            baseColor: shimmerColor!,
                                            highlightColor: shimmerColor,
                                            direction:
                                                ShimmerDirection
                                                    .ltr, // Shimmer animation direction (left to right)

                                            child: Container(
                                              width: double.infinity,
                                              height: ScreenUtil().setHeight(
                                                180,
                                              ),
                                              decoration: BoxDecoration(
                                                // borderRadius: BorderRadius.circular(
                                                //     ScreenUtil().radius(8.0)),
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                  errorWidget:
                                      (context, url, error) => SizedBox(
                                        width: double.infinity,
                                        height: ScreenUtil().setHeight(180),
                                        child: Image.asset(
                                          'assets/error404.jpg',
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      const Divider(
                        color: Colors.grey,
                        height: 2,
                        thickness: 1,
                      ),
                      SizedBox(height: ScreenUtil().setHeight(5)),
                      Text(
                        articleModel.title == null ||
                                articleModel.title == '[Removed]'
                            ? ''
                            : articleModel.title!,
                        textDirection: ui.TextDirection.ltr,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Text(
                        textDirection: ui.TextDirection.ltr,
                        articleModel.description == null ||
                                articleModel.description == '[Removed]' ||
                                articleModel.description == 'False'
                            ? ''
                            : articleModel.description!,
                        style: TextStyle(
                          fontSize: ScreenUtil().setSp(20),
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Row(
                        children: [
                          Text(
                            tr('Author: '),
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                          Text(
                            articleModel.author ?? 'DAVID SHARP',
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Row(
                        children: [
                          Text(
                            tr('Source: '),
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                          Text(
                            articleModel.source ?? 'BBC News',
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            RightToLeftPageRoute(
                              builder:
                                  (context) => WebViewShow(
                                    urlImage: articleModel.urlImage,
                                  ),
                            ),
                          );
                        },
                        child: Row(
                          children: [
                            Text(
                              tr('Go to the Website'),
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: ScreenUtil().setSp(12),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                      Row(
                        children: [
                          Text(
                            tr("latest updated : "),
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                          Text(
                            DateFormat(
                              'yyyy-MM-dd',
                              locale,
                            ).format(articleModel.publishedAt),
                            style: TextStyle(fontSize: ScreenUtil().setSp(12)),
                          ),
                        ],
                      ),
                      SizedBox(height: ScreenUtil().setHeight(10)),
                    ],
                  ),
        ),
      ),
    );
  }
}
