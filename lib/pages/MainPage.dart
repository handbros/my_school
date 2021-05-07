/*
 * Original Code
 * https://github.com/sooxt98/google_nav_bar/blob/master/example/lib/main.dart
 * modified by my_school
 */

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/pages/tabs/HomePage.dart';
import 'package:my_school/pages/tabs/TimeTablePage.dart';
import 'package:my_school/pages/tabs/MealPage.dart';
import 'package:my_school/pages/tabs/ListPage.dart';
import 'package:my_school/pages/tabs/SettingsPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  final List<Widget> pages = [HomePage(), ListPage(), TimeTablePage(), MealPage(), SettingsPage()];

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  void readSharedAssets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String sharedAssetsJson = prefs.getString("SHARED_ASSETS") ?? null;
    
    if (sharedAssetsJson == null) {
      SharedAssets.setInstance(new SharedAssets()); 
    }
    else {
      Map sharedAssetsMap = jsonDecode(sharedAssetsJson);
      SharedAssets.setInstance(SharedAssets.fromJson(sharedAssetsMap));
    }
  }

  void writeSharedAssets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> json = SharedAssets.getInstance().toJson();
    String jsonString = jsonEncode(json);

    prefs.setString("SHARED_ASSETS", jsonString);
  }

  @override
  void initState() {
    // 애플리케이션 구성 요소를 초기화합니다.
    super.initState();
    readSharedAssets();
  }

  @override
  void dispose() {
    // 애플리케이션 구성 요소를 저장, 제거합니다.
    writeSharedAssets();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: ChangeNotifierProvider 구현하기.
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: widget.pages,
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
