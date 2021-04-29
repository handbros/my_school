/// 공유 자원 관리를 위한 클래스입니다.
class SharedAssets {
  // 싱글톤 패턴 구현을 위한 정적 클래스.
  static final SharedAssets _instance = new SharedAssets._internal();

  factory SharedAssets() {
    return _instance;
  }

  SharedAssets._internal() {
    // 클래스 초기화 코드
  }

  final String API_KEY = "d3907f38622249d18ac04d71b9b30640";
  final String API_DOMAIN = "open.neis.go.kr";
  final String SCHOOL_INFO_API_PATH = "/hub/schoolInfo";
  final String SCHOOL_SCHEDULE_API_PATH = "/hub/SchoolSchedule";
  final String CLASS_INFO_API_PATH = "/hub/classInfo";
  final String MEAL_INFO_API_PATH = "/hub/mealServiceDietInfo";
  final String ELEMENTARY_SCHOOL_TIME_TABLE_API_PATH = "/hub/elsTimetable";
  final String MIDDLE_SCHOOL_TIME_TABLE_API_PATH = "/hub/misTimetable";
  final String HIGH_SCHOOL_TIME_TABLE_API_PATH = "/hub/hisTimetable";
  final String SPECIAL_SCHOOL_TIME_TABLE = "/hub/spsTimetable";
}