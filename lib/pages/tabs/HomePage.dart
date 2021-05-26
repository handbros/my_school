import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/widgets/EmptyAppBar.dart';
import 'package:styled_widget/styled_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TODO: 디자인 스타일 통일시키기.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: EmptyAppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // TODO: 로고 추가하기.
            UserCard(),
            Padding(padding: EdgeInsets.only(top: 10)),
            ActionsRow(),
            // TODO: 각 페이지별 진입 버튼 추가하기.
          ],
        ),
      )
    );
  }
}

class UserCard extends StatelessWidget {
  // TODO: StatefulWidget으로 전환하기.
  Widget _buildUserRow(BuildContext context) {
    return <Widget>[
      Icon(Icons.school_outlined, color: Theme.of(context).primaryColor,)
          .constrained(height: 50, width: 50)
          .padding(right: 16),
      <Widget>[
        Text(
          '강북고등학교',
          style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ).padding(bottom: 4),
        Text(
          '2학년 10반',
          style: TextStyle(
            color: Theme.of(context).hintColor.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
    ].toRow();
  }

  @override
  Widget build(BuildContext context) {
    return <Widget>[_buildUserRow(context)]
        .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
        .padding(horizontal: 20, vertical: 10)
        .decorated(
        color: Theme.of(context).bottomAppBarColor, borderRadius: BorderRadius.circular(20))
        .elevation(
      5,
      shadowColor: Theme.of(context).shadowColor,
      borderRadius: BorderRadius.circular(20),
    )
        .height(100)
        .alignment(Alignment.center);
  }
}

class ActionsRow extends StatelessWidget {
  Widget _buildActionItem(String name, IconData icon) {
    final Widget actionIcon = Icon(icon, size: 20, color: Color(0xFF42526F))
        .alignment(Alignment.center)
        .constrained(width: 50, height: 50)
        .backgroundColor(Color(0xfff6f5f8))
        .clipOval()
        .padding(bottom: 5);

    final Widget actionText = Text(
      name,
      style: TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: 13,
      ),
    );

    return InkWell(
      onTap: () {
        print("click");
      },
      child: <Widget>[
        actionIcon,
        actionText,
      ].toColumn().padding(all: 10),
    );
  }

  @override
  Widget build(BuildContext context) => <Widget>[
    _buildActionItem('학교 정보', LineIcons.info),
    _buildActionItem('학사일정', LineIcons.book),
    _buildActionItem('시간표', LineIcons.calendarTimes),
    _buildActionItem('급식표', LineIcons.goodreads),
  ].toRow(mainAxisAlignment: MainAxisAlignment.spaceAround);
}