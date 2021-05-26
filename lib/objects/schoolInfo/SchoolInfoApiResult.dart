import 'package:json_annotation/json_annotation.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfo.dart';
import 'package:my_school/objects/ResultCode.dart';
part 'SchoolInfoApiResult.g.dart';

@JsonSerializable(explicitToJson: true)
class SchoolInfoApiResult {
  String requestUrl = "";
  ResultCode resultCode = ResultCode.None;
  String resultMessage = "";
  int itemsTotalCount = 0;
  List<SchoolInfo> items = List<SchoolInfo>.empty(growable: true); // 아이템들을 저장할 리스트. growable 사용 시 가변 길이 리스트로 초기화 됨.

  // JSON Serializer/Deserializer
  SchoolInfoApiResult({this.requestUrl, this.resultCode, this.resultMessage, this.itemsTotalCount, this.items});

  factory SchoolInfoApiResult.fromJson(Map<String, dynamic> json) => _$SchoolInfoApiResultFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolInfoApiResultToJson(this);
}