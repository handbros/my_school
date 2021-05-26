import 'package:json_annotation/json_annotation.dart';
import 'package:my_school/objects/schoolSchedule/SchoolSchedule.dart';
import 'package:my_school/objects/ResultCode.dart';
part 'SchoolScheduleApiResult.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolScheduleApiResult {
  String requestUrl = "";
  ResultCode resultCode = ResultCode.None;
  String resultMessage = "";
  int itemsTotalCount = 0;
  List<SchoolSchedule> items = List<SchoolSchedule>.empty(growable: true); // 아이템들을 저장할 리스트. growable 사용 시 가변 길이 리스트로 초기화 됨.

  // JSON Serializer/Deserializer
  SchoolScheduleApiResult({this.requestUrl, this.resultCode, this.resultMessage, this.itemsTotalCount, this.items});

  factory SchoolScheduleApiResult.fromJson(Map<String, dynamic> json) => _$SchoolScheduleApiResultFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolScheduleApiResultToJson(this);
}