import 'package:configuration/di/di_module.dart';
import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/interceptor/auth_interceptor.dart';
import 'package:configuration/network/interceptor/data_format_interceptor.dart';
import 'package:configuration/network/interceptor/token_interceptor.dart';
import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_video_calls/data/account/account_api.dart';
import 'package:flutter_video_calls/data/verify/verify_api.dart';

class ApiModule extends DIModule {
  @override
  provides() async {
    final dio = await _setup();
    getIt.registerSingleton(dio);

    // service registration
    getIt.registerSingleton(VerifyApi(dio, baseUrl: dio.options.baseUrl));
    getIt.registerSingleton(AccountApi(dio, baseUrl: dio.options.baseUrl));
  }

 FutureOr<Dio> _setup() async {
    final options = BaseOptions(
      connectTimeout: BuildConfig.get()?.connectTimeout,
      receiveTimeout: BuildConfig.get()?.receiveTimeout,
      responseType: ResponseType.json,
      validateStatus: (status) {
        return true;
      },
      baseUrl: BuildConfig.get()?.baseUrl ?? "",
    );
    final Dio dio = Dio(options);

    /// Unified add authentication request header
    dio.interceptors.add(AuthInterceptor());

    dio.interceptors.add(TokenInterceptor());
    //
    // /// Adapt data (according to your own data structure, you can choose to add it)
    dio.interceptors.add(DataFormatInterceptor());

    /// Print Log (production mode removal)
    if (BuildConfig.get()?.flavor != null &&
        BuildConfig.get()?.flavor != Flavor.RELEASE) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return dio;
  }
}
