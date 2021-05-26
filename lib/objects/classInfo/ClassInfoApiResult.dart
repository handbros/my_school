import 'package:json_annotation/json_annotation.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:my_school/objects/ResultCode.dart';
part 'ClassInfoApiResult.g.dart';

@JsonSerializable(explicitToJson: true)
class ClassInfoApiResult {
  String requestUrl = "";
  ResultCode resultCode = ResultCode.None;
  String resultMessage = "";
  int itemsTotalCount = 0;
  List<ClassInfo> items = List<ClassInfo>.empty(growable: true); // 아이템들을 저장할 리스트. growable 사용 시 가변 길이 리스트로 초기화 됨.

  // JSON Serializer/Deserializer
  ClassInfoApiResult({this.requestUrl, this.resultCode, this.resultMessage, this.itemsTotalCount, this.items});

  factory ClassInfoApiResult.fromJson(Map<String, dynamic> json) => _$ClassInfoApiResultFromJson(json);
  Map<String, dynamic> toJson() => _$ClassInfoApiResultToJson(this);
}