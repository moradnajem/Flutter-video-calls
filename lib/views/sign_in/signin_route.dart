import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/sign_in/ui/signin_screen.dart';

class SignInRoute extends RouteDefine {
  static const ID = "SignIn";

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => SignInScreen(),
        ),
      ];
}
