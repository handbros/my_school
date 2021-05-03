import 'package:flutter/material.dart';

class TextViewerPage extends StatefulWidget {
  @override
  _TextViewerPageState createState() => _TextViewerPageState();
}

class _TextViewerPageState extends State<TextViewerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TextViewer", style: TextStyle(
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
