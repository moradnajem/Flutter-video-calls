import 'package:camera/camera.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/main.dart';
import 'package:flutter_video_calls/views/sign_in/signin_route.dart';
import 'package:flutter_video_calls/views/sign_up/sign_up_route.dart';
import 'package:get/get.dart';
import 'package:ui/buttons/button_radius.dart';
import 'package:ui/style/style.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen>
    with WidgetsBindingObserver {
  CameraController? controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    // onNewCameraSelected();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // if (state == AppLifecycleState.resumed) {
    //   onNewCameraSelected();
    // } else if (state == AppLifecycleState.paused) {
    //   controller?.dispose();
    // }
  }

  void onNewCameraSelected() async {
    if (controller != null) await controller?.dispose();

    controller = CameraController(
        cameras[cameras.length > 0 ? 1 : 0], ResolutionPreset.max);
    controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    // if (controller == null || controller?.value.isInitialized == false) {
    //   return Container();
    // }

    return Scaffold(
      body: Stack(
        children: [
          // camera
          // CameraPreview(controller!),
          // Scrim
          Opacity(
            opacity: 0.8,
            child: Container(
              color: mColorPrimary,
            ),
          ),
          Positioned(
            top: 100,
            left: 0,
            right: 0,
            child: Center(
              child: Text(
                S.current.app_name,
                style: TextStyle(color: mDarkOrange, fontSize: 24.0),
              ),
            ),
          ),

          Positioned(
            top: 140,
            left: 20,
            right: 20,
            child: Center(
              child: Text(
                S.current.app_description,
                style: TextStyle(color: Colors.white, fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          LinearGradientMask(
            child: CustomPaint(
              painter: CurvePainter(),
              child: Container(
                height: double.infinity,
              ),
            ),
          ),
          // Button
          Positioned(
            bottom: 0,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
            child: Column(
              children: [
                ButtonRadius(
                  height: 55.0,
                  label: S.current.login,
                  background: mColorPrimary,
                  textColor: Colors.white,
                  callback: () {
                    Get.toNamed(SignInRoute.ID);
                  },
                ),
                SizedBox(
                  height: mSpacing,
                ),
                ButtonRadius(
                  height: 55.0,
                  label: S.current.orRegisterNow,
                  callback: () {
                    Get.toNamed(SignUpRoute.ID);
                  },
                ),
                SizedBox(
                  height: mSpacing,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..color = mColorPrimaryLight;
    // create a path
    var path = Path();
    path.moveTo(0.0, size.height);
    path.lineTo(0, size.height * 0.82);
    path.quadraticBezierTo(
        size.width / 2, size.height * 0.64, size.width, size.height * 0.82);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DrawPoligon extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.lineTo(0, size.height * 0.8);
    path.lineTo(0, 0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LinearGradientMask extends StatelessWidget {
  LinearGradientMask({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) {
        return LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: <Color>[
            mColorPrimary,
            mColorPrimaryLight,
          ],
          tileMode: TileMode.mirror,
        ).createShader(bounds);
      },
      child: child,
    );
  }
}
