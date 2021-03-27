class DietInfo {
  /// 시도교육청코드
  String officeCode;
  /// 시도교육청명
  String officeName;
  /// 표준학교코드
  int standardSchoolCode;
  /// 학교명
  String schoolName;

  /// 급식일자
  DateTime date;
  /// 급식시작일자
  DateTime startDate;
  /// 급식종료일자
  DateTime endDate;

  /// 식사코드
  int mealCode;
  /// 식사명
  String mealName;
  /// 급식인원수
  int numberOfDiner;
  /// 칼로리정보
  String calorie;
  /// 요리명
  List<String> menuList;
  ///원산지정보
  String origins;
  /// 영양정보
  String nutrients;
}