/*
 * Reference Code
 * https://github.com/sooxt98/google_nav_bar/blob/master/example/lib/main.dart
 * https://github.com/lohanidamodar/flutter_ui_challenges/blob/master/lib/src/pages/settings/settings2.dart
 * modified by my_school
 */

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/pages/HomePage.dart';
import 'package:my_school/pages/TimeTablePage.dart';
import 'package:my_school/pages/MealPage.dart';
import 'package:my_school/pages/ListPage.dart';
import 'package:my_school/pages/SettingsPage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [HomePage(), ListPage(), TimeTablePage(), MealPage(), SettingsPage()];

  void changePageIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_currentIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              tabActiveBorder: Border.all(color: Theme.of(context).hintColor, width: 1), // tab button border
              gap: 8,
              activeColor: Theme.of(context).hintColor,
              iconSize: 22,
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              color: Theme.of(context).hintColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: '홈',
                ),
                GButton(
                  icon: LineIcons.thList,
                  text: '목록',
                ),
                GButton(
                  icon: LineIcons.calendar,
                  text: '시간표',
                ),
                GButton(
                  icon: LineIcons.utensils,
                  text: '식단표',
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: '설정',
                ),
              ],
              selectedIndex: _currentIndex,
              onTabChange: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
