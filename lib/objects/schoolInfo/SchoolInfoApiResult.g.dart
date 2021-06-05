// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolInfoApiResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolInfoApiResult _$SchoolInfoApiResultFromJson(Map<String, dynamic> json) {
  return SchoolInfoApiResult(
    json['requestUrl'] as String,
    _$enumDecode(_$ResultCodeEnumMap, json['resultCode']),
    json['resultMessage'] as String,
    json['itemsTotalCount'] as int,
    (json['items'] as List<dynamic>)
        .map((e) => SchoolInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SchoolInfoApiResultToJson(
        SchoolInfoApiResult instance) =>
    <String, dynamic>{
      'requestUrl': instance.requestUrl,
      'resultCode': _$ResultCodeEnumMap[instance.resultCode],
      'resultMessage': instance.resultMessage,
      'itemsTotalCount': instance.itemsTotalCount,
      'items': instance.items.map((e) => e.toJson()).toList(),
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ResultCodeEnumMap = {
  ResultCode.None: 'None',
  ResultCode.Exception: 'Exception',
  ResultCode.Okay: 'Okay',
  ResultCode.BlockedKey: 'BlockedKey',
  ResultCode.DataNotFound: 'DataNotFound',
  ResultCode.InvalidKey: 'InvalidKey',
  ResultCode.MissingArguments: 'MissingArguments',
  ResultCode.ServiceNotFound: 'ServiceNotFound',
  ResultCode.InvalidArgumentType: 'InvalidArgumentType',
  ResultCode.ExceededLimit: 'ExceededLimit',
  ResultCode.ExceededTraffic: 'ExceededTraffic',
  ResultCode.ServerError: 'ServerError',
  ResultCode.DatabaseConnectionError: 'DatabaseConnectionError',
  ResultCode.SqlQueryError: 'SqlQueryError',
};
