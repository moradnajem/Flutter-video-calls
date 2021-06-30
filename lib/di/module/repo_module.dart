import 'package:configuration/di/di_module.dart';
import 'package:flutter_video_calls/data/account/repositories/account_repository.dart';
import 'package:flutter_video_calls/data/verify/repositories/verify_repository.dart';

class RepoModule extends DIModule {
  @override
  provides() async {
    getIt.registerFactory(
      () => AccountRepository(api: getIt.get(), database: getIt.get()),
    );
    getIt.registerFactory(() => VerifyRepository(api: getIt.get()));
  }
}
