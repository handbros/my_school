import 'dart:convert';

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
    acceptUsingDeviceStorage = false;
    useOfflineMode = false;
    acceptTransferringDeviceInformation = false;
    classSearchHistory = List<String>.empty(growable: true);
    classList = List<ClassInfo>.empty(growable: true);
    selectedClass = new ClassInfo();
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

  // 공통 상수
  final List<String> officeNameList = List<String>.from([
    '서울특별시교육청',
    '부산광역시교육청',
    '대구광역시교육청',
    '인천광역시교육청',
    '광주광역시교육청',
    '대전광역시교육청',
    '울산광역시교육청',
    '세종특별자치시교육청',
    '경기도교육청',
    '강원도교육청',
    '충청북도교육청',
    '충청남도교육청',
    '전라북도교육청',
    '전라남도교육청',
    '경상북도교육청',
    '경상남도교육청',
    '제주특별자치도교육청',
    '재외한국학교교육청'
  ]);
  final List<String> officeCodeList = List<String>.from([
    'B10',
    'C10',
    'D10',
    'E10',
    'F10',
    'G10',
    'H10',
    'I10',
    'J10',
    'K10',
    'M10',
    'N10',
    'P10',
    'Q10',
    'R10',
    'S10',
    'T10',
    'V10'
  ]);

  // 공통 변수
  bool acceptUsingDeviceStorage;
  bool useOfflineMode;
  bool acceptTransferringDeviceInformation;
  List<String> classSearchHistory;
  List<ClassInfo> classList;
  ClassInfo selectedClass;

  // 공통 변수 관련 함수
  /// classList에 새 반을 추가합니다. 작업이 성공했을 경우 true를 반환합니다.
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

  void removeClass(int index) {
    if (index > 0 && index <= classList.length) {
      // SharedAssets에 학반 정보 저장.
      classList.removeAt(index);

      if (classList.length > 0) {
        selectedClass = classList[0];
      }
      else {
        selectedClass = null;
      }

      writeSharedAssets();
    }
  }

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
  SharedAssets({this.acceptUsingDeviceStorage, this.useOfflineMode, this.acceptTransferringDeviceInformation, this.classSearchHistory, this.classList, this.selectedClass});

  factory SharedAssets.fromJson(Map<String, dynamic> json) => _$SharedAssetsFromJson(json);
  Map<String, dynamic> toJson() => _$SharedAssetsToJson(this);

  /// SharedAssets를 불러옵니다.
  static Future<void> readSharedAssets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    String sharedAssetsJson = prefs.getString("SHARED_ASSETS") ?? null;

    if (sharedAssetsJson == null) {
      SharedAssets.setInstance(SharedAssets.initial());
    }
    else {
      Map sharedAssetsMap = jsonDecode(sharedAssetsJson);
      SharedAssets.setInstance(SharedAssets.fromJson(sharedAssetsMap));
    }
  }

  /// SharedAssets를 저장합니다.
  static Future<void> writeSharedAssets() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    Map<String, dynamic> json = _instance.toJson();
    String jsonString = jsonEncode(json);

    prefs.setString("SHARED_ASSETS", jsonString);
  }

  /// 개인 설정을 초기화합니다.
  void resetPreferences() {
    classSearchHistory = List<String>.empty(growable: true);
    classList = List<ClassInfo>.empty(growable: true);
    selectedClass = new ClassInfo();

    writeSharedAssets();
  }
}