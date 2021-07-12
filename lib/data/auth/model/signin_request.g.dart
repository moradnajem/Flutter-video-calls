// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignInRequest _$SignInRequestFromJson(Map<String, dynamic> json) {
  return SignInRequest(
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    dialCode: json['dialCode'] as String?,
    alpha2Code: json['alpha2Code'] as String?,
    alpha3Code: json['alpha3Code'] as String?,
    type: _$enumDecodeNullable(_$VerifyTypeEnumMap, json['type']),
    password: json['password'] as String?,
    deviceName: json['deviceName'] as String?,
    deviceId: json['deviceId'] as String?,
    platform: json['platform'] as String?,
  );
}

Map<String, dynamic> _$SignInRequestToJson(SignInRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dialCode': instance.dialCode,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'type': _$VerifyTypeEnumMap[instance.type],
      'password': instance.password,
      'deviceName': instance.deviceName,
      'deviceId': instance.deviceId,
      'platform': instance.platform,
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
