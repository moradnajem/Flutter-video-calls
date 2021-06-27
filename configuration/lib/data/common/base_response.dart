import 'package:configuration/data/common/response_code.dart';

class BaseResponse {
  int? code;
  String? message;
  int? errorCode;
  String? error;
  String? token;

  BaseResponse(
      {this.code,
      this.message,
      this.errorCode,
      this.error,
      this.token});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    code = json['code'] ?? ResponseCode.SERVER_UNKNOWN_ERROR;
    message = json['message'] ?? "";
    errorCode = json['errorCode'] ?? 500;
    error = json['error'] ?? "";
    token = json['token'] ?? "";
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': this.code,
        'message': this.message,
        'errorCode': this.errorCode,
        'error': this.error,
        'token': this.token,
      };
}
