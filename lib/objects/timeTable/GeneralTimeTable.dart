/// 시간표 개별 객체의 기초 클래스이자, 초등학교 시간표 자료를 저장하는 클래스입니다.
class GeneralTimeTable {
  /// 시도교육청코드
  String officeCode;
  /// 시도교육청명
  String officeName;
  /// 표준학교코드
  int standardSchoolCode;
  /// 학교명
  String schoolName;

  /// 학년도
  int targetYear;
  /// 학기
  int semester;

  /// 시간표일자
  DateTime date;

  /// 학년
  int grade;
  /// 반명
  String className;
  /// 교시
  int period;
  /// 수업내용
  String content;

  /// 학교과정명(고등학교 및 특수학교 시간표에서만 사용됨)
  String curriculum;
  /// 강의실명(고등학교 및 특수학교 시간표에서만 사용됨)
  String classroomName;

  /// 적재일시
  DateTime uploadTime;
}