// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GeneralTimeTable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralTimeTable _$GeneralTimeTableFromJson(Map<String, dynamic> json) {
  return GeneralTimeTable(
    json['officeCode'] as String,
    json['officeName'] as String,
    json['standardSchoolCode'] as int,
    json['schoolName'] as String,
    json['targetYear'] as int,
    json['semester'] as int,
    DateTime.parse(json['date'] as String),
    json['grade'] as int,
    json['className'] as String,
    json['period'] as int,
    json['content'] as String,
    json['curriculum'] as String,
    json['classroomName'] as String,
    DateTime.parse(json['uploadTime'] as String),
  );
}

Map<String, dynamic> _$GeneralTimeTableToJson(GeneralTimeTable instance) =>
    <String, dynamic>{
      'officeCode': instance.officeCode,
      'officeName': instance.officeName,
      'standardSchoolCode': instance.standardSchoolCode,
      'schoolName': instance.schoolName,
      'targetYear': instance.targetYear,
      'semester': instance.semester,
      'date': instance.date.toIso8601String(),
      'grade': instance.grade,
      'className': instance.className,
      'period': instance.period,
      'content': instance.content,
      'curriculum': instance.curriculum,
      'classroomName': instance.classroomName,
      'uploadTime': instance.uploadTime.toIso8601String(),
    };
