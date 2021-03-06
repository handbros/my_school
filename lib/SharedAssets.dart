import 'dart:convert';
import 'package:my_school/ReportBox.dart';
import 'package:my_school/objects/reports/ReportItem.dart';
import 'package:my_school/objects/reports/ReportType.dart';
import 'package:my_school/objects/classInfo/ClassInfo.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'SharedAssets.g.dart';

/// 공유 자원 관리를 위한 클래스입니다.
@JsonSerializable(explicitToJson: true)
class SharedAssets{
  // 싱글톤 패턴 구현을 위한 정적 클래스.
  static SharedAssets _instance = new SharedAssets.initial();

  factory SharedAssets.getInstance() {
    return _instance;
  }

  // 싱글톤 인스턴스 초기화 코드.
  static void setInstance(SharedAssets instance) {
    _instance = instance;
  }

  /// SharedAssets의 초기 인스턴스를 반환합니다.
  SharedAssets.initial() {
    // 클래스 초기화 코드
    acceptTransferringDeviceInformation = false;
    classSearchHistory = List<String>.empty(growable: true);
    classList = List<ClassInfo>.empty(growable: true);
    selectedClass = new ClassInfo.initial();
  }

  // API 관련 상수
  static const String apiKey = "d3907f38622249d18ac04d71b9b30640";
  static const String apiDomain = "open.neis.go.kr";
  static const String schoolInfoApiPath = "/hub/schoolInfo";
  static const String schoolScheduleApiPath = "/hub/SchoolSchedule";
  static const String classInfoApiPath = "/hub/classInfo";
  static const String mealInfoApiPath = "/hub/mealServiceDietInfo";
  static const String elementarySchoolTimeTableApiPath = "/hub/elsTimetable";
  static const String middleSchoolTimeTableApiPath = "/hub/misTimetable";
  static const String highSchoolTimeTableApiPath = "/hub/hisTimetable";
  static const String specialSchoolTimeTableApiPath = "/hub/spsTimetable";

  // 공통 변수
  late bool acceptTransferringDeviceInformation;
  late List<String> classSearchHistory;
  late List<ClassInfo> classList;
  late ClassInfo selectedClass;

  // 공통 변수 관련 함수

  /// 최근 검색 목록에 아이템을 추가합니다.
  void addRecentSearch(String query) async {
    // 최근 검색 목록 불러온 후 아이템 추가하기.
    if (classSearchHistory.contains(query)) {
      classSearchHistory.remove(query);
    }

    classSearchHistory.insert(0, query);
    writeSharedAssets();
  }

  /// 최근 검색 목록에서 아이템을 제거합니다.
  void removeRecentSearch(int index) async {
    if (classSearchHistory.length > index) {
      classSearchHistory.removeAt(index);
      writeSharedAssets();
    }
  }

  /// classList 에 새 반을 추가합니다. 작업이 성공했을 경우 true를 반환합니다.
  bool addClass(ClassInfo classInfo) {
    if (!isAlreadyExistClass(classInfo)) {
      // SharedAssets에 학반 정보 저장.
      classList.insert(0, classInfo);
      selectedClass = classInfo;

      writeSharedAssets();

      return true;
    }
    else {
      return false;
    }
  }

  /// classList 에서 지정된 반을 제거합니다.
  void removeClass(int index) {
    if (index >= 0 && index <= classList.length) {
      // SharedAssets에 학반 정보 저장.
      classList.removeAt(index);

      if (classList.length > 0) {
        selectedClass = classList[0];
      }
      else {
        selectedClass = ClassInfo.initial();
      }

      writeSharedAssets();
    }
  }

  /// 지정된 반을 선택합니다.
  void selectClass(int index) {
    if (index > 0 && index <= classList.length) {
      ClassInfo temp = classList[index];
      classList.removeAt(index);
      classList.insert(0, temp);

      selectedClass = classList[0];

      writeSharedAssets();
    }
  }

  /// classList에서 입력된 반의 인덱스를 반환합니다.
  int getClassIndex(ClassInfo classInfo) {
    int index = 0;

    for (ClassInfo target in SharedAssets.getInstance().classList) {
      if (target.standardSchoolCode == classInfo.standardSchoolCode && target.grade == classInfo.grade && target.className == classInfo.className) {
        return index;
      }
      index++;
    }

    return -1;
  }

  /// classList에 해당 반이 존재하는지에 대한 여부를 반환합니다.
  bool isAlreadyExistClass(ClassInfo classInfo) {
    bool result = false;

    for (ClassInfo target in SharedAssets.getInstance().classList) {
      if (target.standardSchoolCode == classInfo.standardSchoolCode && target.grade == classInfo.grade && target.className == classInfo.className) {
        result = true;
      }
    }

    return result;
  }

  // IO 관련 함수.
  SharedAssets(this.acceptTransferringDeviceInformation, this.classSearchHistory, this.classList, this.selectedClass);

  factory SharedAssets.fromJson(Map<String, dynamic> json) => _$SharedAssetsFromJson(json);
  Map<String, dynamic> toJson() => _$SharedAssetsToJson(this);

  /// SharedAssets를 불러옵니다.
  static Future<void> readSharedAssets() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      String sharedAssetsJson = (prefs.getString("SHARED_ASSETS") ?? null)!;

      Map<String, dynamic> sharedAssetsMap = jsonDecode(sharedAssetsJson);
      SharedAssets.setInstance(SharedAssets.fromJson(sharedAssetsMap));

      ReportBox.getInstance().addReport(new ReportItem(ReportType.SUCCEED, "SHARED ASSETS", "Shared assets are loaded."));
    }
    catch (e) {
      ReportBox.getInstance().addReport(new ReportItem(ReportType.ERROR, "SHARED ASSETS", "An error occurred while loading data.\n${e.toString()}"));
    }
  }

  /// SharedAssets를 저장합니다.
  static Future<void> writeSharedAssets() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      Map<String, dynamic> json = _instance.toJson();
      String jsonString = jsonEncode(json);

      prefs.setString("SHARED_ASSETS", jsonString);

      ReportBox.getInstance().addReport(new ReportItem(ReportType.SUCCEED, "SHARED ASSETS", "Shared assets are saved."));
    }
    catch (e) {
      ReportBox.getInstance().addReport(new ReportItem(ReportType.ERROR, "SHARED ASSETS", "An error occurred while saving data.\n${e.toString()}"));
    }
  }

  /// 개인 설정을 초기화합니다.
  void resetPreferences() {
    classSearchHistory = List<String>.empty(growable: true);
    classList = List<ClassInfo>.empty(growable: true);
    selectedClass = new ClassInfo.initial();

    writeSharedAssets();

    ReportBox.getInstance().addReport(new ReportItem(ReportType.SUCCEED, "SHARED ASSETS", "Preferences are reset."));
  }
}