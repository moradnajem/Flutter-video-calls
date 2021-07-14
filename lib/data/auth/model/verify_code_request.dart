import 'package:flutter_video_calls/data/account/model/role.dart';
import 'package:flutter_video_calls/data/auth/model/verify_type_code.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_code_request.g.dart';

@JsonSerializable()
class VerifyCodeRequest {
  VerifyCodeRequest({
    this.email,
    required this.phoneNumber,
    required this.dialCode,
    required this.alpha2Code,
    this.alpha3Code,
    required this.typeCode,
    required this.verifyCode,
    this.deviceName,
    this.deviceId,
    required this.platform,
    required this.role,
  });

  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'phoneNumber')
  String? phoneNumber;
  @JsonKey(name: 'dialCode')
  String? dialCode;
  @JsonKey(name: 'alpha2Code')
  String? alpha2Code;
  @JsonKey(name: 'alpha3Code')
  String? alpha3Code;
  @JsonKey(name: 'typeCode')
  VerifyTypeCode? typeCode;
  @JsonKey(name: 'verifyCode')
  int? verifyCode;

  @JsonKey(name: 'deviceName')
  String? deviceName;
  @JsonKey(name: 'deviceId')
  String? deviceId;
  @JsonKey(name: 'platform')
  String? platform;
  @JsonKey(name: 'role')
  Role? role;

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeRequestToJson(this);
}
