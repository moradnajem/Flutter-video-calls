import 'package:configuration/data/common/base_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_video_calls/data/account/model/account_response.dart';
import 'package:flutter_video_calls/data/auth/model/get_verify_code_request.dart';
import 'package:flutter_video_calls/data/auth/model/signin_request.dart';
import 'package:flutter_video_calls/data/auth/model/verify_code_request.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('auth/verify/phone')
  Future<BaseResponse?>? signUnWithPhoneNUmber(@Body() GetVerifyCodeRequest request);

  @POST('auth/verify/code')
  Future<AccountResponse?>? verifyCode(@Body() VerifyCodeRequest request);

  @POST('auth/login/phone')
  Future<AccountResponse?>? signInWithPhoneNumber(@Body() SignInRequest request);
}
