import 'package:configuration/di/di_module.dart';
import 'package:flutter_video_calls/views/sign_in/controllers/sign_in_x.dart';
import 'package:get/get.dart';

class ControllerModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory(
        () => Get.put(SignInController(verifyRepository: getIt.get())));
  }
}
