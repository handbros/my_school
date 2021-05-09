import 'package:flutter/material.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';

class ClassChangeNotifier with ChangeNotifier {
  List<ClassInfo> _classList = List<ClassInfo>.empty(growable: true);
  ClassInfo _selectedClass = new ClassInfo();

  ClassChangeNotifier(this._classList, this._selectedClass);

  getClassList() => _classList;
  getSelectedClass() => _selectedClass;

  void notifyClassListChanged(List<ClassInfo> classList) {
    _classList = classList;
    notifyListeners();
  }

  void notifySelectedClassChanged(ClassInfo selectedClass) {
    _selectedClass = selectedClass;
    notifyListeners();
  }
}