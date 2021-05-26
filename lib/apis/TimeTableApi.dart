import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/objects/timeTable/GeneralTimeTable.dart';
import 'package:my_school/objects/timeTable/TimeTableApiResult.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/objects/SchoolType.dart';
import 'package:my_school/utilities/StringFormatter.dart';

/// 시간표를 확인하기 위한 API을(를) 제공하는 클래스입니다. API 호출에는 [getApiResult]을(를) 사용해주십시오.
class TimeTableApi {
  Future<TimeTableApiResult> getApiResult(String officeCode, int standardSchoolCode, SchoolType schoolType, {int index = 1, int size = 100, int targetYear, int semester, int grade, String className, String date, String from, String to} ) async {
    // API 호출을 위한 쿼리 값들을 초기화.
    var queryParameters = {
      'KEY': SharedAssets.apiKey,
      'Type': 'json',
      'pIndex': index.toString(),
      'pSize': size.toString(),
      'ATPT_OFCDC_SC_CODE': officeCode,
      'SD_SCHUL_CODE': standardSchoolCode.toString(),
      'AY': targetYear?.toString(),
      'SEM': semester?.toString(),
      'GRADE': grade?.toString(),
      'CLASS_NM': className,
      'ALL_TI_YMD': date,
      'TI_FROM_YMD': from,
      'TI_TO_YMD': to,
    };

    TimeTableApiResult result = new TimeTableApiResult();

    try {
      // SchoolType 열거형을 사용하여 각급 학교 별 API PATH 및 루트 명을 초기화.
      String apiPath;
      String apiRootName;

      result.schoolType = schoolType;

      if (schoolType == SchoolType.Elementary) {
        apiPath = SharedAssets.elementarySchoolTimeTableApiPath;
        apiRootName = "elsTimetable";
      }
      else if (schoolType == SchoolType.Middle) {
        apiPath = SharedAssets.middleSchoolTimeTableApiPath;
        apiRootName = "misTimetable";
      }
      else if (schoolType == SchoolType.High) {
        apiPath = SharedAssets.highSchoolTimeTableApiPath;
        apiRootName = "hisTimetable";
      }
      else if (schoolType == SchoolType.Special) {
        apiPath = SharedAssets.specialSchoolTimeTableApiPath;
        apiRootName = "spsTimetable";
      }
      else {
        result.resultCode = ResultCode.Exception;
        result.resultMessage = "학교 종류에 대한 정보를 불러올 수 없습니다.";
        return result;
      }

      var response = await http.get(Uri.https(SharedAssets.apiDomain, apiPath, queryParameters)); // API 호출 후 데이터 저장.
      final json = jsonDecode(response.body); // 응답 받은 정보를 JSON 포맷으로 변환.

      result.requestUrl = response.request.url.toString();

      // API 호출 결과 코드를 가져옴.
      try {
        String resultCodeString = json[apiRootName][0]["head"][1]["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json[apiRootName][0]["head"][1]["RESULT"]["MESSAGE"].toString();
      }
      catch(e) {
        // 오류 발생 시에는 다른 구조의 JSON이 반환됨. 예외 발생 시 이를 처리함.
        String resultCodeString = json["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["RESULT"]["MESSAGE"].toString();
      }


      if (result.resultCode == ResultCode.Okay) {
        // 전체 아이템 수를 가져옴.
        result.itemsTotalCount = json[apiRootName][0]["head"][0]["list_total_count"];

        // 데이터를 필요한 형태로 재가공.
        List<dynamic> items = json[apiRootName][1]["row"];

        items.forEach((item) {
          GeneralTimeTable temp = new GeneralTimeTable();
          temp.officeCode = item["ATPT_OFCDC_SC_CODE"];
          temp.officeName = item["ATPT_OFCDC_SC_NM"];

          temp.standardSchoolCode = int.parse(item["SD_SCHUL_CODE"]);
          temp.schoolName = item["SCHUL_NM"];

          temp.targetYear = int.parse(item["AY"]);
          temp.semester = int.parse(item["SEM"]);
          temp.date = DateTime.parse(item["ALL_TI_YMD"]);

          temp.grade = int.parse(item["GRADE"]);
          temp.className = item["CLASS_NM"];
          temp.period = int.parse(item["PERIO"]);
          temp.content = item["ITRT_CNTNT"];

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