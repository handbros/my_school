import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class SchoolSchedulePage extends StatefulWidget {
  @override
  _SchoolSchedulePageState createState() => _SchoolSchedulePageState();
}

class _SchoolSchedulePageState extends State<SchoolSchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("학사일정", style: TextStyle(
              color: Theme.of(context).hintColor,
              fontSize: 18,
              fontWeight: FontWeight.w200
          )),
          elevation: 2,
          backgroundColor: Theme.of(context).bottomAppBarColor,
          centerTitle: true,
          leading: IconButton(
              icon: Icon(LineIcons.arrowLeft),
              color: Theme.of(context).hintColor,
              onPressed: () {
                Navigator.pop(context);
              }
          ),
        )
    );
  }
}