import 'package:configuration/data/common/shared_preferences_manager.dart';
import 'package:configuration/di/di_module.dart';
import 'package:flutter_video_calls/data/webrtc/signaling.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class ComponentsModule extends DIModule {
  @override
  provides() async {
    getIt.registerSingleton(SharedPreferencesManager());
    getIt.registerSingleton(RTCVideoRenderer());
    getIt.registerSingleton(Signaling());
  }
}
