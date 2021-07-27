import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/calls/calling/ui/calling_screen.dart';
import 'package:get/get.dart';

class CallingRoute extends RouteDefine {
  static const ID = "Calling";

  static push() {
    Get.toNamed(ID);
  }

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => CallingScreen(),
        ),
      ];
}
