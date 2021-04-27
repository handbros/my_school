import 'package:flutter/material.dart';
import 'package:my_school/widgets/BottomNavigationDotBar.dart';
import 'package:my_school/pages/HomePage.dart';
import 'package:my_school/pages/TimetablePage.dart';
import 'package:my_school/pages/MealPage.dart';
import 'package:my_school/pages/ListPage.dart';
import 'package:my_school/pages/SettingsPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;

  final List<Widget> pages = [HomePage(), TimetablePage(), MealPage(), ListPage(), SettingsPage()];

  void changePageIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationDotBar (
          items: <BottomNavigationDotBarItem>[
            BottomNavigationDotBarItem(icon: Icons.home_filled, onTap: () { changePageIndex(0); }),
            BottomNavigationDotBarItem(icon: Icons.access_time_sharp, onTap: () { changePageIndex(1); }),
            BottomNavigationDotBarItem(icon: Icons.fastfood_sharp, onTap: () { changePageIndex(2); }),
            BottomNavigationDotBarItem(icon: Icons.list_sharp, onTap: () { changePageIndex(3); }),
            BottomNavigationDotBarItem(icon: Icons.settings, onTap: () { changePageIndex(4); }),
          ]
      ),
    );
  }

  Widget get bodyContent {
    return Container(color: Colors.white54);
  }
}
