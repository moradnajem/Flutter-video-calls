import 'package:flutter_video_calls/views/calls/calling/calling_route.dart';
import 'package:flutter_video_calls/views/calls/incoming_call/incoming_call_route.dart';
import 'package:flutter_video_calls/views/calls/outgoing_call/outgoing_call_route.dart';
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
  CallingRoute();
  IncomingCallRoute();
  OutgoingCallRoute();
}
