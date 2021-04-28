import 'package:my_school/apis/SchoolInfoApi.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfo.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfoApiResult.dart';
import 'package:my_school/SharedAssets.dart';

void main() async {
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