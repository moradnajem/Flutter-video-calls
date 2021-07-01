import 'package:configuration/data/common/response_code.dart';

class BaseResponse {
  String? timestamp;
  int? code;
  String? message;
  String? error;
  dynamic errorBody;

  BaseResponse(
      {this.timestamp, this.code, this.message, this.error, this.errorBody});

  BaseResponse.fromJson(Map<String, dynamic> json) {
    timestamp = json['timestamp'] ?? "";
    code = json['code'] ?? ResponseCode.SERVER_UNKNOWN_ERROR;
    message = json['message'] ?? ResponseCode.SERVER_UNKNOWN_ERROR.message;
    error = json['error'] ?? "";
    errorBody = json['errorBody'];
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'timestamp': this.timestamp,
        'code': this.code,
        'message': this.message,
        'error': this.error,
        'errorBody': this.errorBody,
      };
}
