import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/apis/SchoolInfoApi.dart';
import 'package:my_school/objects/ResultCode.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfo.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfoApiResult.dart';
import 'package:my_school/widgets/InformationRow.dart';

class SchoolInfoPage extends StatefulWidget {
  const SchoolInfoPage({Key key}) : super(key: key);

  @override
  _SchoolInfoPageState createState() => _SchoolInfoPageState();
}

class _SchoolInfoPageState extends State<SchoolInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("학교 정보", style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
            fontWeight: FontWeight.w200
        )),
        elevation: 2,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        centerTitle: true,
        leading: IconButton(
            icon: Icon(LineIcons.arrowLeft),
            color: Theme.of(context).hintColor,
            onPressed: () {
              Navigator.pop(context);
            }
        ),
      ),
      body: schoolInfoContentLoader(),
    );
  }

  Widget schoolInfoContentLoader() {
    String schoolName = SharedAssets.getInstance().selectedClass.schoolName;

    return FutureBuilder(
      future: SchoolInfoApi().getApiResult(schoolName),
      builder: (context, AsyncSnapshot<SchoolInfoApiResult> snapshot) {
        if (!snapshot.hasData) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(child: CircularProgressIndicator()),
            ],
          );
        } else if (snapshot.data.items.length == 0) {
          if (snapshot.data.resultCode != ResultCode.Okay) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Icon(LineIcons.exclamationCircle, size: 30,)
                ),
                Center(
                  child: Text(
                    "오류가 발생했습니다.",
                  ),
                )
              ],
            );
          }
          else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Icon(LineIcons.exclamationCircle, size: 40,)
                ),
                Center(
                  child: Text(
                    "검색 결과가 없습니다.",
                  ),
                )
              ],
            );
          }
        } else {
          // Future 작업의 결과 snapshot이 반환되었을 경우.
          var result = snapshot.data.items[0];

          return schoolInfoContent(result);
        }
      },
    );
  }

  Widget schoolInfoContent(SchoolInfo schoolInfo) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("${schoolInfo.schoolKind}", style: TextStyle(fontSize: 16, color: Theme.of(context).accentColor),),
                Text("${schoolInfo.schoolName}", style: TextStyle(fontSize: 30),),
                Text("${schoolInfo.schoolEnglishName}", style: TextStyle(fontSize: 18),),
                //Text("${schoolInfo.standardSchoolCode}", style: TextStyle(fontSize: 14),),
              ],
            ),
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InformationRow(Icon(LineIcons.building), "관할 교육청 : ${schoolInfo.districtOfficeName}"),
            ],
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InformationRow(Icon(LineIcons.addressBookAlt), "주소 : ${schoolInfo.address}"),
              InformationRow(Icon(LineIcons.mailBulk), "우편번호 : ${schoolInfo.postalCode}"),
            ],
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InformationRow(Icon(LineIcons.phone), "전화번호 : ${schoolInfo.telephoneNumber}"),
              InformationRow(Icon(LineIcons.fax), "팩스번호 : ${schoolInfo.faxNumber}"),
              InformationRow(Icon(LineIcons.internetExplorer), "홈페이지 : ${schoolInfo.homepageAddress}"),
            ],
          ),
          Divider(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InformationRow(Icon(LineIcons.calendar), "설립일자 : ${new DateFormat.yMd().format(schoolInfo.foundedDate)}"),
            ],
          ),
        ],
      ),
    );
  }
}
