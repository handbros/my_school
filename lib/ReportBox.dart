import 'package:my_school/objects/reports/ReportItem.dart';

class ReportBox {
  // 싱글톤 패턴 구현을 위한 정적 클래스.
  static ReportBox _instance = new ReportBox.initial();

  factory ReportBox.getInstance() {
    return _instance;
  }

  /// ReportBox 의 초기 인스턴스를 반환합니다.
  ReportBox.initial() {
    // 클래스 초기화 코드
    _reports = List<ReportItem>.empty(growable: true);
  }

  // 리포트 관련 변수
  List<ReportItem> _reports;

  /// 보고서 리스트를 가져옵니다.
  List<ReportItem> get getReports => _reports;

  // 리포트 관련 메소드
  /// 보고서를 추가합니다.
  void addReport(ReportItem report) {
    _reports.insert(0, report);
  }

  /// 보고서 목록을 초기화합니다.
  void resetReports() {
    _reports = List<ReportItem>.empty(growable: true);
  }
}