import 'package:configuration/data/common/base_response.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:flutter_video_calls/data/verify/model/get_verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_code_response.dart';
import 'package:retrofit/retrofit.dart';

part 'account_api.g.dart';

@RestApi()
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;
}