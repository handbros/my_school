import 'package:json_annotation/json_annotation.dart';
part 'GeneralTimeTable.g.dart';

/// 일반화 된 시간표 객체입니다. 모든 종류의 학교에서 공통적으로 사용됩니다.
@JsonSerializable()
class GeneralTimeTable {
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
  /// 학기
  late int semester = 0;

  /// 시간표일자
  late DateTime date = DateTime.utc(2000, 1, 1);

  /// 학년
  late int grade = 0;
  /// 반명
  late String className = "";
  /// 교시
  late int period;
  /// 수업내용
  late String content = "";

  /// 학교과정명(고등학교 및 특수학교 시간표에서만 사용됨)
  late String curriculum = "";
  /// 강의실명(고등학교 및 특수학교 시간표에서만 사용됨)
  late String classroomName = "";

  /// 적재일시
  late DateTime uploadTime = DateTime.utc(2000, 1, 1);

  // Constructor
  GeneralTimeTable.initial();

  // JSON Serializer/Deserializer
  GeneralTimeTable(this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.targetYear, this.semester, this.date, this.grade, this.className, this.period, this.content, this.curriculum, this.classroomName, this.uploadTime);

  factory GeneralTimeTable.fromJson(Map<String, dynamic> json) => _$GeneralTimeTableFromJson(json);
  Map<String, dynamic> toJson() => _$GeneralTimeTableToJson(this);
}