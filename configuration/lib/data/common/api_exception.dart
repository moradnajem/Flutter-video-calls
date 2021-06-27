import 'package:dio/dio.dart';

class ApiException {
  late String? errorCode;
  late String? errorMessage = "";
  late DioError exception;

  ApiException({required DioError exception}) {
    this.exception = exception;
    errorCode = "test error code";
    errorMessage = "test error message";
  }
}
