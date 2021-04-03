/// 학원교습소 관련 정보를 저장하는 클래스입니다.
class AcademyInfo {
  /// 시도교육청코드
  String officeCode;
  /// 시도교육청명
  String officeName;
  /// 행정구역명
  String districtName;
  /// 학원교습소명
  String academyType;
  /// 학원지정번호
  int academyNumber;
  /// 학원명
  String academyName;

  /// 개설일자
  DateTime openDate;
  /// 등록일자
  DateTime registerDate;
  /// 등록상태명
  String registerStatus;

  /// 휴원시작일자
  DateTime vacationStartDate;
  /// 휴원종료일자
  DateTime vacationEndDate;

  /// 정원합계
  int totalMembers;
  /// 일시수용능력인원합계
  int capacity;

  /// 분야명
  String realmName;
  /// 교습계열명
  String lessonFieldName;
  /// 교습과정목록명
  List<String> lessonCurriculumList;
  /// 교습과정명
  String lessonCurriculumName;

  /// 인당수강료내용
  String fee;
  /// 수강료공개여부
  bool isOpenFee;
  /// 기숙사학원여부
  bool isDormitoryType;
  
  /// 도로명우편번호
  String postalCode;
  /// 도로명주소
  String address;
  /// 도로명상세주소
  String detailedAddress;
  
  /// 적재일시
  DateTime uploadTime;
}