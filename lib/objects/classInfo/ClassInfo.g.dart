// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ClassInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ClassInfo _$ClassInfoFromJson(Map<String, dynamic> json) {
  return ClassInfo(
    officeCode: json['officeCode'] as String,
    officeName: json['officeName'] as String,
    standardSchoolCode: json['standardSchoolCode'] as int,
    schoolName: json['schoolName'] as String,
    targetYear: json['targetYear'] as int,
    grade: json['grade'] as int,
    dayOrNight: json['dayOrNight'] as String,
    schoolType: json['schoolType'] as String,
    fieldName: json['fieldName'] as String,
    departmentName: json['departmentName'] as String,
    className: json['className'] as String,
    uploadTime: json['uploadTime'] == null
        ? null
        : DateTime.parse(json['uploadTime'] as String),
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
      'uploadTime': instance.uploadTime?.toIso8601String(),
    };
