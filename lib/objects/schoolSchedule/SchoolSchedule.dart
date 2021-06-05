import 'package:json_annotation/json_annotation.dart';
part 'SchoolSchedule.g.dart';

/// 학사정보를 저장합니다.
@JsonSerializable()
class SchoolSchedule {
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

  /// 수업공제일명
  late String feature = "";
  /// 학사일자
  late DateTime date = DateTime.utc(2000, 1, 1);

  /// 행사명
  late String eventName = "";
  /// 행사내용
  late String eventDetails = "";
  /// 1학년행사여부
  late bool isFirstGradeEvent = false;
  /// 2학년행사여부
  late bool isSecondGradeEvent = false;
  /// 3학년행사야부
  late bool isThirdGradeEvent = false;
  /// 4학년행사여부
  late bool isFourthGradeEvent = false;
  /// 5학년행사여부
  late bool isFifthGradeEvent = false;
  /// 6학년행사여부
  late bool isSixthGradeEvent = false;

  /// 적재일시
  late DateTime uploadTime = DateTime.utc(2000, 1, 1);

  // Constructor
  SchoolSchedule.initial();

  // JSON Serializer/Deserializer
  SchoolSchedule(this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.targetYear, this.feature, this.date, this.eventName, this.eventDetails, this.isFirstGradeEvent, this.isSecondGradeEvent, this.isThirdGradeEvent, this.isFourthGradeEvent, this.isFifthGradeEvent, this.isSixthGradeEvent, this.uploadTime);

  factory SchoolSchedule.fromJson(Map<String, dynamic> json) => _$SchoolScheduleFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolScheduleToJson(this);
}