import 'package:flutter_video_calls/data/user/model/role.dart';
import 'package:flutter_video_calls/data/user/model/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable()
class Account {
  Account(
      this.id,
      this.socialId,
      this.phoneNumber,
      this.email,
      this.active,
      this.emailVerified,
      this.phoneVerified,
      this.registerTime,
      this.emailVerifiedTime,
      this.phoneVerifiedTime,
      this.collaboratorId,
      this.role,
      this.user);

  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "socialId")
  String? socialId;
  @JsonKey(name: "phoneNumber")
  String? phoneNumber;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "active")
  bool? active;
  @JsonKey(name: "emailVerified")
  bool? emailVerified;
  @JsonKey(name: "phoneVerified")
  bool? phoneVerified;
  @JsonKey(name: "registerTime")
  String? registerTime;
  @JsonKey(name: "emailVerifiedTime")
  String? emailVerifiedTime;
  @JsonKey(name: "phoneVerifiedTime")
  String? phoneVerifiedTime;
  @JsonKey(name: "collaboratorId")
  String? collaboratorId;
  @JsonKey(name: "role")
  Role? role;
  @JsonKey(name: "user")
  User? user;

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
