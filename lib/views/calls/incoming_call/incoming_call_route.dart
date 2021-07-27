import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/calls/incoming_call/ui/incoming_call_screen.dart';
import 'package:get/get.dart';

class IncomingCallRoute extends RouteDefine {
  static const ID = "IncomingCall";

  static push() {
    Get.toNamed(ID);
  }

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => IncomingCallScreen(),
        ),
      ];
}
