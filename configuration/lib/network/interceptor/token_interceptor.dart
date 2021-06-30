import 'package:configuration/data/source/local/sessions_pref.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends InterceptorsWrapper {
  static const List<int> unauthorizedTokenCodes = [401];

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (response.statusCode == 200) {
      if (response.data is Map) {
        if (response.data["token"] != null) {
          SessionPref.saveSession(accessToken: response.data["token"]);
        }
      }
    }
    super.onResponse(response, handler);
  }

  void killSession() {}
}
