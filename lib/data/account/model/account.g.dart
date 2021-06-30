// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    json['id'] as String?,
    json['socialId'] as String?,
    json['phoneNumber'] as String?,
    json['email'] as String?,
    json['active'] as bool?,
    json['emailVerified'] as bool?,
    json['phoneVerified'] as bool?,
    json['registerTime'] as String?,
    json['emailVerifiedTime'] as String?,
    json['phoneVerifiedTime'] as String?,
    json['collaboratorId'] as String?,
    _$enumDecodeNullable(_$RoleEnumMap, json['role']),
    json['user'] == null
        ? null
        : User.fromJson(json['user'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'socialId': instance.socialId,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'active': instance.active,
      'emailVerified': instance.emailVerified,
      'phoneVerified': instance.phoneVerified,
      'registerTime': instance.registerTime,
      'emailVerifiedTime': instance.emailVerifiedTime,
      'phoneVerifiedTime': instance.phoneVerifiedTime,
      'collaboratorId': instance.collaboratorId,
      'role': _$RoleEnumMap[instance.role],
      'user': instance.user,
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

const _$RoleEnumMap = {
  Role.STAFF: 'STAFF',
  Role.CUSTOMER: 'CUSTOMER',
  Role.ADMIN: 'ADMIN',
  Role.UNKNOWN: 'UNKNOWN',
};
