import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/pages/tabs/HomePage.dart';
import 'package:my_school/pages/tabs/ExplorerPage.dart';
import 'package:my_school/pages/tabs/SettingsPage.dart';

class MainScreen extends StatefulWidget {
  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  final _pageViewController = PageController(initialPage: 1);
  final List<Widget> _pages = [ExplorerPage(), HomePage(), SettingsPage()];
  int _tabIndex = 1;

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
        child: BottomNavigationBar(
          showUnselectedLabels: false,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(LineIcons.search),
              label: '탐색',
            ), BottomNavigationBarItem(
              icon: Icon(LineIcons.home),
              label: '홈',
            ),
            BottomNavigationBarItem(
              icon: Icon(LineIcons.cog),
              label: '설정',
            ),
          ],
          currentIndex: _tabIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Theme.of(context).hintColor,
          onTap: (int index) {
            setState(() {
              _pageViewController.animateToPage(index, duration: Duration(milliseconds: 200), curve: Curves.bounceOut);
            });
          },
        ),
      )
    );
  }
}
