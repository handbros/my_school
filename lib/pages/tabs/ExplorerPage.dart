import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/SharedAssets.dart';
import 'package:my_school/apis/ClassInfoApi.dart';
import 'package:my_school/apis/SchoolInfoApi.dart';
import 'package:my_school/notifiers/ClassChangeNotifier.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:my_school/objects/classInfo/ClassInfoApiResult.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfo.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfoApiResult.dart';
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

/// 학교 검색을 위한 로직을 제공합니다.
class SchoolSearchDelegate extends SearchDelegate<String> {
  SharedAssets assets = SharedAssets.getInstance();

  /// 최근 검색 목록에 아이템을 추가합니다.
  void addRecentSearch(String query) async {
    // 최근 검색 목록 불러온 후 아이템 추가하기.
    if (assets.classSearchHistory.contains(query)) {
      assets.classSearchHistory.remove(query);
    }

    assets.classSearchHistory.insert(0, query);
  }

  /// 최근 검색 목록에서 아이템을 제거합니다.
  void popRecentSearch(int index) async {
    if (assets.classSearchHistory.length > index) {
      assets.classSearchHistory.removeAt(index);
    }
  }

  @override
  String get searchFieldLabel => "검색";

  @override
  ThemeData appBarTheme(BuildContext context) {
    // appBarTheme를 오버라이딩함.
    final ThemeData theme = Theme.of(context);

    return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(elevation: 2),
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(border: InputBorder.none, ),
      primaryColor: theme.bottomAppBarColor,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: theme.hintColor),
      textTheme: theme.textTheme.copyWith(
        headline6: TextStyle(fontWeight: FontWeight.normal),
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    // SearchBar 에 Action 버튼을 추가함.
    return [
      IconButton(icon: Icon(LineIcons.times), onPressed: () {
        query = "";
      })
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // SearchBar 에 Leading 버튼을 추가함.
    return IconButton(
        icon: Icon(LineIcons.arrowLeft),
        onPressed: () {
          close(context, null);
        }
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 2) {
      // 만약 검색어가 두 글자 미만인 경우.
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(LineIcons.exclamationCircle, size: 40,)
          ),
          Center(
            child: Text(
              "검색어는 두 글자 이상이어야만 합니다.",
            ),
          )
        ],
      );
    }
    else {
      // 검색 목록에 추가.
      addRecentSearch(query);

      // 검색 결과 처리.
      return FutureBuilder(
        future: SchoolInfoApi().getApiResult(query.trim()),
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
          } else {
            // Future 작업의 결과 snapshot이 반환되었을 경우.
            var results = snapshot.data;

            return ListView.builder(
              itemCount: results.items.length,
              itemBuilder: (context, index) {
                var result = results.items[index];

                return ListTile(
                  onTap: () {
                    showSelectClassDialog(context, result); // 다이얼로그 호출.
                  },
                  title: Text(result.schoolName),
                  subtitle: Text(result.address),
                );
              },
            );
          }
        },
      );
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? assets.classSearchHistory : assets.classSearchHistory.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(LineIcons.history),
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
        onLongPress: () async {
          showRemoveHistoryDialog(context, index); // 다이얼로그 호출.
        },
      ),
      itemCount: suggestionList.length,
    );
  }

  /// ClassInfoApiResult에서 학년 정보를 추출합니다.
  List<int> getGradeList(ClassInfoApiResult apiResult) {
    List<int> gradeList = List<int>.empty(growable: true);

    // 학년 추가.
    for (ClassInfo classInfo in apiResult.items) {
      if (!gradeList.contains(classInfo.grade)) {
        gradeList.add(classInfo.grade);
      }
    }

    gradeList.sort(); // 정렬

    return gradeList;
  }

  /// ClassInfoApiResult에서 학반 정보를 추출합니다.
  List<String> getClassList(ClassInfoApiResult apiResult, int grade) {
    List<String> classList = List<String>.empty(growable: true);

    // 학년 추가.
    for (ClassInfo classInfo in apiResult.items) {
      if (classInfo.grade == grade && !classList.contains(classInfo.className)) {
        classList.add(classInfo.className);
      }
    }

    classList.sort(); // 정렬

    return classList;
  }

  /// ClassInfoApiResult에서 지정된 반 정보를 불러옵니다.
  ClassInfo getSelectedClassInfo(ClassInfoApiResult apiResult, int grade, String className) {
    // 학년 추가.
    for (ClassInfo classInfo in apiResult.items) {
      if (classInfo.grade == grade && classInfo.className == className) {
        return classInfo;
      }
    }

    return new ClassInfo();
  }

  void showSelectClassDialog(BuildContext context, SchoolInfo schoolInfo) async {
    List<int> gradeList = List<int>.empty(growable: true);
    List<String> classList = List<String>.empty(growable: true);
    int selectedGrade;
    String selectedClass;
    ClassInfo selectedClassInfo;

    // Alert Dialog 호출.
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("학반", style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).hintColor)),
          // AlertDialog 내에서 상태 변경을 하기 위해 StatefulBuilder를 사용함.
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              // 반 정보를 받아오기 위한 Future Builder.
              return FutureBuilder(
                future: ClassInfoApi().getApiResult(schoolInfo.officeCode, schoolInfo.standardSchoolCode, targetYear: DateTime.now().year),
                builder: (context, AsyncSnapshot<ClassInfoApiResult> snapshot) {
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
                  } else if (snapshot.data.items.length == 0) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Center(
                            child: Icon(LineIcons.exclamationCircle, size: 30,)
                        ),
                        Center(
                          child: Text(
                            "학반 정보가 없습니다.",
                          ),
                        )
                      ],
                    );
                  } else {
                    // Future 작업의 결과 snapshot이 반환되었을 경우.
                    var result = snapshot.data;

                    // 학년 정보를 초기화함.
                    gradeList = getGradeList(result);

                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("학반을 선택해주세요."),
                        Divider(),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: DropdownButton<int>(
                                hint: Text("학년"),
                                isExpanded: true,
                                value: selectedGrade,
                                items: gradeList.map(
                                      (int value) {
                                    return DropdownMenuItem<int>(value: value, child: Text("$value학년"));
                                  },
                                ).toList(),
                                onChanged: (int value) {
                                  setState(() {
                                    selectedGrade = value;

                                    classList = getClassList(result, value); // 학반 정보를 초기화함.
                                    selectedClass = null;

                                    selectedClassInfo = null;
                                  });
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 10),
                            ),
                            Expanded(
                              child: DropdownButton<String>(
                                hint: Text("반"),
                                isExpanded: true,
                                value: selectedClass,
                                items: classList.map(
                                      (String value) {
                                    return DropdownMenuItem<String>(value: value, child: Text("$value반"));
                                  },
                                ).toList(),
                                onChanged: (String value) {
                                  setState(() {
                                    selectedClass = value;

                                    selectedClassInfo = getSelectedClassInfo(result, selectedGrade, selectedClass);
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  }
                },
              );
            },
          ),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                if (selectedClass == null || selectedClassInfo == null) {
                  // Toast 메시지 호출.
                  Fluttertoast.showToast(
                    msg: "학년 또는 반을 선택해주세요.",
                    toastLength: Toast.LENGTH_SHORT,
                  );

                  return;
                }

                if (SharedAssets.getInstance().addClass(selectedClassInfo)) {
                  // ClassChangeNotifier를 통해 이벤트 호출.
                  final notifier = Provider.of<ClassChangeNotifier>(context, listen: false);
                  notifier.notifyClassChanged();

                  // Toast 메시지 호출.
                  Fluttertoast.showToast(
                    msg: "${selectedClassInfo.schoolName} $selectedGrade학년 $selectedClass반이 추가되었습니다.",
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }
                else {
                  // Toast 메시지 호출.
                  Fluttertoast.showToast(
                    msg: "이미 추가되어있습니다.",
                    toastLength: Toast.LENGTH_SHORT,
                  );
                }

                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  void showRemoveHistoryDialog(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("검색 기록", style: Theme.of(context).textTheme.headline6.copyWith(color: Theme.of(context).hintColor)),
          content: Text("최근 검색 기록을 삭제하시겠습니까?"),
          actions: <Widget>[
            TextButton(
              child: Text('확인'),
              onPressed: () {
                popRecentSearch(index);
                Navigator.pop(context);
              },
            ),
            TextButton(
              child: Text('취소'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
