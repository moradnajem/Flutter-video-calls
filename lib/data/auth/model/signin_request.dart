import 'package:flutter_video_calls/data/auth/model/verify_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'signin_request.g.dart';

@JsonSerializable()
class SignInRequest {
  SignInRequest({
    this.email,
    required this.phoneNumber,
    required this.dialCode,
    required this.alpha2Code,
    this.alpha3Code,
    required this.type,
    this.password,
    this.deviceName,
    this.deviceId,
    required this.platform,
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
  @JsonKey(name: 'password')
  String? password;
  @JsonKey(name: 'deviceName')
  String? deviceName;
  @JsonKey(name: 'deviceId')
  String? deviceId;
  @JsonKey(name: 'platform')
  String? platform;

  factory SignInRequest.fromJson(Map<String, dynamic> json) =>
      _$SignInRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SignInRequestToJson(this);
}
