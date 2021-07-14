import 'package:flutter_video_calls/data/auth/model/verify_type_code.dart';
import 'package:json_annotation/json_annotation.dart';

part 'send_verify_code_request.g.dart';

@JsonSerializable()
class SendVerifyCodeRequest {
  SendVerifyCodeRequest({
    this.email,
    this.phoneNumber,
    this.dialCode,
    this.alpha2Code,
    this.alpha3Code,
    this.typeCode,
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

  factory SendVerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$SendVerifyCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$SendVerifyCodeRequestToJson(this);
}
