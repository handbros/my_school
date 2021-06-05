// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MealInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealInfo _$MealInfoFromJson(Map<String, dynamic> json) {
  return MealInfo(
    json['officeCode'] as String,
    json['officeName'] as String,
    json['standardSchoolCode'] as int,
    json['schoolName'] as String,
    json['mealCode'] as int,
    json['mealName'] as String,
    DateTime.parse(json['date'] as String),
    json['menu'] as String,
    json['calorie'] as String,
    json['origins'] as String,
    json['nutrients'] as String,
  );
}

Map<String, dynamic> _$MealInfoToJson(MealInfo instance) => <String, dynamic>{
      'officeCode': instance.officeCode,
      'officeName': instance.officeName,
      'standardSchoolCode': instance.standardSchoolCode,
      'schoolName': instance.schoolName,
      'mealCode': instance.mealCode,
      'mealName': instance.mealName,
      'date': instance.date.toIso8601String(),
      'menu': instance.menu,
      'calorie': instance.calorie,
      'origins': instance.origins,
      'nutrients': instance.nutrients,
    };
