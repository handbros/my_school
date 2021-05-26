// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SchoolInfoApiResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchoolInfoApiResult _$SchoolInfoApiResultFromJson(Map<String, dynamic> json) {
  return SchoolInfoApiResult(
    requestUrl: json['requestUrl'] as String,
    resultCode: _$enumDecodeNullable(_$ResultCodeEnumMap, json['resultCode']),
    resultMessage: json['resultMessage'] as String,
    itemsTotalCount: json['itemsTotalCount'] as int,
    items: (json['items'] as List)
        ?.map((e) =>
            e == null ? null : SchoolInfo.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SchoolInfoApiResultToJson(
        SchoolInfoApiResult instance) =>
    <String, dynamic>{
      'requestUrl': instance.requestUrl,
      'resultCode': _$ResultCodeEnumMap[instance.resultCode],
      'resultMessage': instance.resultMessage,
      'itemsTotalCount': instance.itemsTotalCount,
      'items': instance.items?.map((e) => e?.toJson())?.toList(),
    };

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
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
