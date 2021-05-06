import 'package:json_annotation/json_annotation.dart';
part 'MealInfo.g.dart';

/// 식단 정보를 저장하는 클래스입니다.
@JsonSerializable()
class MealInfo {
  /// 시도교육청코드
  String officeCode;
  /// 시도교육청명
  String officeName;
  /// 표준학교코드
  int standardSchoolCode;
  /// 학교명
  String schoolName;

  /// 식사코드
  int mealCode;
  /// 식사명
  String mealName;

  /// 급식일자
  DateTime date;

  /// 요리명
  String menu;
  /// 칼로리정보
  String calorie;
  /// 원산지정보
  String origins;
  /// 영양정보
  String nutrients;

  // JSON Serializer/Deserializer
  MealInfo({this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.mealCode, this.mealName, this.date, this.menu, this.calorie, this.origins, this.nutrients});

  factory MealInfo.fromJson(Map<String, dynamic> json) => _$MealInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MealInfoToJson(this);
}