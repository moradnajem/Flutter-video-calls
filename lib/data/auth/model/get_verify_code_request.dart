import 'package:flutter_video_calls/data/auth/model/verify_type.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_verify_code_request.g.dart';

@JsonSerializable()
class GetVerifyCodeRequest {
  GetVerifyCodeRequest(
    this.email,
    this.phoneNumber,
    this.dialCode,
    this.alpha2Code,
    this.alpha3Code,
    this.type,
  );

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

  factory GetVerifyCodeRequest.fromJson(Map<String, dynamic> json) =>
      _$GetVerifyCodeRequestFromJson(json);

  Map<String, dynamic> toJson() => _$GetVerifyCodeRequestToJson(this);
}
