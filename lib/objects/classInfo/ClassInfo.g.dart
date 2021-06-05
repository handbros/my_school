// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassInfo _$ClassInfoFromJson(Map<String, dynamic> json) {
  return ClassInfo(
    json['officeCode'] as String,
    json['officeName'] as String,
    json['standardSchoolCode'] as int,
    json['schoolName'] as String,
    json['targetYear'] as int,
    json['grade'] as int,
    json['dayOrNight'] as String,
    json['schoolType'] as String,
    json['fieldName'] as String,
    json['departmentName'] as String,
    json['className'] as String,
    DateTime.parse(json['uploadTime'] as String),
  );
}

Map<String, dynamic> _$ClassInfoToJson(ClassInfo instance) => <String, dynamic>{
      'officeCode': instance.officeCode,
      'officeName': instance.officeName,
      'standardSchoolCode': instance.standardSchoolCode,
      'schoolName': instance.schoolName,
      'targetYear': instance.targetYear,
      'grade': instance.grade,
      'dayOrNight': instance.dayOrNight,
      'schoolType': instance.schoolType,
      'fieldName': instance.fieldName,
      'departmentName': instance.departmentName,
      'className': instance.className,
      'uploadTime': instance.uploadTime.toIso8601String(),
    };
