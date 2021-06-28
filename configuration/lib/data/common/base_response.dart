import 'package:configuration/data/common/response_code.dart';

class BaseResponse<T> {
  String? timestamp;
  int? code;
  String? message;
  String? error;
  String? token;

  BaseResponse({this.code, this.message, this.error, this.token});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? ResponseCode.SERVER_UNKNOWN_ERROR;
    message = json['message'] ?? ResponseCode.SERVER_UNKNOWN_ERROR.message;
    error = json['error'] ?? "";
    token = json['token'] ?? "";
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': this.code,
        'message': this.message,
        'error': this.error,
        'token': this.token,
      };
}
