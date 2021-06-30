import 'package:configuration/data/common/base_response.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_video_calls/data/verify/model/get_verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_code_response.dart';
import 'package:flutter_video_calls/data/verify/verify_api.dart';

class VerifyRepository {
  VerifyApi? api;

  VerifyRepository({this.api});

  Future<BaseResponse?> getVerifyCode(GetVerifyCodeRequest request) async {
    try {
      final response = await api?.getVerifyCode(request);
      return response;
    } on DioError catch (dioError) {
      throw ApiException(exception: dioError);
    } catch (e) {
      throw Exception('Unexpected Exception $e');
    }
  }

  Future<VerifyCodeResponse?> verifyCode(VerifyCodeRequest request) async {
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
