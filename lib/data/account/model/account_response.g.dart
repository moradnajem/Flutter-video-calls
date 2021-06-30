// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccountResponse _$AccountResponseFromJson(Map<String, dynamic> json) {
  return AccountResponse(
    json['data'] == null
        ? null
        : Account.fromJson(json['data'] as Map<String, dynamic>),
  )
    ..timestamp = json['timestamp'] as String?
    ..code = json['code'] as int?
    ..message = json['message'] as String?
    ..error = json['error'] as String?
    ..token = json['token'] as String?
    ..errorBody = json['errorBody'];
}

Map<String, dynamic> _$AccountResponseToJson(AccountResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'code': instance.code,
      'message': instance.message,
      'error': instance.error,
      'token': instance.token,
      'errorBody': instance.errorBody,
      'data': instance.account,
    };
