import 'package:configuration/data/common/base_response.dart';
import 'package:flutter_video_calls/data/user/model/account_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'verify_code_response.g.dart';

@JsonSerializable()
class VerifyCodeResponse extends BaseResponse {
  VerifyCodeResponse();

  @JsonKey(name: 'data')
  AccountResponse? account;

  factory VerifyCodeResponse.fromJson(Map<String, dynamic> json) =>
      _$VerifyCodeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyCodeResponseToJson(this);
}
