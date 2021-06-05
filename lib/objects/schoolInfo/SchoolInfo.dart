import 'package:json_annotation/json_annotation.dart';
part 'SchoolInfo.g.dart';

/// 학교 정보를 저장하는 클래스입니다.
@JsonSerializable()
class SchoolInfo {
  /// 시도교육청코드
  late String officeCode = "";
  /// 시도교육청명
  late String officeName = "";
  /// 표준학교코드
  late int standardSchoolCode = 0;
  /// 학교명
  late String schoolName = "";
  /// 영문학교명
  late String schoolEnglishName = "";

  /// 학교종류명
  late String schoolKind = "";
  /// 소재지명
  late String location = "";

  /// 관할조직명
  late String districtOfficeName = "";

  /// 도로명우편번호
  late String postalCode = "";
  /// 도로명주소
  late String address = "";
  /// 도로명상세주소
  late String detailedAddress = "";

  /// 전화번호
  late String telephoneNumber = "";
  /// 홈페이지주소
  late String homepageAddress = "";
  /// 남녀공학구분명
  late String isCoeduSchool = "";

  /// 팩스번호
  late String faxNumber = "";

  /// 설립일자
  late DateTime foundedDate = DateTime.utc(2000, 1, 1);
  /// 개교기념일
  late DateTime anniversary = DateTime.utc(2000, 1, 1);

  /// 적재일시
  late DateTime uploadTime = DateTime.utc(2000, 1, 1);

  // Constructor
  SchoolInfo.initial();

  // JSON Serializer/Deserializer
  SchoolInfo(this.officeCode, this.officeName, this.standardSchoolCode, this.schoolName, this.schoolEnglishName, this.schoolKind, this.location, this.districtOfficeName, this.postalCode, this.address, this.detailedAddress, this.telephoneNumber, this.homepageAddress, this.isCoeduSchool, this.faxNumber, this.foundedDate, this.anniversary, this.uploadTime);

  factory SchoolInfo.fromJson(Map<String, dynamic> json) => _$SchoolInfoFromJson(json);
  Map<String, dynamic> toJson() => _$SchoolInfoToJson(this);
}