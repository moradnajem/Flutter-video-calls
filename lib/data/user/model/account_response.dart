import 'package:configuration/data/common/base_response.dart';
import 'package:flutter_video_calls/data/user/model/account.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account_response.g.dart';

@JsonSerializable()
class AccountResponse extends BaseResponse {

  AccountResponse(this.account);

  @JsonKey(name: "data")
  Account? account;

  factory AccountResponse.fromJson(Map<String, dynamic> json) =>
      _$AccountResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AccountResponseToJson(this);
}
