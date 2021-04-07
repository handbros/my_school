import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/objects/AcademyInfo.dart';
import 'package:my_school/objects/ResultCode.dart';

class AcademyInfoApi {
  Future<List> getAcademyInfo(String officeCode, String districtName, {int index = 1, int size = 100} ) async {
    // API 호출을 위해 주소 초기화.
    var queryParameters = {
      'KEY': SharedAssets().API_KEY,
      'Type': 'json',
      'pIndex': index,
      'pSize': size,
      'ATPT_OFCDC_SC_CODE': officeCode,
      'ADMST_ZONE_NM': districtName
    };

    ResultCode resultCode = ResultCode.Okay;
    List<AcademyInfo> result; // 결과를 저장할 제네릭 리스트를 생성함.

    try {
      var response = await http.get(Uri.https(SharedAssets().API_DOMAIN, SharedAssets().ACADEMY_API_PATH, queryParameters)); // API 호출 후 데이터 저장.
      final json = jsonDecode(response.body); // 응답 받은 정보를 JSON 포맷으로 변환.

      // API 호출 결과 코드를 가져옴.
      String resultCodeString = json["acaInsTiInfo"][0]["head"][1]["RESULT"]["CODE"].toString();

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


      // 데이터를 필요한 형태로 재가공.
      var resultData = json["acaInsTiInfo"][1]["row"];

      weather = Weather(
          temp: data1["main"]["temp"],
          tempMax: data1["main"]["temp_max"],
          tempMin: data1["main"]["temp_min"],
          weatherMain: data1["weather"][0]["main"],//weather부분의 경우 리스트로 json에 들어가고 있기 때문에 첫번째것을 쓴다고 표시를 해준다.
          code: data1["weather"][0]["id"]);//weather부분의 경우 리스트로 json에 들어가고 있기 때문에 첫번째것을 쓴다고 표시를 해준다.

      resultCode = ResultCode.Okay;
    } catch (e) {
      result = null//
      print(e);
    }

    return [resultCode, result];
  }
}