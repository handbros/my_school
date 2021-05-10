import 'package:flutter/material.dart';
import 'package:my_school/notifiers/ClassChangeNotifier.dart';
import 'package:my_school/screens/SplashScreen.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ClassChangeNotifier(List<ClassInfo>.empty(), new ClassInfo()),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My school',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        brightness: Brightness.light
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.blue,
        brightness: Brightness.dark
      ),
      home: SplashScreen(),
    );
  }
}
