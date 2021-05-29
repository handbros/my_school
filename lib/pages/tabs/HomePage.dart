import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/notifiers/ClassChangeNotifier.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:my_school/pages/menus/MealPage.dart';
import 'package:my_school/pages/menus/SchoolInfoPage.dart';
import 'package:my_school/pages/menus/SchoolSchedulePage.dart';
import 'package:my_school/pages/menus/TimeTablePage.dart';
import 'package:my_school/widgets/EmptyAppBar.dart';
import 'package:my_school/widgets/MenuButton.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: 디자인 스타일 통일시키기.

  @override
  Widget build(BuildContext context) {
    final notifier = Provider.of<ClassChangeNotifier>(context);

    return Scaffold(
      appBar: EmptyAppBar(),
      body: (notifier.getSelectedClass() as ClassInfo)?.schoolName == null ? nullContent() : homePageContent(context)
    );
  }

  /// 탐색 가능한 반이 없을 경우 표시되는 컨텐츠입니다.
  Widget nullContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Center(
            child: Icon(LineIcons.exclamationCircle, size: 30,)
        ),
        Center(
          child: Text(
            "탐색 탭에서 학반 정보를 추가해주세요.",
          ),
        )
      ],
    );
  }

  /// 탐색 가능한 반이 있을 경우 표시되는 컨텐츠입니다.
  Widget homePageContent(BuildContext context) {
    final notifier = Provider.of<ClassChangeNotifier>(context);
    var classInfo = (notifier.getClassList() as List<ClassInfo>).length > 0 ? notifier.getClassList()[0] as ClassInfo : null;

    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // 반 정보 카드
            Card(
              color: Color(0xff3977ff),
              elevation: 2,
              child: Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            LineIcons.graduationCap,
                            size: 20,
                            color: Colors.white,
                          ),
                          Padding(padding: EdgeInsets.only(left: 8)),
                          Text(
                            classInfo.schoolName.length > 16 ? "${classInfo.schoolName.substring(0, 16)}..." : "${classInfo.schoolName}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                    ),
                    Divider(color: Colors.white, thickness: 0.4),
                    Padding(
                      padding: EdgeInsets.only(left: 20, top: 8, bottom: 8),
                      child: Text(
                        "${classInfo.grade}학년 ${classInfo.className}반",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.8),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // 메뉴 버튼
            Padding(
              padding: EdgeInsets.only(left: 4, top: 10, right: 4),
              child: Column(
                children: [
                  MenuButton(
                    icon: LineIcons.info,
                    iconBackgroundColor: Color(0xff3977ff),
                    title: "학교 정보",
                    description: "학교 정보를 확인합니다.",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolInfoPage()));
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 14)),
                  MenuButton(
                    icon: LineIcons.calendar,
                    iconBackgroundColor: Color(0xff3977ff),
                    title: "학사일정",
                    description: "학사일정을 확인합니다.",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SchoolSchedulePage()));
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 14)),
                  MenuButton(
                    icon: LineIcons.clock,
                    iconBackgroundColor: Color(0xff3977ff),
                    title: "시간표",
                    description: "시간표를 확인합니다.",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => TimeTablePage()));
                    },
                  ),
                  Padding(padding: EdgeInsets.only(top: 14)),
                  MenuButton(
                    icon: LineIcons.utensils,
                    iconBackgroundColor: Color(0xff3977ff),
                    title: "식단표",
                    description: "식단표를 확인합니다.",
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MealPage()));
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}