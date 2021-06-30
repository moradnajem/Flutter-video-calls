import 'package:flutter_video_calls/data/account/model/Gender.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  User(this.userId, this.firstName, this.lastName, this.weight, this.height,
      this.gender, this.description, this.avatar);

  @JsonKey(name: 'userId')
  String? userId;
  @JsonKey(name: 'firstName')
  String? firstName;
  @JsonKey(name: 'lastName')
  String? lastName;
  @JsonKey(name: 'weight')
  double? weight;
  @JsonKey(name: 'height')
  double? height;
  @JsonKey(name: 'gender')
  Gender? gender;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'avatar')
  String? avatar;

  factory User.fromJson(Map<String, dynamic> json) =>
      _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
