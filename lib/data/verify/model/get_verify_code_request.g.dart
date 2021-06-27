// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_verify_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetVerifyCodeRequest _$GetVerifyCodeRequestFromJson(Map<String, dynamic> json) {
  return GetVerifyCodeRequest(
    json['email'] as String?,
    json['phoneNumber'] as String?,
    json['dialCode'] as String?,
    json['alpha2Code'] as String?,
    json['alpha3Code'] as String?,
    _$enumDecodeNullable(_$VerifyTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$GetVerifyCodeRequestToJson(
        GetVerifyCodeRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dialCode': instance.dialCode,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'type': _$VerifyTypeEnumMap[instance.type],
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

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$VerifyTypeEnumMap = {
  VerifyType.PHONE_NUMBER: 'PHONE_NUMBER',
  VerifyType.EMAIL: 'EMAIL',
  VerifyType.PASSWORD: 'PASSWORD',
};
