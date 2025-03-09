import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news/view/about_page.dart';
import 'package:news/view/category_details_page.dart';
import 'package:news/view/contact_page.dart';
import 'package:news/viewmodel/viewmodel_news.dart';
import 'package:news/widgets/custom_dropdown.dart';
import 'package:news/widgets/navigate_right_to_left.dart';
import 'package:news/widgets/search_bar.dart';
import '../widgets/news_listview_builder.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  dynamic future;
  String? selectedOption; // Variable to store the selected option

  Future<void> _refreshData() async {
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      future = NewsViewModel().fetchNews(categoryName: 'general');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
            Text(
              tr("News"),
              style: TextStyle(fontSize: ScreenUtil().setSp(24)),
            ),
            Text(
              tr('World'),
              style: TextStyle(
                color: Colors.orange,
                fontSize: ScreenUtil().setSp(24),
              ),
            ),
            const Spacer(flex: 4),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  RightToLeftPageRoute(
                    builder:
                        (context) => AppBar(
                          title: Padding(
                            padding: EdgeInsets.only(
                              top: ScreenUtil().setWidth(5),
                            ),
                            child: const SearchOfBar(),
                          ),
                        ),
                  ),
                );
              },
              icon: const Icon(Icons.search),
              iconSize: ScreenUtil().setWidth(26),
            ),
          ],
        ),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    tr("News"),
                    style: TextStyle(fontSize: ScreenUtil().setSp(30)),
                  ),
                  Text(
                    tr('World'),
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: ScreenUtil().setSp(30),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            Row(
              children: [
                SizedBox(width: ScreenUtil().setWidth(10)),
                Icon(Icons.category_outlined, size: ScreenUtil().setWidth(33)),
                SizedBox(width: ScreenUtil().setWidth(30)),
                DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    iconSize: 0,
                    elevation: 0,
                    alignment: Alignment.center,
                    hint: Text(
                      tr('Categoreis News'),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(fontSize: ScreenUtil().setSp(19)),
                    ),
                    onChanged: (newValue) {
                      setState(() {
                        if (newValue == selectedOption) {
                          selectedOption =
                              null; // Cancel the selection if it's the same value
                        } else {
                          selectedOption =
                              newValue; // Update the selected option
                        }
                      });
                    },
                    items: [
                      CustomDropdownMenuItem<String>(
                        value: tr('Technology'),
                        onTap: () {
                          Navigator.of(context).push(
                            RightToLeftPageRoute(
                              builder:
                                  (context) => const CategoryDetailsView(
                                    name: 'Technology',
                                  ),
                            ),
                          );
                        },
                        child: Text(
                          tr('Technology'),
                          style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Sports',
                        onTap: () {
                          Navigator.of(context).push(
                            RightToLeftPageRoute(
                              builder:
                                  (context) =>
                                      const CategoryDetailsView(name: 'Sports'),
                            ),
                          );
                        },
                        child: Text(
                          tr('Sports'),
                          style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Business',
                        onTap: () {
                          Navigator.of(context).push(
                            RightToLeftPageRoute(
                              builder:
                                  (context) => const CategoryDetailsView(
                                    name: 'Business',
                                  ),
                            ),
                          );
                        },
                        child: Text(
                          tr('Business'),
                          style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Entertainment',
                        onTap: () {
                          Navigator.of(context).push(
                            RightToLeftPageRoute(
                              builder:
                                  (context) => const CategoryDetailsView(
                                    name: 'Entertainment',
                                  ),
                            ),
                          );
                        },
                        child: Text(
                          tr('Entertainment'),
                          style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Health',
                        onTap: () {
                          Navigator.of(context).push(
                            RightToLeftPageRoute(
                              builder:
                                  (context) =>
                                      const CategoryDetailsView(name: 'Health'),
                            ),
                          );
                        },
                        child: Text(
                          tr('Health'),
                          style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                        ),
                      ),
                      CustomDropdownMenuItem<String>(
                        value: 'Science',
                        onTap: () {
                          Navigator.of(context).push(
                            RightToLeftPageRoute(
                              builder:
                                  (context) => const CategoryDetailsView(
                                    name: 'Science',
                                  ),
                            ),
                          );
                        },
                        child: Text(
                          tr('Science'),
                          style: TextStyle(fontSize: ScreenUtil().setSp(16)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            // SizedBox(
            //   height: ScreenUtil().setHeight(10),
            // ),
            // GestureDetector(
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         width: ScreenUtil().setWidth(10),
            //       ),
            //       Icon(
            //         Icons.settings,
            //         size: ScreenUtil().setWidth(33),
            //       ),
            //       SizedBox(
            //         width: ScreenUtil().setWidth(30),
            //       ),
            //       Text(
            //         tr('Setting'),
            //         style: TextStyle(fontSize: ScreenUtil().setSp(18)),
            //       ),
            //     ],
            //   ),
            //   onTap: () {
            //     Navigator.of(context).push(RightToLeftPageRoute(
            //       builder: (context) => const SettingView(),
            //     ));
            //   },
            // ),
            SizedBox(height: ScreenUtil().setHeight(10)),

            GestureDetector(
              child: Row(
                children: [
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Icon(Icons.info_outline, size: ScreenUtil().setWidth(33)),
                  SizedBox(width: ScreenUtil().setWidth(30)),
                  Text(
                    tr('About'),
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  RightToLeftPageRoute(builder: (context) => const AboutView()),
                );
              },
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
            GestureDetector(
              child: Row(
                children: [
                  SizedBox(width: ScreenUtil().setWidth(10)),
                  Icon(
                    FontAwesomeIcons.commentDots,
                    size: ScreenUtil().setWidth(33),
                  ),
                  SizedBox(width: ScreenUtil().setWidth(30)),
                  Text(
                    tr('Contact Us'),
                    style: TextStyle(fontSize: ScreenUtil().setSp(18)),
                  ),
                ],
              ),
              onTap: () {
                Navigator.of(context).push(
                  RightToLeftPageRoute(
                    builder: (context) => const ContactUsView(),
                  ),
                );
              },
            ),
            //
          ],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Padding(
          padding: EdgeInsets.all(ScreenUtil().setWidth(10.0)),
          child: CustomScrollView(
            slivers: [
              NewsListViewBuilder(
                categoryName: 'general',
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
