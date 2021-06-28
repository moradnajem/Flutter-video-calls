import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/verify_code/ui/verify_code_screen.dart';

class VerifyCodeRoute extends RouteDefine {
  static const ID = "VerifyPin";

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => VerifyCodeScreen(),
        ),
      ];
}
