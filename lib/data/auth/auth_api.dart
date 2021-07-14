import 'package:configuration/data/common/base_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_video_calls/data/account/model/account_response.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_code_request.dart';
import 'package:flutter_video_calls/data/auth/model/verify_code_request.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST('auth/verify/send')
  Future<BaseResponse?>? sendVerifyCode(
    @Query("type") String? sendVerifyType,
    @Body() SendVerifyCodeRequest request,
  );

  @POST('auth/verify/register')
  Future<AccountResponse?>? registrationVerification(@Body() VerifyCodeRequest request);

  @POST('auth/verify/login')
  Future<AccountResponse?>? loginVerification(@Body() VerifyCodeRequest request);
}
