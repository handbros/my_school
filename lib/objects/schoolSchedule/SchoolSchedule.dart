class SchoolSchedule {
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

  /// 수업공제일명
  String feature;
  /// 학사일자
  DateTime date;

  /// 행사명
  String eventName;
  /// 행사내용
  String eventDetails;
  /// 1학년행사여부
  bool isFirstGradeEvent;
  /// 2학년행사여부
  bool isSecondGradeEvent;
  /// 3학년행사야부
  bool isThirdGradeEvent;
  /// 4학년행사여부
  bool isFourthGradeEvent;
  /// 5학년행사여부
  bool isFifthGradeEvent;
  /// 6학년행사여부
  bool isSixthGradeEvent;

  /// 적재일시
  DateTime uploadTime;
}