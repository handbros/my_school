import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/notifiers/ClassChangeNotifier.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:my_school/pages/delegates/SchoolSearchDelegate.dart';
import 'package:my_school/widgets/EmptyAppBar.dart';
import 'package:provider/provider.dart';

class ExplorerPage extends StatefulWidget {
  @override
  _ExplorerPageState createState() => _ExplorerPageState();
}

class _ExplorerPageState extends State<ExplorerPage> {
  @override
  Widget build(BuildContext context) {
    // 반 정보 변경 정보를 받기 위함.
    final notifier = Provider.of<ClassChangeNotifier>(context);

    return Scaffold(
      appBar: EmptyAppBar(),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Card(
              elevation: 2,
              child: InkWell(
                child: Padding(
                  padding: EdgeInsets.only(left: 20, top: 14, right: 20, bottom: 14),
                  child: Row(
                    children: [
                      Icon(LineIcons.search),
                      Padding(padding: EdgeInsets.only(left: 8)),
                      Text("검색")
                    ],
                  ),
                ),
                onTap: () {
                  showSearch(context: context, delegate: SchoolSearchDelegate()); // SchoolSearch SearchDelegate 을(를) 호출.
                },
              )
            )
          ),
          Expanded(
            child: ListView.builder(
              itemCount: notifier.getClassList().length,
              itemBuilder: (context, index) {
                var result = notifier.getClassList()[index] as ClassInfo;

                return Padding(
                  padding: EdgeInsets.only(left: 10, right: 10, bottom: 6),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: EdgeInsets.all(0),
                      child: ListTile(
                        onTap: () {
                          if (SharedAssets.getInstance().selectedClass != SharedAssets.getInstance().classList[index]) {
                            SharedAssets.getInstance().selectClass(index);
                            notifier.notifyClassChanged();

                            // Toast 메시지 호출.
                            ClassInfo classInfo = SharedAssets.getInstance().classList[0];

                            Fluttertoast.showToast(
                              msg: "${classInfo.schoolName} ${classInfo.grade}학년 ${classInfo.className}반으로 변경되었습니다.",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          }
                          else {
                            Fluttertoast.showToast(
                              msg: "이미 선택되어 있는 반입니다.",
                              toastLength: Toast.LENGTH_SHORT,
                            );
                          }
                        },
                        title: index == 0 ? Text("${result.schoolName} (현재)") : Text(result.schoolName),
                        subtitle: Text("${result.grade}학년 ${result.className}반"),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      )
    );
  }
}
