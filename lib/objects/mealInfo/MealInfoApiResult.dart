import 'package:my_school/objects/mealInfo/MealInfo.dart';
import 'package:my_school/objects/ResultCode.dart';

class MealInfoApiResult {
  String requestUrl = "";
  ResultCode resultCode = ResultCode.None;
  String resultMessage = "";
  int itemsTotalCount = 0;
  List<MealInfo> items = List<MealInfo>.empty(growable: true); // 아이템들을 저장할 리스트. growable 사용 시 가변 길이 리스트로 초기화 됨.
}