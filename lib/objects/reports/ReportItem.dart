import 'ReportType.dart';

/// 보고서 내용을 저장하는 클래스입니다.
class ReportItem {
  late DateTime dateTime = DateTime.utc(2000, 1, 1);
  late ReportType type = ReportType.INFO;
  late String title = "";
  late String content = "";

  ReportItem(ReportType type, String title, String content) {
    this.dateTime = DateTime.now();
    this.type = type;
    this.title = title;
    this.content = content;
  }
}