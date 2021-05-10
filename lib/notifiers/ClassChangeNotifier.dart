import 'package:flutter/material.dart';
import 'package:my_school/SharedAssets.dart';

class ClassChangeNotifier with ChangeNotifier {
  getClassList() => SharedAssets.getInstance().classList;
  getSelectedClass() => SharedAssets.getInstance().selectedClass;

  void notifyClassChanged() {
    notifyListeners();
  }
}