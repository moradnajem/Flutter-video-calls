import 'dart:async';

import 'package:camera/camera.dart';
import 'package:configuration/environment/env.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:configuration/route/route_define.dart';
import 'package:configuration/utility/logging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/source/local/introduction_pref.dart';
import 'package:flutter_video_calls/di/injection/injection.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_video_calls/manifest.dart';
import 'package:flutter_video_calls/views/introduction/introduction_route.dart';
import 'package:flutter_video_calls/views/sign_in/signin_route.dart';
import 'package:ui/style/style.dart';

/// EndPoint default
void main() => Main();

List<CameraDescription> cameras = [];

class Main extends Env {
  @override
  FutureOr<StatefulWidget> onCreate() async{
    Style.styleDefault();

    // Fetch the available cameras before initializing the app.
    try {
      WidgetsFlutterBinding.ensureInitialized();
      cameras = await availableCameras();
    } on CameraException catch (e) {
      Log.info(e.code, e.description);
    }

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

  final route = IntroductionPref.canShowIntro() ?  IntroductionRoute.ID : SignInRoute.ID;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Call',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        S.delegate,
      ],
      locale: const Locale('vi'),
      supportedLocales: S.delegate.supportedLocales,
      initialRoute: SignInRoute.ID,
      onGenerateRoute: (settings) => manifest(generateRoutes, settings),
    );
  }
}