import 'package:json_annotation/json_annotation.dart';
part 'MealInfo.g.dart';

/// 식단 정보를 저장하는 클래스입니다.
@JsonSerializable()
class MealInfo {
  /// 시도교육청코드
  late String officeCode = "";
  /// 시도교육청명
  late String officeName = "";
  /// 표준학교코드
  late int standardSchoolCode;
  /// 학교명
  late String schoolName = "";

  /// 식사코드
  late int mealCode = 0;
  /// 식사명
  late String mealName = "";

  /// 급식일자
  late DateTime date = DateTime.utc(2000, 1, 1);

  /// 요리명
  late String menu = "";
  /// 칼로리정보
  late String calorie = "";
  /// 원산지정보
  late String origins = "";
  /// 영양정보
  late String nutrients = "";

  // Constructor
  MealInfo.initial();

  // JSON Serializer/Deserializer
  MealInfo(this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.mealCode, this.mealName, this.date, this.menu, this.calorie, this.origins, this.nutrients);

  factory MealInfo.fromJson(Map<String, dynamic> json) => _$MealInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MealInfoToJson(this);
}