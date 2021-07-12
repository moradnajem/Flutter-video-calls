import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/sign_up/ui/signup_screen.dart';

class SignUpRoute extends RouteDefine {
  static const ID = "SignUp";

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => SignUpScreen(),
        ),
      ];
}
