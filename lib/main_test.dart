import 'package:my_school/apis/AcademyInfoApi.dart';
import 'package:my_school/objects/AcademyInfo.dart';

void main() async {
  Future<List> futureResult = new AcademyInfoApi().getAcademyInfo("D10", "북구");
  List result = await futureResult;
  
  print("RESULT CODE : " + result[0].toString());

  List resultList = result[1];

  for (int i=0; i<resultList.length; i++) {
    print((resultList[i] as AcademyInfo).officeCode);
  }
}