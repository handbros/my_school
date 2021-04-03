import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_school/objects/AcademyInfo.dart';

class AcademyInfoApi {

  /*
  Future<List<AcademyInfo>> getAcademyInfoList() async {
    //api 호출을 위한 주소
    String apiAddr = "https://api.openweathermap.org/data/2.5/weather?q=seoul&appid=여기는apikey자리에요&units=metric";
    http.Response response;//http request의 결과 즉 api 호출의 결과를 받기 위한 변수
    var data1;//api 호출을 통해 받은 정보를 json으로 바꾼 결과를 저장한다.
    List<AcademyInfo> academyInfoList;

    try {
      response = await http.get(apiAddr);//필요 api 호출
      data1 = json.decode(response.body);//받은 정보를 json형태로 decode
      //받은 데이터정보를 필요한 형태로 저장한다.
      weather = Weather(
          temp: data1["main"]["temp"],
          tempMax: data1["main"]["temp_max"],
          tempMin: data1["main"]["temp_min"],
          weatherMain: data1["weather"][0]["main"],//weather부분의 경우 리스트로 json에 들어가고 있기 때문에 첫번째것을 쓴다고 표시를 해준다.
          code: data1["weather"][0]["id"]);//weather부분의 경우 리스트로 json에 들어가고 있기 때문에 첫번째것을 쓴다고 표시를 해준다.
    } catch (e) {
      weather = null//
      print(e);
    }

    return weather;
  }

   */
}