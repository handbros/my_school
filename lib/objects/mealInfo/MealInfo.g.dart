// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MealInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealInfo _$MealInfoFromJson(Map<String, dynamic> json) {
  return MealInfo(
    officeCode: json['officeCode'] as String,
    officeName: json['officeName'] as String,
    standardSchoolCode: json['standardSchoolCode'] as int,
    schoolName: json['schoolName'] as String,
    mealCode: json['mealCode'] as int,
    mealName: json['mealName'] as String,
    date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
    menu: json['menu'] as String,
    calorie: json['calorie'] as String,
    origins: json['origins'] as String,
    nutrients: json['nutrients'] as String,
  );
}

Map<String, dynamic> _$MealInfoToJson(MealInfo instance) => <String, dynamic>{
      'officeCode': instance.officeCode,
      'officeName': instance.officeName,
      'standardSchoolCode': instance.standardSchoolCode,
      'schoolName': instance.schoolName,
      'mealCode': instance.mealCode,
      'mealName': instance.mealName,
      'date': instance.date?.toIso8601String(),
      'menu': instance.menu,
      'calorie': instance.calorie,
      'origins': instance.origins,
      'nutrients': instance.nutrients,
    };
