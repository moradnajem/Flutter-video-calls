import 'package:configuration/di/di_module.dart';
import 'package:flutter_video_calls/data/verify/repositories/verify_repository.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory(() => VerifyRepository(api: getIt.get()));
  }
}
