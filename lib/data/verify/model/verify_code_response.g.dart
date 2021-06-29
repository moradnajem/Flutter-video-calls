// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_code_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyCodeResponse _$VerifyCodeResponseFromJson(Map<String, dynamic> json) {
  return VerifyCodeResponse()
    ..timestamp = json['timestamp'] as String?
    ..code = json['code'] as int?
    ..message = json['message'] as String?
    ..error = json['error'] as String?
    ..token = json['token'] as String?
    ..errorBody = json['errorBody']
    ..account = json['data'] == null
        ? null
        : AccountResponse.fromJson(json['data'] as Map<String, dynamic>);
}

Map<String, dynamic> _$VerifyCodeResponseToJson(VerifyCodeResponse instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp,
      'code': instance.code,
      'message': instance.message,
      'error': instance.error,
      'token': instance.token,
      'errorBody': instance.errorBody,
      'data': instance.account,
    };
