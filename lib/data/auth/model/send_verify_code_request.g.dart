// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_verify_code_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SendVerifyCodeRequest _$SendVerifyCodeRequestFromJson(
    Map<String, dynamic> json) {
  return SendVerifyCodeRequest(
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    dialCode: json['dialCode'] as String?,
    alpha2Code: json['alpha2Code'] as String?,
    alpha3Code: json['alpha3Code'] as String?,
    typeCode: _$enumDecodeNullable(_$VerifyTypeCodeEnumMap, json['typeCode']),
  );
}

Map<String, dynamic> _$SendVerifyCodeRequestToJson(
        SendVerifyCodeRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'dialCode': instance.dialCode,
      'alpha2Code': instance.alpha2Code,
      'alpha3Code': instance.alpha3Code,
      'typeCode': _$VerifyTypeCodeEnumMap[instance.typeCode],
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
