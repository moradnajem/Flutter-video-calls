import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video_calls/views/common/view/call/local_video_call.dart';
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
        width: double.infinity,
        child: Expanded(
          child: Stack(
            children: [
              Container(
                child: Icon(Icons.arrow_back_ios, color: Colors.black),
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              ),
              Positioned.fill(child: Image.asset("assets/images/test_call.jpg", fit: BoxFit.fitHeight,)),
              Positioned(
                child: LocalVideoCall(),
                right: 10,
                top: 50,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: double.infinity,
                  child: CustomPaint(
                    painter: CurvePainter(),
                    size: Size(Get.width, 150),
                  ),
                ),
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.pinkAccent,
                        blurRadius: 100,
                        spreadRadius: 0,
                        offset: Offset(0, 0), // Shadow position
                      ),
                    ],
                  ),
                  margin: EdgeInsets.only(bottom: 150*0.16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        padding: EdgeInsets.all(20),
                        child: Icon(
                          Icons.call,
                          size: 30,
                        )),
                  ),
                ),
              ),

              Positioned(
                bottom: 20,
                left: 30,
                child: Row(
                  children: [
                    Icon(Icons.arrow_circle_up, color: Colors.white,size: 25,),
                    SizedBox(width: 20,),
                    Icon(Icons.wallet_giftcard, color: Colors.white,size: 25,)
                  ],
                ),
              ),

              Positioned(
                bottom: 20,
                right: 30,
                child: Row(
                  children: [
                    Icon(Icons.chat, color: Colors.white,size: 25,),
                    SizedBox(width: 20,),
                    Icon(Icons.more_vert, color: Colors.white,size: 25,)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..color = mCallBackground
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path = Path();
    path.moveTo(0, size.height);
    path.lineTo(0, 0);

    path.quadraticBezierTo(0,size.height*0.5,size.width*0.12,size.height*0.5);

    path.cubicTo(size.width*0.16,size.height*0.5,size.width*0.2,size.height*0.5,size.width*0.25,size.height*0.5);
    path.cubicTo(size.width*0.3,size.height*0.5,size.width*0.35,size.height*0.5,size.width*0.37,size.height*0.66);
    path.cubicTo(size.width*0.4,size.height,size.width*0.6,size.height,size.width*0.632,size.height*0.66);
    path.cubicTo(size.width*0.65,size.height*0.5,size.width*0.71,size.height*0.5,size.width*0.75,size.height*0.5);

    path.cubicTo(size.width*0.79,size.height*0.5,size.width*0.88,size.height*0.5,size.width*0.88,size.height*0.5);
    path.quadraticBezierTo(size.width,size.height*0.5,size.width,0);

    path.lineTo(size.width,size.height);
    path.lineTo(0, size.height);
    path.lineTo(0, 20);

    Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.3)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, 50);

    canvas.drawPath(path, shadowPaint);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
