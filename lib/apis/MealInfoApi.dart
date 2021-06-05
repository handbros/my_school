import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/ReportBox.dart';
import 'package:my_school/objects/reports/ReportItem.dart';
import 'package:my_school/objects/reports/ReportType.dart';
import 'package:my_school/objects/mealInfo/MealInfo.dart';
import 'package:my_school/objects/mealInfo/MealInfoApiResult.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/utilities/StringFormatter.dart';

/// 급식 정보를 확인하기 위한 API을(를) 제공하는 클래스입니다. API 호출에는 [getApiResult]을(를) 사용해주십시오.
class MealInfoApi {
  Future<MealInfoApiResult> getApiResult(String officeCode, int standardSchoolCode, {int index = 1, int size = 100, String? date, int? mealCode} ) async {
    // API 호출을 위한 쿼리 값들을 초기화.
    var queryParameters = {
      'KEY': SharedAssets.apiKey,
      'Type': 'json',
      'pIndex': index.toString(),
      'pSize': size.toString(),
      'ATPT_OFCDC_SC_CODE': officeCode,
      'SD_SCHUL_CODE': standardSchoolCode.toString(),
      'MLSV_YMD': date,
      'MMEAL_SC_CODE': mealCode?.toString(),
    };

    MealInfoApiResult result = new MealInfoApiResult.initial();
    result.requestUrl = "";
    result.resultCode = ResultCode.None;
    result.resultMessage = "";
    result.itemsTotalCount = 0;
    result.items = List<MealInfo>.empty(growable: true);

    try {
      var response = await http.get(Uri.https(SharedAssets.apiDomain, SharedAssets.mealInfoApiPath, queryParameters)); // API 호출 후 데이터 저장.
      final json = jsonDecode(response.body); // 응답 받은 정보를 JSON 포맷으로 변환.

      result.requestUrl = response.request!.url.toString();

      // API 호출 결과 코드를 가져옴.
      try {
        String resultCodeString = json["mealServiceDietInfo"][0]["head"][1]["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["mealServiceDietInfo"][0]["head"][1]["RESULT"]["MESSAGE"].toString();
      }
      catch(e) {
        // 오류 발생 시에는 다른 구조의 JSON이 반환됨. 예외 발생 시 이를 처리함.
        String resultCodeString = json["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["RESULT"]["MESSAGE"].toString();
      }


      if (result.resultCode == ResultCode.Okay) {
        // 전체 아이템 수를 가져옴.
        result.itemsTotalCount = json["mealServiceDietInfo"][0]["head"][0]["list_total_count"];

        // 데이터를 필요한 형태로 재가공.
        List<dynamic> items = json["mealServiceDietInfo"][1]["row"];

        items.forEach((item) {
          MealInfo temp = new MealInfo.initial();
          temp.officeCode = item["ATPT_OFCDC_SC_CODE"];
          temp.officeName = item["ATPT_OFCDC_SC_NM"];

          temp.standardSchoolCode = int.parse(item["SD_SCHUL_CODE"]);
          temp.schoolName = item["SCHUL_NM"];

          temp.date = DateTime.parse(item["MLSV_YMD"]);

          temp.mealCode = int.parse(item["MMEAL_SC_CODE"]);
          temp.mealName = item["MMEAL_SC_NM"];


          temp.menu = StringFormatter.lineBreakToEscapeSequence(item["DDISH_NM"]);
          temp.calorie = item["CAL_INFO"];
          temp.origins = StringFormatter.lineBreakToEscapeSequence(item["ORPLC_INFO"]);
          temp.nutrients = StringFormatter.lineBreakToEscapeSequence(item["NTR_INFO"]);

          result.items.add(temp);
        });

        ReportBox.getInstance().addReport(new ReportItem(ReportType.SUCCEED, "MEAL INFO API", "CODE : ${result.resultCode}\nMESSAGE : ${result.resultMessage}\nREQUEST URL : ${result.requestUrl}"));
      }
      else {
        ReportBox.getInstance().addReport(new ReportItem(ReportType.EXCEPTION, "MEAL INFO API", "CODE : ${result.resultCode}\nMESSAGE : ${result.resultMessage}\nREQUEST URL : ${result.requestUrl}"));
      }
    } catch (e) {
      result.resultCode = ResultCode.Exception;
      result.resultMessage = e.toString();

      ReportBox.getInstance().addReport(new ReportItem(ReportType.ERROR, "MEAL INFO API", "CODE : ${result.resultCode}\nMESSAGE : ${result.resultMessage}\nREQUEST URL : ${result.requestUrl}"));
    }

    return result;
  }
}