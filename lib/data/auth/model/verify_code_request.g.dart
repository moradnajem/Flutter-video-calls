// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeRequest _$VerifyCodeRequestFromJson(Map<String, dynamic> json) {
  return VerifyCodeRequest(
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    dialCode: json['dialCode'] as String?,
    alpha2Code: json['alpha2Code'] as String?,
    alpha3Code: json['alpha3Code'] as String?,
    typeCode: _$enumDecodeNullable(_$VerifyTypeCodeEnumMap, json['typeCode']),
    verifyCode: json['verifyCode'] as int?,
    deviceName: json['deviceName'] as String?,
    deviceId: json['deviceId'] as String?,
    platform: json['platform'] as String?,
    role: _$enumDecodeNullable(_$RoleEnumMap, json['role']),
  );
}

Map<String, dynamic> _$VerifyCodeRequestToJson(VerifyCodeRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dialCode': instance.dialCode,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'typeCode': _$VerifyTypeCodeEnumMap[instance.typeCode],
      'verifyCode': instance.verifyCode,
      'deviceName': instance.deviceName,
      'deviceId': instance.deviceId,
      'platform': instance.platform,
      'role': _$RoleEnumMap[instance.role],
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

const _$VerifyTypeCodeEnumMap = {
  VerifyTypeCode.PHONE_NUMBER: 'PHONE_NUMBER',
  VerifyTypeCode.EMAIL: 'EMAIL',
  VerifyTypeCode.PASSWORD: 'PASSWORD',
};

const _$RoleEnumMap = {
  Role.STAFF: 'STAFF',
  Role.CUSTOMER: 'CUSTOMER',
  Role.ADMIN: 'ADMIN',
  Role.UNKNOWN: 'UNKNOWN',
};
