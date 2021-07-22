import 'dart:async';
import 'dart:io';

import 'package:configuration/environment/build_config.dart';
import 'package:configuration/network/http_overrides.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class Env {
  Env() {
    _init();
  }

  _init() {
    runZonedGuarded(
      () async {
        final StatefulWidget app = FutureBuilder(
          future: await _onCreate(),
          builder: (context, snapshot) {
            return onCreateView();
          },
        );
        runApp(app);
      },
      (error, stack) {
        print(error);
        print(stack);
      },
    );
  }

  Future? onInjection();

  FutureOr<void> onCreate();

  Widget onCreateView();

  _onCreate() async {
    WidgetsFlutterBinding.ensureInitialized();
    await const MethodChannel('flavor').invokeMethod<String>('getFlavor').then(
      (String? flavor) async {
        BuildConfig.init(flavor: flavor);
      },
    ).catchError((error) {});

    await onInjection();
    HttpOverrides.global = MyHttpOverrides();
    await onCreate();
  }
}
