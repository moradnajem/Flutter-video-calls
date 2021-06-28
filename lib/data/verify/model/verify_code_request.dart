import 'package:flutter_video_calls/data/verify/model/verify_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_code_request.g.dart';

@JsonSerializable()
class VerifyCodeRequest {
  VerifyCodeRequest({
    this.email,
    this.phoneNumber,
    this.dialCode,
    this.alpha2Code,
    this.alpha3Code,
    this.type,
    this.verifyCode,
    this.deviceName,
    this.deviceId,
    this.platform,
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
  @JsonKey(name: 'type')
  VerifyType? type;
  @JsonKey(name: 'verifyCode')
  int? verifyCode;

  @JsonKey(name: 'deviceName')
  String? deviceName;
  @JsonKey(name: 'deviceId')
  String? deviceId;
  @JsonKey(name: 'platform')
  String? platform;

  factory VerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeRequestToJson(this);
}
