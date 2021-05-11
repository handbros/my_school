import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("홈", style: TextStyle(
          color: Theme.of(context).hintColor,
          fontSize: 18,
          fontWeight: FontWeight.w200
        )),
        elevation: 2,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
