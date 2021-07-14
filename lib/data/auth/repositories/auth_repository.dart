import 'package:configuration/data/common/base_response.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_video_calls/data/account/model/account_response.dart';
import 'package:flutter_video_calls/data/auth/auth_api.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_code_request.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_type.dart';
import 'package:flutter_video_calls/data/auth/model/verify_code_request.dart';

class AuthRepository {
  AuthApi? api;

  AuthRepository({this.api});

  Future<BaseResponse?> sendVerifyCode(
      SendVerifyType sendVerifyType, SendVerifyCodeRequest request) async {
    try {
      final response = await api?.sendVerifyCode(
          SendVerifyTypeEnumMap[sendVerifyType], request);
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<AccountResponse?> registrationVerification(
      VerifyCodeRequest request) async {
    try {
      final response = await api?.registrationVerification(request);
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<AccountResponse?> loginVerification(VerifyCodeRequest request) async {
    try {
      final response = await api?.loginVerification(request);
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
