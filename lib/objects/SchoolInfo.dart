/// 학교 정보를 저장하는 클래스입니다.
class SchoolInfo {
  /// 시도교육청코드
  String officeCode;
  /// 시도교육청명
  String officeName;
  /// 표준학교코드
  int standardSchoolCode;
  /// 학교명
  String schoolName;
  /// 영문학교명
  String schoolEnglishName;

  /// 학교종류명
  String schoolKind;
  /// 소재지명
  String location;

  /// 관할조직명
  String districtOfficeName;

  /// 설립명
  String foundationName;

  /// 도로명우편번호
  String postalCode;
  /// 도로명주소
  String address;
  /// 도로명상세주소
  String detailedAddress;

  /// 전화번호
  String telephoneNumber;
  /// 홈페이지주소
  String homepageAddress;
  /// 남녀공학구분명
  String codeSchoolName;

  /// 팩스번호
  String faxNumber;

  /// 고등학교구분명
  String highSchoolTypeName;
  /// 산업체특별학급존재여부
  bool hasIndustrialClass;
  /// 고등학교일반실업구분명
  String highSchoolNormalAndIndustrialName;
  /// 특수목적고등학교계열명
  String specialPurposeHighSchoolTypeName;

  /// 입시전후기구분명
  String entrancePeriod;
  /// 주야과정명
  String dayOrNight;

  /// 설립일자
  DateTime foundedDate;
  /// 개교기념일
  DateTime anniversary;

  /// 적재일시
  DateTime uploadTime;
}