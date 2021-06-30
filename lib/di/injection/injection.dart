import 'package:flutter_video_calls/di/module/api_module.dart';
import 'package:flutter_video_calls/di/module/components_module.dart';
import 'package:flutter_video_calls/di/module/controller_module.dart';
import 'package:flutter_video_calls/di/module/database_module.dart';
import 'package:flutter_video_calls/di/module/repo_module.dart';

class Injection {
  static Future inject() async {
    await ComponentsModule().provides();
    await DatabaseModule().provides();
    await ApiModule().provides();
    await RepoModule().provides();
    await ControllerModule().provides();
  }
}
