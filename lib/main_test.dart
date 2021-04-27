import 'package:my_school/apis/SchoolInfoApi.dart';
import 'package:my_school/objects/SchoolInfo.dart';
import 'package:tuple/tuple.dart';
import 'SharedAssets.dart';
import 'objects/ResultCode.dart';

void main() async {
  print(SharedAssets().API_KEY);
  Future<Tuple2<ResultCode, List>> futureResult = new SchoolInfoApi().getSchoolInfo("D10", "", "");
  Tuple2<ResultCode, List> response = await futureResult;

  
  print("RESULT CODE : " + response.item1.toString());

  List resultList = response.item2;

  for (int i=0; i<resultList.length; i++) {
    print("------------------------------");
    print("STANDARD_SCH_CODE : " + (resultList[i] as SchoolInfo).standardSchoolCode.toString());
    print("SCHOOL_NAME : " + (resultList[i] as SchoolInfo).schoolName);
    print("DISTRICT_OFFICE_NAME : " + (resultList[i] as SchoolInfo).districtOfficeName);
    print("UPLOAD_TIME : " + (resultList[i] as SchoolInfo).uploadTime.toIso8601String());
  }
}