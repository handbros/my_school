import 'package:json_annotation/json_annotation.dart';
import 'package:my_school/objects/timeTable/GeneralTimeTable.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/objects/SchoolType.dart';
part 'TimeTableApiResult.g.dart';

@JsonSerializable(explicitToJson: true)
class TimeTableApiResult {
  late String requestUrl = "";
  late ResultCode resultCode = ResultCode.None;
  late String resultMessage = "";
  late int itemsTotalCount = 0;
  late SchoolType schoolType = SchoolType.None;
  late List<GeneralTimeTable> items = List<GeneralTimeTable>.empty(growable: true); // 아이템들을 저장할 리스트. growable 사용 시 가변 길이 리스트로 초기화 됨.

  // Constructor
  TimeTableApiResult.initial();

  // JSON Serializer/Deserializer
  TimeTableApiResult(this.requestUrl, this.resultCode, this.resultMessage, this.itemsTotalCount, this.items);

  factory TimeTableApiResult.fromJson(Map<String, dynamic> json) => _$TimeTableApiResultFromJson(json);
  Map<String, dynamic> toJson() => _$TimeTableApiResultToJson(this);
}