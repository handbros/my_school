import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/objects/SchoolInfo.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/utilities/StringFormatter.dart';
import 'package:tuple/tuple.dart';

class SchoolInfoApi {
  Future<Tuple2<ResultCode, List>> getSchoolInfo(String officeCode, String schoolName, String schoolKind, {int index = 1, int size = 100} ) async {
    // API 호출을 위해 주소 초기화.
    var queryParameters = {
      'KEY': SharedAssets().API_KEY,
      'Type': 'json',
      'pIndex': index.toString(),
      'pSize': size.toString(),
      'ATPT_OFCDC_SC_CODE': officeCode,
      'SCHUL_NM': schoolName,
      'SCHUL_KND_SC_NM': schoolKind
    };

    ResultCode resultCode = ResultCode.Okay;
    List<SchoolInfo> result = List<SchoolInfo>.empty(growable: true); // 결과를 저장할 제네릭 리스트를 초기화 함. growable 사용 시 가변 길이 리스트로 초기화 됨.

    try {
      var response = await http.get(Uri.https(SharedAssets().API_DOMAIN, SharedAssets().SCHOOL_INFO_API_PATH, queryParameters)); // API 호출 후 데이터 저장.
      final json = jsonDecode(response.body); // 응답 받은 정보를 JSON 포맷으로 변환.

      // API 호출 결과 코드를 가져옴.
      String resultCodeString = json["schoolInfo"][0]["head"][1]["RESULT"]["CODE"].toString();

      if (resultCodeString == "INFO-000") {
        resultCode = ResultCode.Okay;
      }
      else if (resultCodeString == "INFO-200") {
        resultCode = ResultCode.BlockedKey;
      }
      else if (resultCodeString == "INFO-300") {
        resultCode = ResultCode.DataNotFound;
      }
      else if (resultCodeString == "ERROR-290") {
        resultCode = ResultCode.InvalidKey;
      }
      else if (resultCodeString == "ERROR-300") {
        resultCode = ResultCode.MissingArguments;
      }
      else if (resultCodeString == "ERROR-310") {
        resultCode = ResultCode.ServiceNotFound;
      }
      else if (resultCodeString == "ERROR-333") {
        resultCode = ResultCode.InvalidArgumentType;
      }
      else if (resultCodeString == "ERROR-336") {
        resultCode = ResultCode.ExceededLimit;
      }
      else if (resultCodeString == "ERROR-337") {
        resultCode = ResultCode.ExceededTraffic;
      }
      else if (resultCodeString == "ERROR-500") {
        resultCode = ResultCode.ServerError;
      }
      else if (resultCodeString == "ERROR-600") {
        resultCode = ResultCode.DatabaseConnectionError;
      }
      else if (resultCodeString == "ERROR-601") {
        resultCode = ResultCode.SqlQueryError;
      }
      else {
        resultCode = null;
      }

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

        temp.uploadTime = DateTime.parse(StringFormatter().formatToParsableDateTime(item["LOAD_DTM"]));

        result.add(temp);
      });

    } catch (e) {
      result = null;
      print(e);
    }

    return Tuple2<ResultCode, List>(resultCode, result);
  }
}