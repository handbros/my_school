import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/apis/MealInfoApi.dart';
import 'package:my_school/objects/mealInfo/MealInfoApiResult.dart';
import 'package:line_icons/line_icons.dart';

class MealPage extends StatefulWidget {
  @override
  _MealPageState createState() => _MealPageState();
}

class _MealPageState extends State<MealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("식단표", style: TextStyle(
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
      body: mealContent(context),
    );
  }

  Widget mealContent(BuildContext context) {
    String officeCode = SharedAssets.getInstance().selectedClass.officeCode;
    int schoolCode = SharedAssets.getInstance().selectedClass.standardSchoolCode;
    String date = DateFormat('yyyyMM').format(DateTime.now());

    return FutureBuilder(
      future: MealInfoApi().getApiResult(officeCode, schoolCode, date: date),
      builder: (context, AsyncSnapshot<MealInfoApiResult> snapshot) {
        if (!snapshot.hasData) {
          return SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: CircularProgressIndicator()),
              ],
            ),
            width: 100,
            height: 100,
          );
        } else if (snapshot.data!.items.length == 0) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Icon(LineIcons.exclamationCircle, size: 30,)
              ),
              Center(
                child: Text(
                  "식단표 정보가 없습니다.",
                ),
              )
            ],
          );
        } else {
          // Future 작업의 결과 snapshot이 반환되었을 경우.
          var result = snapshot.data;

          return ListView.builder(
            itemCount: result!.itemsTotalCount,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.only(left: 10, top: 4, right: 10, bottom: 4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  elevation: 2,
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(LineIcons.infoCircle),
                            Padding(padding: EdgeInsets.only(left: 8)),
                            Text("(${new DateFormat.yMd().format(result.items[index].date)})")
                          ],
                        ),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Text("${result.items[index].mealName}"),
                        Text("${result.items[index].menu}"),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Text("${result.items[index].calorie}"),
                        Padding(padding: EdgeInsets.only(top: 8)),
                        Text("${result.items[index].nutrients}")
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
