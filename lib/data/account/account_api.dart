import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'account_api.g.dart';

@RestApi()
abstract class AccountApi {
  factory AccountApi(Dio dio, {String baseUrl}) = _AccountApi;
}