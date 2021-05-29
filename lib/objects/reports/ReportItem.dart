import 'ReportType.dart';

/// 보고서 내용을 저장하는 클래스입니다.
class ReportItem {
  DateTime dateTime;
  ReportType type;
  String title;
  String content;

  ReportItem(ReportType type, String title, String content) {
    this.dateTime = DateTime.now();
    this.type = type;
    this.title = title;
    this.content = content;
  }
}