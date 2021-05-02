import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:my_school/apis/SchoolInfoApi.dart';
import 'package:my_school/objects/schoolInfo/SchoolInfoApiResult.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("목록", style: TextStyle(
            color: Theme.of(context).hintColor,
            fontSize: 18,
            fontWeight: FontWeight.w200
        )),
        elevation: 2,
        backgroundColor: Theme.of(context).bottomAppBarColor,
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(LineIcons.search),
            color: Theme.of(context).hintColor,
            onPressed: () {
              showSearch(context: context, delegate: SchoolSearchDelegate()); // SchoolSearch SearchDelegate 을(를) 호출.
            }),
        ],
      ),
    );
  }
}

class SchoolSearchDelegate extends SearchDelegate<String> {
  List<String> _recentSearches = List<String>.empty();

  /// 최근 검색 목록을 불러옵니다.
  void getRecentSearches() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _recentSearches = prefs.getStringList("RECENT_SCHOOL_SEARCHES") ?? List<String>.empty(growable: true); // 최근 검색 목록 불러오기.
  }

  /// 최근 검색 목록에 아이템을 추가합니다.
  void addRecentSearch(String query) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 최근 검색 목록 불러온 후 아이템 추가하기.
    List<String> temp = prefs.getStringList("RECENT_SCHOOL_SEARCHES") ?? List<String>.empty(growable: true);

    if (temp.contains(query)) {
      temp.remove(query);
    }

    temp.insert(0, query);

    // 최근 검색 목록 다시 저장 후 변수 초기화.
    prefs.setStringList("RECENT_SCHOOL_SEARCHES", temp);
    _recentSearches = temp;
  }

  /// 최근 검색 목록에서 아이템을 제거합니다.
  void popRecentSearch(int index) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // 최근 검색 목록 불러온 후 아이템 추가하기.
    List<String> temp = prefs.getStringList("RECENT_SCHOOL_SEARCHES") ?? List<String>.empty(growable: true);

    if (temp.length > index) {
      temp.removeAt(index);
    }

    // 최근 검색 목록 다시 저장 후 변수 초기화.
    prefs.setStringList("RECENT_SCHOOL_SEARCHES", temp);
    _recentSearches = temp;
  }

  /// 클래스 생성자
  SchoolSearchDelegate() {
    getRecentSearches(); // 클래스 초기화.
  }

  @override
  String get searchFieldLabel => "검색";

  @override
  ThemeData appBarTheme(BuildContext context) {
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
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 2) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Icon(LineIcons.exclamationCircle, size: 30,)
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
        future: SchoolInfoApi().getSchoolInfo(query.trim()),
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
                    child: Icon(LineIcons.exclamationCircle, size: 30,)
                ),
                Center(
                  child: Text(
                    "검색 결과가 없습니다.",
                  ),
                )
              ],
            );
          } else {
            var results = snapshot.data;
            return ListView.builder(
              itemCount: results.items.length,
              itemBuilder: (context, index) {
                var result = results.items[index];
                return ListTile(
                  onTap: () {
                    print(result.schoolName);
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
    final suggestionList = query.isEmpty ? _recentSearches : _recentSearches.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        leading: Icon(LineIcons.history),
        title: Text(suggestionList[index]),
        onTap: () {
          query = suggestionList[index];
          showResults(context);
        },
        onLongPress: () async {
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
        },
      ),
      itemCount: suggestionList.length,
    );
  }
}
