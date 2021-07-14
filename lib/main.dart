import 'dart:async';

import 'package:camera/camera.dart';
import 'package:configuration/data/source/local/sessions_pref.dart';
import 'package:configuration/environment/env.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:configuration/route/route_define.dart';
import 'package:configuration/utility/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' ;
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_video_calls/data/country/repositories/country_repository.dart';
import 'package:flutter_video_calls/di/injection/injection.dart';
import 'package:flutter_video_calls/manifest.dart';
import 'package:flutter_video_calls/views/call_out/call_out_route.dart';
import 'package:flutter_video_calls/views/introduction/introduction_route.dart';
import 'package:get/get.dart';
import 'package:ui/style/style.dart';

/// EndPoint default
void main() => Main();

List<CameraDescription> cameras = [];

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();
    Style.styleDefault();

    // Fetch the available cameras before initializing the app.
    try {
      cameras = await availableCameras();
    } on Exception catch (e) {
      Log.warning("cameras", e.toString());
    }

    CountryRepository.getCountriesData();

    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };

    return Application();
  }

  @override
  Future? onInjection() async {
    await Injection.inject();
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final route =
      SessionPref.isSessionValid() ? CallOutRoute.ID : IntroductionRoute.ID ;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      debugShowCheckedModeBanner: false,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('vi'),
      initialRoute: route,
      onGenerateRoute: (settings) => manifest(generateRoutes, settings),
    );
  }
}
