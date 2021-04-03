/// 식단 정보를 저장하는 클래스입니다.
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

  /// 식사코드
  int mealCode;
  /// 식사명
  String mealName;
  /// 칼로리정보
  String calorie;
  /// 요리명
  List<String> menuList;
  /// 원산지정보
  String origins;
  /// 영양정보
  String nutrients;
}