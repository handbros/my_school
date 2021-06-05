// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolInfo _$SchoolInfoFromJson(Map<String, dynamic> json) {
  return SchoolInfo(
    json['officeCode'] as String,
    json['officeName'] as String,
    json['standardSchoolCode'] as int,
    json['schoolName'] as String,
    json['schoolEnglishName'] as String,
    json['schoolKind'] as String,
    json['location'] as String,
    json['districtOfficeName'] as String,
    json['postalCode'] as String,
    json['address'] as String,
    json['detailedAddress'] as String,
    json['telephoneNumber'] as String,
    json['homepageAddress'] as String,
    json['isCoeduSchool'] as String,
    json['faxNumber'] as String,
    DateTime.parse(json['foundedDate'] as String),
    DateTime.parse(json['anniversary'] as String),
    DateTime.parse(json['uploadTime'] as String),
  );
}

Map<String, dynamic> _$SchoolInfoToJson(SchoolInfo instance) =>
    <String, dynamic>{
      'officeCode': instance.officeCode,
      'officeName': instance.officeName,
      'standardSchoolCode': instance.standardSchoolCode,
      'schoolName': instance.schoolName,
      'schoolEnglishName': instance.schoolEnglishName,
      'schoolKind': instance.schoolKind,
      'location': instance.location,
      'districtOfficeName': instance.districtOfficeName,
      'postalCode': instance.postalCode,
      'address': instance.address,
      'detailedAddress': instance.detailedAddress,
      'telephoneNumber': instance.telephoneNumber,
      'homepageAddress': instance.homepageAddress,
      'isCoeduSchool': instance.isCoeduSchool,
      'faxNumber': instance.faxNumber,
      'foundedDate': instance.foundedDate.toIso8601String(),
      'anniversary': instance.anniversary.toIso8601String(),
      'uploadTime': instance.uploadTime.toIso8601String(),
    };
