import 'dart:async';

import 'package:configuration/data/source/local/sessions_pref.dart';
import 'package:configuration/environment/env.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:configuration/route/route_define.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video_calls/data/country/repositories/country_repository.dart';
import 'package:flutter_video_calls/di/injection/injection.dart';
import 'package:flutter_video_calls/manifest.dart';
import 'package:flutter_video_calls/style/style.dart';
import 'package:flutter_video_calls/views/calls/calling/calling_route.dart';
import 'package:flutter_video_calls/views/home/home_route.dart';
import 'package:flutter_video_calls/views/introduction/introduction_route.dart';
import 'package:get/get.dart';

/// EndPoint default
void main() => Main();

class Main extends Env {
  @override
  FutureOr<void> onCreate() async {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();
    setStyleDefault();
    CountryRepository.getCountriesData();
  }

  @override
  Future? onInjection() async {
    await Injection.inject();
  }

  @override
  Widget onCreateView() {
    ErrorWidget.builder = (FlutterErrorDetails details) {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
      return Container(color: Colors.transparent);
    };
    return Application();
  }
}

class Application extends StatefulWidget {
  @override
  _ApplicationState createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  final route =
      SessionPref.isSessionValid() ? HomeRoute.ID : IntroductionRoute.ID;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: () => GetMaterialApp(
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
      ),
    );
  }
}
