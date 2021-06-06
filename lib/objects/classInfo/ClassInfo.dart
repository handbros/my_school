import 'package:json_annotation/json_annotation.dart';
part 'ClassInfo.g.dart';

/// 반 정보를 저장하는 클래스입니다.
@JsonSerializable()
class ClassInfo {
  /// 시도교육청코드
  late String officeCode = "";
  /// 시도교육청명
  late String officeName = "";
  /// 표준학교코드
  late int standardSchoolCode = 0;
  /// 학교명
  late String schoolName = "";

  /// 학년도
  late int targetYear = 0;
  /// 학년
  late int grade = 0;

  /// 주야과정명
  late String? dayOrNight = "";
  /// 학교과정명
  late String? schoolType = "";

  /// 계열명
  late String? fieldName = "";
  /// 학과명
  late String? departmentName = "";
  /// 반명
  late String className = "";

  /// 적재일시
  late DateTime uploadTime = DateTime.utc(2000, 1, 1);

  // Constructor
  ClassInfo.initial();

  // JSON Serializer/Deserializer
  ClassInfo(this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.targetYear, this.grade, this.dayOrNight, this.schoolType, this.fieldName, this.departmentName, this.className, this.uploadTime);

  factory ClassInfo.fromJson(Map<String, dynamic> json) => _$ClassInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ClassInfoToJson(this);
}