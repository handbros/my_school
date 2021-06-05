// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolSchedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolSchedule _$SchoolScheduleFromJson(Map<String, dynamic> json) {
  return SchoolSchedule(
    json['officeCode'] as String,
    json['officeName'] as String,
    json['standardSchoolCode'] as int,
    json['schoolName'] as String,
    json['targetYear'] as int,
    json['feature'] as String,
    DateTime.parse(json['date'] as String),
    json['eventName'] as String,
    json['eventDetails'] as String,
    json['isFirstGradeEvent'] as bool,
    json['isSecondGradeEvent'] as bool,
    json['isThirdGradeEvent'] as bool,
    json['isFourthGradeEvent'] as bool,
    json['isFifthGradeEvent'] as bool,
    json['isSixthGradeEvent'] as bool,
    DateTime.parse(json['uploadTime'] as String),
  );
}

Map<String, dynamic> _$SchoolScheduleToJson(SchoolSchedule instance) =>
    <String, dynamic>{
      'officeCode': instance.officeCode,
      'officeName': instance.officeName,
      'standardSchoolCode': instance.standardSchoolCode,
      'schoolName': instance.schoolName,
      'targetYear': instance.targetYear,
      'feature': instance.feature,
      'date': instance.date.toIso8601String(),
      'eventName': instance.eventName,
      'eventDetails': instance.eventDetails,
      'isFirstGradeEvent': instance.isFirstGradeEvent,
      'isSecondGradeEvent': instance.isSecondGradeEvent,
      'isThirdGradeEvent': instance.isThirdGradeEvent,
      'isFourthGradeEvent': instance.isFourthGradeEvent,
      'isFifthGradeEvent': instance.isFifthGradeEvent,
      'isSixthGradeEvent': instance.isSixthGradeEvent,
      'uploadTime': instance.uploadTime.toIso8601String(),
    };
