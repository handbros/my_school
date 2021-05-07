import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfo.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfoApiResult.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/utilities/StringFormatter.dart';

class SchoolInfoApi {
  Future<SchoolInfoApiResult> getSchoolInfo(String schoolName, {int index = 1, int size = 100, String officeCode, String schoolKind} ) async {
    // API 호출을 위한 쿼리 값들을 초기화.
    var queryParameters = {
      'KEY': SharedAssets.apiKey,
      'Type': 'json',
      'pIndex': index.toString(),
      'pSize': size.toString(),
      'ATPT_OFCDC_SC_CODE': officeCode,
      'SCHUL_NM': schoolName,
      'SCHUL_KND_SC_NM': schoolKind
    };

    SchoolInfoApiResult result = new SchoolInfoApiResult();

    try {
      var response = await http.get(Uri.https(SharedAssets.apiDomain, SharedAssets.schoolInfoApiPath, queryParameters)); // API 호출 후 데이터 저장.
      final json = jsonDecode(response.body); // 응답 받은 정보를 JSON 포맷으로 변환.

      result.requestUrl = response.request.url.toString();

      // API 호출 결과 코드를 가져옴.
      try {
        String resultCodeString = json["schoolInfo"][0]["head"][1]["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["schoolInfo"][0]["head"][1]["RESULT"]["MESSAGE"].toString();
      }
      catch(e) {
        // 오류 발생 시에는 다른 구조의 JSON이 반환됨. 예외 발생 시 이를 처리함.
        String resultCodeString = json["RESULT"]["CODE"].toString();
        result.resultCode = StringFormatter.stringToResultCode(resultCodeString);
        result.resultMessage = json["RESULT"]["MESSAGE"].toString();
      }


      if (result.resultCode == ResultCode.Okay) {
        // 전체 아이템 수를 가져옴.
        result.itemsTotalCount = json["schoolInfo"][0]["head"][0]["list_total_count"];

        // 데이터를 필요한 형태로 재가공.
        List<dynamic> items = json["schoolInfo"][1]["row"];

        items.forEach((item) {
          SchoolInfo temp = new SchoolInfo();
          temp.officeCode = item["ATPT_OFCDC_SC_CODE"];
          temp.officeName = item["ATPT_OFCDC_SC_NM"];

          temp.standardSchoolCode = int.parse(item["SD_SCHUL_CODE"]);
          temp.schoolName = item["SCHUL_NM"];
          temp.schoolEnglishName = item["ENG_SCHUL_NM"];

          temp.schoolKind = item["SCHUL_KND_SC_NM"];
          temp.location = item["LCTN_SC_NM"];

          temp.districtOfficeName = item["JU_ORG_NM"];

          temp.postalCode = item["ORG_RDNZC"];
          temp.address = item["ORG_RDNMA"];
          temp.detailedAddress = item["ORG_RDNDA"];

          temp.telephoneNumber = item["ORG_TELNO"];
          temp.homepageAddress = item["HMPG_ADRES"];
          temp.isCoeduSchool = item["COEDU_SC_NM"];

          temp.faxNumber = item["ORG_FAXNO"];

          temp.foundedDate = DateTime.parse(item["FOND_YMD"]);
          temp.anniversary = DateTime.parse(item["FOAS_MEMRD"]);

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