import 'package:my_school/apis/SchoolInfoApi.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:my_school/objects/classInfo/ClassInfoApiResult.dart';
import 'package:my_school/apis/ClassInfoApi.dart';
import 'package:my_school/objects/mealInfo/MealInfo.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfo.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfoApiResult.dart';
import 'package:my_school/SharedAssets.dart';

import 'package:my_school/objects/schoolSchedule/SchoolSchedule.dart';
import 'package:my_school/objects/schoolSchedule/SchoolScheduleApiResult.dart';
import 'package:my_school/apis/SchoolScheduleApi.dart';

import 'apis/MealInfoApi.dart';
import 'objects/mealInfo/MealInfoApiResult.dart';

void main() async {
  //schoolInfoApiTest();
  //schoolScheduleApiTest();
  //classInfoApiTest();
  mealInfoApiTest();
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

void classInfoApiTest() async {
  Future<ClassInfoApiResult> futureResult = new ClassInfoApi().getClassInfo("D10", 7261033, targetYear: 2021, grade: 2);
  ClassInfoApiResult result = await futureResult;

  print("KEY : " + SharedAssets().API_KEY);
  print("RESULT CODE : " + result.resultCode.toString());
  print("RESULT MESSAGE : " + result.resultMessage);

  if (result.resultCode == ResultCode.Okay) {
    print("ITEMS TOTAL COUNT : " + result.itemsTotalCount.toString());

    List resultList = result.items;

    for (int i=0; i<resultList.length; i++) {
      print("------------------------------");
      print("SCHOOL NAME : " + (resultList[i] as ClassInfo).schoolName);
      print("YEAR : " + (resultList[i] as ClassInfo).targetYear.toString());
      print("GRADE : " + (resultList[i] as ClassInfo).grade.toString());
      print("CLASS NAME : " + (resultList[i] as ClassInfo).className);
    }
  }
}

void mealInfoApiTest() async {
  Future<MealInfoApiResult> futureResult = new MealInfoApi().getMealInfo("D10", 7240068, date: "20210430", mealCode: 2);
  MealInfoApiResult result = await futureResult;

  print("KEY : " + SharedAssets().API_KEY);
  print("RESULT CODE : " + result.resultCode.toString());
  print("RESULT MESSAGE : " + result.resultMessage);

  if (result.resultCode == ResultCode.Okay) {
    print("ITEMS TOTAL COUNT : " + result.itemsTotalCount.toString());

    List resultList = result.items;

    for (int i=0; i<resultList.length; i++) {
      print("------------------------------");
      print("DATE : " + (resultList[i] as MealInfo).date.toIso8601String());
      print("MEAL NAME : " + (resultList[i] as MealInfo).mealName);
      print("MENU : \n" + (resultList[i] as MealInfo).menu);
      print("CALORIE : " + (resultList[i] as MealInfo).calorie);
      print("ORIGINS : \n" + (resultList[i] as MealInfo).origins);
      print("NUTRIENTS : \n" + (resultList[i] as MealInfo).nutrients);
    }
  }
}