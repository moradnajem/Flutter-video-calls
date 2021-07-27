import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/calls/outgoing_call/ui/outgoing_call_screen.dart';
import 'package:get/get.dart';

class OutgoingCallRoute extends RouteDefine {
  static const ID = "OutgoingCall";

  static push() {
    Get.toNamed(ID);
  }

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => OutgoingCallScreen(),
        ),
      ];
}
