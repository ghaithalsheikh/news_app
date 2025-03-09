import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:news/view/category_view.dart';
import 'package:news/view/home_pages.dart';
import 'package:news/view/setting_page.dart';

class FirstView extends StatefulWidget {
  const FirstView({super.key});

  @override
  State<FirstView> createState() => _FirstViewState();
}

class _FirstViewState extends State<FirstView> {
  @override
  void initState() {
    super.initState();
  }

  int currentIndex = 1;
  static const List<Widget> views = [CategoryView(), HomeView(), SettingView()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: views[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedItemColor: Colors.orange,
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.category),
            label: tr('Categorys'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: tr('Home'),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings),
            label: tr('Setting'),
          ),
        ],
      ),
    );
  }
}
