import 'package:configuration/data/common/base_response.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_video_calls/data/account/model/account_response.dart';
import 'package:flutter_video_calls/data/auth/auth_api.dart';
import 'package:flutter_video_calls/data/auth/model/get_verify_code_request.dart';
import 'package:flutter_video_calls/data/auth/model/signin_request.dart';
import 'package:flutter_video_calls/data/auth/model/verify_code_request.dart';


class AuthRepository {
  AuthApi? api;

  AuthRepository({this.api});

  Future<BaseResponse?> signUp(GetVerifyCodeRequest request) async {
    try {
      final response = await api?.signUnWithPhoneNUmber(request);
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<AccountResponse?> signIn(SignInRequest request) async {
    try {
      final response = await api?.signInWithPhoneNumber(request);
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<AccountResponse?> verifyCode(VerifyCodeRequest request) async {
    try {
      final response = await api?.verifyCode(request);
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }
}
