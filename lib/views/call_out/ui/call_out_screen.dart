import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ui/style/style.dart';

class CallOutScreen extends StatefulWidget {
  const CallOutScreen({Key? key}) : super(key: key);

  @override
  _CallOutScreenState createState() => _CallOutScreenState();
}

class _CallOutScreenState extends State<CallOutScreen> {
  @override
  void initState() {
    // Start full screen
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Icon(Icons.arrow_back_ios, color: Colors.black),
              margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: Stack(
                children: [
                  // Positioned(
                  //   child: LocalVideoCall(),
                  //   right: 10,
                  //   top: 10,
                  // )

                  Positioned(
                    bottom: 0,
                    child: CustomPaint(
                      painter: CurvePainter(),
                      size: Size(Get.width, 150),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      // ..isAntiAlias = true
      ..color = mCallBackground;

    Path path = Path();
    path.moveTo(0,size.height*0.1);
    path.quadraticBezierTo(0,size.height/2,size.width*0.2,size.height/2);

    path.cubicTo(size.width*0.2,size.height/2,size.width*0.2,size.height/2,size.width*0.2,size.height/2);

    path.cubicTo(size.width*0.2,size.height/2,size.width*0.34,size.height/2,size.width*0.36,size.height*0.7);
    path.cubicTo(size.width*0.4,size.height, size.width*0.60,size.height,size.width*0.64,size.height*0.7);

    path.cubicTo(size.width*0.66,size.height/2,size.width*0.8,size.height/2,size.width*0.8,size.height/2);

    path.quadraticBezierTo(size.width,size.height/2,size.width,size.height*0.1);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
