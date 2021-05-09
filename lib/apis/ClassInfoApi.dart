import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:my_school/objects/classInfo/ClassInfoApiResult.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/utilities/StringFormatter.dart';

class ClassInfoApi {
  Future<ClassInfoApiResult> getClassInfo(String officeCode, int standardSchoolCode, {int index = 1, int size = 100, int targetYear, int grade} ) async {
    // API 호출을 위한 쿼리 값들을 초기화.
    var queryParameters = {
      'KEY': SharedAssets.apiKey,
      'Type': 'json',
      'pIndex': index.toString(),
      'pSize': size.toString(),
      'ATPT_OFCDC_SC_CODE': officeCode,
      'SD_SCHUL_CODE': standardSchoolCode.toString(),
    };

    // Null Reference Exception 체크.
    if (targetYear != null) {
      var queryParamTemp = {
        'AY': targetYear.toString()
      };

      queryParameters.addAll(queryParamTemp);
    }

    if (grade != null) {
      var queryParamTemp = {
        'GRADE': grade.toString()
      };

      queryParameters.addAll(queryParamTemp);
    }

    ClassInfoApiResult result = new ClassInfoApiResult();

    try {
      var response = await http.get(Uri.https(SharedAssets.apiDomain, SharedAssets.classInfoApiPath, queryParameters)); // API 호출 후 데이터 저장.
      final json = jsonDecode(response.body); // 응답 받은 정보를 JSON 포맷으로 변환.

      result.requestUrl = response.request.url.toString();

      // API 호출 결과 코드를 가져옴.
      try {
        String resultCodeString = json["classInfo"][0]["head"][1]["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["classInfo"][0]["head"][1]["RESULT"]["MESSAGE"].toString();
      }
      catch(e) {
        // 오류 발생 시에는 다른 구조의 JSON이 반환됨. 예외 발생 시 이를 처리함.
        String resultCodeString = json["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["RESULT"]["MESSAGE"].toString();
      }


      if (result.resultCode == ResultCode.Okay) {
        // 전체 아이템 수를 가져옴.
        result.itemsTotalCount = json["classInfo"][0]["head"][0]["list_total_count"];

        // 데이터를 필요한 형태로 재가공.
        List<dynamic> items = json["classInfo"][1]["row"];

        items.forEach((item) {
          ClassInfo temp = new ClassInfo();
          temp.officeCode = item["ATPT_OFCDC_SC_CODE"];
          temp.officeName = item["ATPT_OFCDC_SC_NM"];

          temp.standardSchoolCode = int.parse(item["SD_SCHUL_CODE"]);
          temp.schoolName = item["SCHUL_NM"];

          temp.targetYear = int.parse(item["AY"]);
          temp.grade = int.parse(item["GRADE"]);

          temp.dayOrNight = item["DGHT_CRSE_SC_NM"];
          temp.schoolType = item["SCHUL_CRSE_SC_NM"];

          temp.fieldName = item["ORD_SC_NM"];
          temp.departmentName = item["DDDEP_NM"];
          temp.className = item["CLASS_NM"];

          temp.uploadTime = DateTime.parse(StringFormatter.stringToParsableDateTimeString(item["LOAD_DTM"]));

          result.items.add(temp);
        });
      }
    } catch (e) {
      result.resultCode = ResultCode.Exception;
      result.resultMessage = e.toString();
    }

    return result;
  }
}