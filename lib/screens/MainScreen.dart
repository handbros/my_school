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
import 'package:my_school/pages/tabs/ExplorerPage.dart';
import 'package:my_school/pages/tabs/SettingsPage.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final _pageViewController = PageController();
  final List<Widget> _pages = [HomePage(), ExplorerPage(), TimeTablePage(), MealPage(), SettingsPage()];
  int _tabIndex = 0;

  @override
  Widget build(BuildContext context) {
    // 반 정보 변경을 알리기 위한 ChangeNotifierProvider.
    return Scaffold(
      body: PageView(
        controller: _pageViewController,
        children: _pages,
        onPageChanged: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
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
              gap: 4,
              tabMargin: EdgeInsets.zero,
              iconSize: 22,
              padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              duration: Duration(milliseconds: 400),
              color: Theme.of(context).hintColor,
              activeColor: Theme.of(context).hintColor,
              tabActiveBorder: Border.all(color: Theme.of(context).hintColor, width: 1), // tab button border
              tabBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: '홈',
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor
                  ),
                ),
                GButton(
                  icon: LineIcons.thList,
                  text: '탐색',
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor
                  ),
                ),
                GButton(
                  icon: LineIcons.calendar,
                  text: '시간표',
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor
                  ),
                ),
                GButton(
                  icon: LineIcons.utensils,
                  text: '식단표',
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor
                  ),
                ),
                GButton(
                  icon: LineIcons.cog,
                  text: '설정',
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: Theme.of(context).hintColor
                  ),
                ),
              ],
              selectedIndex: _tabIndex,
              onTabChange: (index) {
                setState(() {
                  _pageViewController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
