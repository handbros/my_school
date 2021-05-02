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

  // API 관련 변수
  final String apiKey = "d3907f38622249d18ac04d71b9b30640";
  final String apiDomain = "open.neis.go.kr";
  final String schoolInfoApiPath = "/hub/schoolInfo";
  final String schoolScheduleApiPath = "/hub/SchoolSchedule";
  final String classInfoApiPath = "/hub/classInfo";
  final String mealInfoApiPath = "/hub/mealServiceDietInfo";
  final String elementarySchoolTimeTableApiPath = "/hub/elsTimetable";
  final String middleSchoolTimeTableApiPath = "/hub/misTimetable";
  final String highSchoolTimeTableApiPath = "/hub/hisTimetable";
  final String specialSchoolTimeTableApiPath = "/hub/spsTimetable";

  // 공통 변수
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
}