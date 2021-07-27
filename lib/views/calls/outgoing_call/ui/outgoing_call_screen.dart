import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video_calls/style/style.dart';
import 'package:flutter_video_calls/views/common/buttons/button_circle.dart';
import 'package:flutter_video_calls/views/common/call/local_video_call.dart';
import 'package:flutter_video_calls/views/common/text/shadow_text.dart';
import 'package:get/get.dart';

class OutgoingCallScreen extends StatefulWidget {
  const OutgoingCallScreen({Key? key}) : super(key: key);

  @override
  _OutgoingCallScreenState createState() => _OutgoingCallScreenState();
}

class _OutgoingCallScreenState extends State<OutgoingCallScreen> {
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
              // Remote video
              Positioned.fill(
                  child: Image.asset(
                "assets/images/test_call.jpg",
                fit: BoxFit.fitHeight,
              )),
              // Local video
              Positioned(
                child: LocalVideoCall(),
                right: mSpacing,
                top: mSpacing,
              ),
              // Name and timer
              Positioned(
                left: 20.w,
                bottom: 90.h,
                child: _layoutUserNameAndTimer(),
              ),

              Positioned(
                right: 20.w,
                bottom: 90.h,
                child: _voiceAndVideoControl(),
              ),
              // action call
              Positioned(
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  width: double.infinity,
                  child: CustomPaint(
                    painter: CurvePainter(),
                    size: Size(Get.width, 150.h),
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
                  margin: EdgeInsets.only(bottom: 150.h * 0.16),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Container(
                        padding: EdgeInsets.all(20.w),
                        child: Icon(
                          Icons.video_call,
                          color: Colors.white,
                          size: 36.w,
                        )),
                  ),
                ),
              ),
              Positioned(
                bottom: 150.h * 0.05,
                left: 12.w,
                child: Row(
                  children: [
                    ButtonCircle(
                      color: mBackgroundActionCall,
                      icon: Icon(
                        Icons.settings_suggest,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    ButtonCircle(
                      color: mBackgroundActionCall,
                      icon: Icon(
                        Icons.wallet_giftcard,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 150.h * 0.05,
                right: 12.w,
                child: Row(
                  children: [
                    ButtonCircle(
                      color: mBackgroundActionCall,
                      icon: Icon(
                        Icons.chat,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    ButtonCircle(
                      color: mBackgroundActionCall,
                      icon: Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 24.w,
                      ),
                    ),
                  ],
                ),
              ),
              // Action back
              Container(
                padding: EdgeInsets.only(
                  top: 10.h,
                  bottom: 10.h,
                  left: 14.w,
                  right: 6.w,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0.w),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.w,
                  ),
                ),
                child: Icon(Icons.arrow_back_ios, color: mActionColor),
                margin: EdgeInsets.all(mSpacing),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _layoutUserNameAndTimer() => Container(
        width: Get.size.width * 0.6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShadowText(
              "Người gọi",
              style: mPrimaryTextStyle.copyWith(color: Colors.white),
            ),
            ShadowText(
              "Jennifer Aniston sdsa dasds adsadsad",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: mTitleStyle.copyWith(
                  color: Colors.white,
                  fontSize: mSizeH4,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: mSpacing,
            ),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: Container(
                  width: 98.w,
                  height: 40.h,
                  decoration: BoxDecoration(
                    color: mCallBackground.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(50),
                    shape: BoxShape.rectangle,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 14.w,
                        height: 14.h,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      SizedBox(
                        width: 12.w,
                      ),
                      Text(
                        "22:15",
                        style: mPrimaryTextStyle.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      );

  _voiceAndVideoControl() => Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
              child: ButtonCircle(
                color: Colors.grey.withOpacity(0.5),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 24.w,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
          ButtonCircle(
            color: Colors.white,
            icon: Icon(
              Icons.videocam_off_outlined,
              color: mActionColor,
              size: 24.w,
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
          ButtonCircle(
            color: Colors.white,
            icon: Icon(
              Icons.keyboard_voice,
              color: mActionColor,
              size: 24.w,
            ),
          ),
        ],
      );
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

    path.quadraticBezierTo(
        0, size.height * 0.51, size.width * 0.12, size.height * 0.51);

    path.cubicTo(size.width * 0.16, size.height * 0.51, size.width * 0.2,
        size.height * 0.51, size.width * 0.25, size.height * 0.51);
    path.cubicTo(size.width * 0.3, size.height * 0.51, size.width * 0.35,
        size.height * 0.51, size.width * 0.36, size.height * 0.66);

    path.cubicTo(size.width * 0.4, size.height, size.width * 0.6, size.height,
        size.width * 0.64, size.height * 0.66);
    path.cubicTo(size.width * 0.654, size.height * 0.51, size.width * 0.70,
        size.height * 0.51, size.width * 0.73, size.height * 0.51);

    path.cubicTo(size.width * 0.79, size.height * 0.51, size.width * 0.88,
        size.height * 0.51, size.width * 0.88, size.height * 0.51);
    path.quadraticBezierTo(size.width, size.height * 0.51, size.width, 0);

    path.lineTo(size.width, size.height);
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
