import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("설정", style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
            fontWeight: FontWeight.w200
        )),
        elevation: 2,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        centerTitle: true,
      ),
    );
  }
}
