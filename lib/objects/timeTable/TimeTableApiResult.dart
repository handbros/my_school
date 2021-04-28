import 'package:my_school/objects/timeTable/GeneralTimeTable.dart';
import 'package:my_school/objects/ResultCode.dart';

class TimeTableApiResult {
  ResultCode resultCode = ResultCode.None;
  String resultMessage = "";
  int itemsTotalCount = 0;
  List<GeneralTimeTable> items = List<GeneralTimeTable>.empty(growable: true); // 아이템들을 저장할 리스트. growable 사용 시 가변 길이 리스트로 초기화 됨.
}