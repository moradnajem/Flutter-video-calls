import 'package:flutter_video_calls/views/call_out/call_out_route.dart';
import 'package:flutter_video_calls/views/home/home_route.dart';
import 'package:flutter_video_calls/views/introduction/introduction_route.dart';
import 'package:flutter_video_calls/views/sign_in/signin_route.dart';
import 'package:flutter_video_calls/views/sign_up/signup_route.dart';
import 'package:flutter_video_calls/views/verify_code/verify_code_route.dart';

void generateRoutes() {
  IntroductionRoute();
  SignInRoute();
  SignUpRoute();
  VerifyCodeRoute();
  HomeRoute();
  CallOutRoute();
}
