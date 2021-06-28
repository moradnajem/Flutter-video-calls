import 'package:configuration/route/route_define.dart';
import 'package:flutter_video_calls/views/home/ui/home_screen.dart';

class HomeRoute extends RouteDefine {
  static const ID = "Home";

  @override
  List<Path> initRoute(Object? arguments) => [
    Path(
      name: ID,
      builder: (_) => HomeScreen(),
    ),
  ];
}
