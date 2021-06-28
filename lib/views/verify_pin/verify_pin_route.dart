import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/sign_in/ui/signin_screen.dart';
import 'package:flutter_video_calls/views/verify_pin/ui/verify_pin_screen.dart';

class VerifyPinRoute extends RouteDefine {
  static const ID = "VerifyPin";

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => VerifyPinScreen(),
        ),
      ];
}
