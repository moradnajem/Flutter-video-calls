import 'package:configuration/di/di_module.dart';
import 'package:flutter_video_calls/views/common/controllers/verify_x.dart';
import 'package:get/get.dart';

class ControllerModule extends DIModule {
  @override
  provides() async {
    getIt.registerLazySingleton(() => Get.put(
          VerifyController(
            verifyRepository: getIt.get(),
            accountRepository: getIt.get(),
          ),
        ));
  }
}
