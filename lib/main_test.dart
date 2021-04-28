import 'package:my_school/apis/SchoolInfoApi.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfo.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfoApiResult.dart';
import 'package:my_school/SharedAssets.dart';

import 'package:my_school/objects/schoolSchedule/SchoolSchedule.dart';
import 'package:my_school/objects/schoolSchedule/SchoolScheduleApiResult.dart';

import 'package:my_school/apis/SchoolScheduleApi.dart';

void main() async {
  //schoolInfoApiTest();
  schoolScheduleApiTest();
}

void schoolInfoApiTest() async {
  Future<SchoolInfoApiResult> futureResult = new SchoolInfoApi().getSchoolInfo("D10", "강북", "");
  SchoolInfoApiResult result = await futureResult;

  print("KEY : " + SharedAssets().API_KEY);
  print("RESULT CODE : " + result.resultCode.toString());
  print("RESULT MESSAGE : " + result.resultMessage);

  if (result.resultCode == ResultCode.Okay) {
    print("ITEMS TOTAL COUNT : " + result.itemsTotalCount.toString());

    List resultList = result.items;

    for (int i=0; i<resultList.length; i++) {
      print("------------------------------");
      print("STANDARD_SCH_CODE : " + (resultList[i] as SchoolInfo).standardSchoolCode.toString());
      print("SCHOOL_NAME : " + (resultList[i] as SchoolInfo).schoolName);
      print("DISTRICT_OFFICE_NAME : " + (resultList[i] as SchoolInfo).districtOfficeName);
      print("UPLOAD_TIME : " + (resultList[i] as SchoolInfo).uploadTime.toIso8601String());
    }
  }
}

void schoolScheduleApiTest() async {
  Future<SchoolScheduleApiResult> futureResult = new SchoolScheduleApi().getSchoolSchedule("D10", 7261033, from: "20200401", to: "20200430");
  SchoolScheduleApiResult result = await futureResult;

  print("KEY : " + SharedAssets().API_KEY);
  print("RESULT CODE : " + result.resultCode.toString());
  print("RESULT MESSAGE : " + result.resultMessage);

  if (result.resultCode == ResultCode.Okay) {
    print("ITEMS TOTAL COUNT : " + result.itemsTotalCount.toString());

    List resultList = result.items;

    for (int i=0; i<resultList.length; i++) {
      print("------------------------------");
      print("DATE : " + (resultList[i] as SchoolSchedule).date.toIso8601String());
      print("FEATURE : " + (resultList[i] as SchoolSchedule).feature);
      print("EVENT NAME : " + (resultList[i] as SchoolSchedule).eventName);
    }
  }
}