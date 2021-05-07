/*
 * Original Code
 * https://github.com/sooxt98/google_nav_bar/blob/master/example/lib/main.dart
 * modified by my_school
 */

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/pages/tabs/HomePage.dart';
import 'package:my_school/pages/tabs/TimeTablePage.dart';
import 'package:my_school/pages/tabs/MealPage.dart';
import 'package:my_school/pages/tabs/ListPage.dart';
import 'package:my_school/pages/tabs/SettingsPage.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> pages = [HomePage(), ListPage(), TimeTablePage(), MealPage(), SettingsPage()];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: ChangeNotifierProvider 구현하기.
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
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
              gap: 4,
              tabMargin: EdgeInsets.zero,
              activeColor: Theme.of(context).hintColor,
              iconSize: 22,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              duration: Duration(milliseconds: 400),
              tabBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              color: Theme.of(context).hintColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: '홈',
                  textStyle: TextStyle(
                    fontSize: 14
                  ),
                ),
                GButton(
                  icon: LineIcons.thList,
                  text: '목록',
                  textStyle: TextStyle(
                      fontSize: 14
                  ),
                ),
                GButton(
                  icon: LineIcons.calendar,
                  text: '시간표',
                  textStyle: TextStyle(
                      fontSize: 14
                  ),
                ),
                GButton(
                  icon: LineIcons.utensils,
                  text: '식단표',
                  textStyle: TextStyle(
                      fontSize: 14
                  ),
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: '설정',
                  textStyle: TextStyle(
                      fontSize: 14
                  ),
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
