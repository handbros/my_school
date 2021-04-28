import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/objects/schoolSchedule/SchoolSchedule.dart';
import 'package:my_school/objects/schoolSchedule/SchoolScheduleApiResult.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/utilities/StringFormatter.dart';

class SchoolScheduleApi {
  Future<SchoolScheduleApiResult> getSchoolSchedule(String officeCode, int standardSchoolCode, {int index = 1, int size = 100, String date, String from, String to} ) async {
    // API 호출을 위한 쿼리 값들을 초기화.
    var queryParameters = {
      'KEY': SharedAssets().API_KEY,
      'Type': 'json',
      'pIndex': index.toString(),
      'pSize': size.toString(),
      'ATPT_OFCDC_SC_CODE': officeCode,
      'SD_SCHUL_CODE': standardSchoolCode.toString(),
      'AA_YMD': date,
      'AA_FROM_YMD': from,
      'AA_TO_YMD': to
    };

    SchoolScheduleApiResult result = new SchoolScheduleApiResult();

    try {
      var response = await http.get(Uri.https(SharedAssets().API_DOMAIN, SharedAssets().SCHOOL_SCHEDULE_API_PATH, queryParameters)); // API 호출 후 데이터 저장.
      final json = jsonDecode(response.body); // 응답 받은 정보를 JSON 포맷으로 변환.

      // API 호출 결과 코드를 가져옴.
      try {
        String resultCodeString = json["SchoolSchedule"][0]["head"][1]["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["SchoolSchedule"][0]["head"][1]["RESULT"]["MESSAGE"].toString();
      }
      catch(e) {
        // 오류 발생 시에는 다른 구조의 JSON이 반환됨. 예외 발생 시 이를 처리함.
        String resultCodeString = json["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["RESULT"]["MESSAGE"].toString();
      }


      if (result.resultCode == ResultCode.Okay) {
        // 전체 아이템 수를 가져옴.
        result.itemsTotalCount = json["SchoolSchedule"][0]["head"][0]["list_total_count"];

        // 데이터를 필요한 형태로 재가공.
        List<dynamic> items = json["SchoolSchedule"][1]["row"];

        items.forEach((item) {
          SchoolSchedule temp = new SchoolSchedule();
          temp.officeCode = item["ATPT_OFCDC_SC_CODE"];
          temp.officeName = item["ATPT_OFCDC_SC_NM"];

          temp.standardSchoolCode = int.parse(item["SD_SCHUL_CODE"]);
          temp.schoolName = item["SCHUL_NM"];

          temp.targetYear = int.parse(item["AY"]);

          temp.feature = item["SBTR_DD_SC_NM"];
          temp.date = DateTime.parse(item["AA_YMD"]);

          temp.eventName = item["EVENT_NM"];
          temp.eventDetails = item["EVENT_CNTNT"];
          temp.isFirstGradeEvent = StringFormatter.stringToBool(item["ONE_GRADE_EVENT_YN"]);
          temp.isSecondGradeEvent = StringFormatter.stringToBool(item["TW_GRADE_EVENT_YN"]);
          temp.isThirdGradeEvent = StringFormatter.stringToBool(item["THREE_GRADE_EVENT_YN"]);
          temp.isFourthGradeEvent = StringFormatter.stringToBool(item["FR_GRADE_EVENT_YN"]);
          temp.isFifthGradeEvent = StringFormatter.stringToBool(item["FIV_GRADE_EVENT_YN"]);
          temp.isSixthGradeEvent = StringFormatter.stringToBool(item["SIX_GRADE_EVENT_YN"]);

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