// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolSchedule.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolSchedule _$SchoolScheduleFromJson(Map<String, dynamic> json) {
  return SchoolSchedule(
    officeCode: json['officeCode'] as String,
    officeName: json['officeName'] as String,
    standardSchoolCode: json['standardSchoolCode'] as int,
    schoolName: json['schoolName'] as String,
    targetYear: json['targetYear'] as int,
    feature: json['feature'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    eventName: json['eventName'] as String,
    eventDetails: json['eventDetails'] as String,
    isFirstGradeEvent: json['isFirstGradeEvent'] as bool,
    isSecondGradeEvent: json['isSecondGradeEvent'] as bool,
    isThirdGradeEvent: json['isThirdGradeEvent'] as bool,
    isFourthGradeEvent: json['isFourthGradeEvent'] as bool,
    isFifthGradeEvent: json['isFifthGradeEvent'] as bool,
    isSixthGradeEvent: json['isSixthGradeEvent'] as bool,
    uploadTime: json['uploadTime'] == null
        ? null
        : DateTime.parse(json['uploadTime'] as String),
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
      'date': instance.date?.toIso8601String(),
      'eventName': instance.eventName,
      'eventDetails': instance.eventDetails,
      'isFirstGradeEvent': instance.isFirstGradeEvent,
      'isSecondGradeEvent': instance.isSecondGradeEvent,
      'isThirdGradeEvent': instance.isThirdGradeEvent,
      'isFourthGradeEvent': instance.isFourthGradeEvent,
      'isFifthGradeEvent': instance.isFifthGradeEvent,
      'isSixthGradeEvent': instance.isSixthGradeEvent,
      'uploadTime': instance.uploadTime?.toIso8601String(),
    };
