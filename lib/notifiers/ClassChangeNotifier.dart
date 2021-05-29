import 'package:flutter/material.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/ReportBox.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:my_school/objects/reports/ReportItem.dart';
import 'package:my_school/objects/reports/ReportType.dart';

/// 반 정보가 변경되었음을 알리기 위한 ChangeNotifier 구현체 클래스입니다.
class ClassChangeNotifier with ChangeNotifier {
  getClassList() => SharedAssets.getInstance().classList;
  getSelectedClass() => SharedAssets.getInstance().selectedClass;

  /// 반 정보가 변경되었음을 리스너들에게 공지합니다.
  void notifyClassChanged() {
    notifyListeners();

    ClassInfo selectedClass = (getSelectedClass() as ClassInfo);
    ReportBox.getInstance().addReport(new ReportItem(ReportType.INFO, "CLASS CHANGE NOTIFIER", "Class information is changed.\nSTANDARD SCHOOL CODE : ${selectedClass.standardSchoolCode}\nSELECTED CLASS : ${selectedClass.schoolName} ${selectedClass.grade}학년 ${selectedClass.className}반"));
  }
}