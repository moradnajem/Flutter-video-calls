import 'dart:io';

import 'package:configuration/data/common/pref_key.dart';
import 'package:configuration/data/common/shared_preferences_manager.dart';
import 'package:configuration/di/di_module.dart';

class IntroductionPref {
  static void saveIntroState({bool canShow = false}) {
    var preferencesManager = getIt.get<SharedPreferencesManager>();
    preferencesManager.putBool(keyIntroPageHasShown, canShow);
  }

  static bool canShowIntro() =>
      getIt.get<SharedPreferencesManager>().getBool(keyIntroPageHasShown) ??
      true;

  static Future<void> clearUserData() async {
    await getIt.get<SharedPreferencesManager>().clear();
  }
}
