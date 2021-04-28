import 'package:my_school/objects/timeTable/GeneralTimeTable.dart';

/// 고등학교 시간표 자료를 저장하는 클래스입니다.
class HighSchoolTimeTable extends GeneralTimeTable {
  /// 주야과정명
  String dayOrNight;
  /// 계열명
  String fieldName;
  /// 학과명
  String departmentName;

  /// 강의실명
  String classroomName;
}