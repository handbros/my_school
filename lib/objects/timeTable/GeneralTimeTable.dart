import 'package:json_annotation/json_annotation.dart';
part 'GeneralTimeTable.g.dart';

/// 일반화 된 시간표 객체입니다. 모든 종류의 학교에서 공통적으로 사용됩니다.
@JsonSerializable()
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

  // JSON Serializer/Deserializer
  GeneralTimeTable({this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.targetYear, this.semester, this.date, this.grade, this.className, this.period, this.content, this.curriculum, this.classroomName, this.uploadTime});

  factory GeneralTimeTable.fromJson(Map<String, dynamic> json) => _$GeneralTimeTableFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralTimeTableToJson(this);
}