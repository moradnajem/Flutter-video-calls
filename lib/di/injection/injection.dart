import 'package:flutter_video_calls/di/module/components_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
  }
}
