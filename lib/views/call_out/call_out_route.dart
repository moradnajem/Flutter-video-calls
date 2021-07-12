import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/call_out/ui/call_out_screen.dart';

class CallOutRoute extends RouteDefine {
  static const ID = "CallOut";

  @override
  List<Path> initRoute(Object? arguments) => [
        Path(
          name: ID,
          builder: (_) => CallOutScreen(),
        ),
      ];
}
