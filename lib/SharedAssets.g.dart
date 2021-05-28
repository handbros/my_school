// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SharedAssets.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SharedAssets _$SharedAssetsFromJson(Map<String, dynamic> json) {
  return SharedAssets(
    acceptUsingDeviceStorage: json['acceptUsingDeviceStorage'] as bool,
    useOfflineMode: json['useOfflineMode'] as bool,
    classSearchHistory:
        (json['classSearchHistory'] as List)?.map((e) => e as String)?.toList(),
    classList: (json['classList'] as List)
        ?.map((e) =>
            e == null ? null : ClassInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    selectedClass: json['selectedClass'] == null
        ? null
        : ClassInfo.fromJson(json['selectedClass'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$SharedAssetsToJson(SharedAssets instance) =>
    <String, dynamic>{
      'acceptUsingDeviceStorage': instance.acceptUsingDeviceStorage,
      'useOfflineMode': instance.useOfflineMode,
      'classSearchHistory': instance.classSearchHistory,
      'classList': instance.classList?.map((e) => e?.toJson())?.toList(),
      'selectedClass': instance.selectedClass?.toJson(),
    };
