import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';


class TimeTablePage extends StatefulWidget {
  @override
  _TimeTablePageState createState() => _TimeTablePageState();
}

class _TimeTablePageState extends State<TimeTablePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("시간표", style: TextStyle(
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
      ),
      body: Column(),
    );
  }
}
