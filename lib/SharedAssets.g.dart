// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SharedAssets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedAssets _$SharedAssetsFromJson(Map<String, dynamic> json) {
  return SharedAssets(
    json['acceptTransferringDeviceInformation'] as bool,
    (json['classSearchHistory'] as List<dynamic>)
        .map((e) => e as String)
        .toList(),
    (json['classList'] as List<dynamic>)
        .map((e) => ClassInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    ClassInfo.fromJson(json['selectedClass'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SharedAssetsToJson(SharedAssets instance) =>
    <String, dynamic>{
      'acceptTransferringDeviceInformation':
          instance.acceptTransferringDeviceInformation,
      'classSearchHistory': instance.classSearchHistory,
      'classList': instance.classList.map((e) => e.toJson()).toList(),
      'selectedClass': instance.selectedClass.toJson(),
    };
