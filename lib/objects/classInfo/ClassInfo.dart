import 'package:json_annotation/json_annotation.dart';
part 'ClassInfo.g.dart';

/// 반 정보를 저장하는 클래스입니다.
@JsonSerializable()
class ClassInfo {
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
  /// 학년
  int grade;

  /// 주야과정명
  String dayOrNight;
  /// 학교과정명
  String schoolType;

  /// 계열명
  String fieldName;
  /// 학과명
  String departmentName;
  /// 반명
  String className;

  /// 적재일시
  DateTime uploadTime;

  // JSON Serializer/Deserializer
  ClassInfo({this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.targetYear, this.grade, this.dayOrNight, this.schoolType, this.fieldName, this.departmentName, this.className, this.uploadTime});

  factory ClassInfo.fromJson(Map<String, dynamic> json) => _$ClassInfoFromJson(json);
  Map<String, dynamic> toJson() => _$ClassInfoToJson(this);
}