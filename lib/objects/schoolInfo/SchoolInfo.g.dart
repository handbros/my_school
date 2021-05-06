// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolInfo _$SchoolInfoFromJson(Map<String, dynamic> json) {
  return SchoolInfo(
    officeCode: json['officeCode'] as String,
    officeName: json['officeName'] as String,
    standardSchoolCode: json['standardSchoolCode'] as int,
    schoolName: json['schoolName'] as String,
    schoolEnglishName: json['schoolEnglishName'] as String,
    schoolKind: json['schoolKind'] as String,
    location: json['location'] as String,
    districtOfficeName: json['districtOfficeName'] as String,
    postalCode: json['postalCode'] as String,
    address: json['address'] as String,
    detailedAddress: json['detailedAddress'] as String,
    telephoneNumber: json['telephoneNumber'] as String,
    homepageAddress: json['homepageAddress'] as String,
    isCoeduSchool: json['isCoeduSchool'] as String,
    faxNumber: json['faxNumber'] as String,
    foundedDate: json['foundedDate'] == null
        ? null
        : DateTime.parse(json['foundedDate'] as String),
    anniversary: json['anniversary'] == null
        ? null
        : DateTime.parse(json['anniversary'] as String),
    uploadTime: json['uploadTime'] == null
        ? null
        : DateTime.parse(json['uploadTime'] as String),
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
      'foundedDate': instance.foundedDate?.toIso8601String(),
      'anniversary': instance.anniversary?.toIso8601String(),
      'uploadTime': instance.uploadTime?.toIso8601String(),
    };
