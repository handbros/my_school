// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'GeneralTimeTable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneralTimeTable _$GeneralTimeTableFromJson(Map<String, dynamic> json) {
  return GeneralTimeTable(
    officeCode: json['officeCode'] as String,
    officeName: json['officeName'] as String,
    standardSchoolCode: json['standardSchoolCode'] as int,
    schoolName: json['schoolName'] as String,
    targetYear: json['targetYear'] as int,
    semester: json['semester'] as int,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    grade: json['grade'] as int,
    className: json['className'] as String,
    period: json['period'] as int,
    content: json['content'] as String,
    curriculum: json['curriculum'] as String,
    classroomName: json['classroomName'] as String,
    uploadTime: json['uploadTime'] == null
        ? null
        : DateTime.parse(json['uploadTime'] as String),
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
      'date': instance.date?.toIso8601String(),
      'grade': instance.grade,
      'className': instance.className,
      'period': instance.period,
      'content': instance.content,
      'curriculum': instance.curriculum,
      'classroomName': instance.classroomName,
      'uploadTime': instance.uploadTime?.toIso8601String(),
    };
