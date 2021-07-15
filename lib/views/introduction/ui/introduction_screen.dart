import 'package:configuration/di/di_module.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:configuration/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/webrtc/signaling.dart';
import 'package:flutter_video_calls/views/sign_in/signin_route.dart';
import 'package:flutter_video_calls/views/sign_up/signup_route.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
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
  final _localRenderer = getIt<RTCVideoRenderer>();
  final _signaling = getIt<Signaling>();

  @override
  void initState() {
    initRenderers();
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
  }

  initRenderers() async {
    _signaling.onLocalStream = ((_, stream) {
      _localRenderer.srcObject = stream;
    });
    afterBuild(() async {
      await _localRenderer.initialize();
      await _signaling.connect();
      _localRenderer.srcObject = _signaling.localStream;
      setState(() {});
    });
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _signaling.localStream?.getVideoTracks().first.enabled = true;
    } else if (state == AppLifecycleState.paused) {
      _signaling.localStream?.getVideoTracks().first.enabled = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: OrientationBuilder(
              builder: (context, orientation) {
                return Center(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: RTCVideoView(
                      _localRenderer,
                      objectFit:
                          RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
                      mirror: true,
                    ),
                    decoration: BoxDecoration(color: Colors.black54),
                  ),
                );
              },
            ),
          ),
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
                  label: S.current.or_register_now,
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
  void deactivate() {
    WidgetsBinding.instance?.removeObserver(this);
    _localRenderer.dispose();
    super.deactivate();
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = mColorPrimaryLight;
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
