import 'dart:math';

import 'package:configuration/di/di_module.dart';
import 'package:configuration/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/webrtc/signaling.dart';
import 'package:flutter_video_calls/style/style.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocalVideoCall extends StatefulWidget {
  const LocalVideoCall({Key? key}) : super(key: key);

  @override
  _LocalVideoCallState createState() => _LocalVideoCallState();
}

class _LocalVideoCallState extends State<LocalVideoCall> {
  // final _localRenderer = getIt<RTCVideoRenderer>();
  // final _signaling = getIt<Signaling>();

  @override
  void initState() {
    // initRenderers();
    super.initState();
  }

  // initRenderers() async {
  //   _signaling.onLocalStream = ((_, stream) {
  //     _localRenderer.srcObject = stream;
  //   });
  //   afterBuild(() async {
  //     await _localRenderer.initialize();
  //     await _signaling.connect();
  //     _localRenderer.srcObject = _signaling.localStream;
  //     setState(() {});
  //   });
  // }

  @override
  void deactivate() {
    super.deactivate();
    // _localRenderer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 83.w,
      height: 147.7.h,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 0), // Shadow position
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                "assets/images/test_call_2.jpg",
                fit: BoxFit.fitHeight,
              ),
              // child: RTCVideoView(_localRenderer,
              //     objectFit: RTCVideoViewObjectFit.RTCVideoViewObjectFitCover,
              //     mirror: true),
            ),
          ),
          Positioned(
              top: 4.h,
              right: 4.w,
              child: Transform.rotate(
                angle: 180 * pi / 100,
                child: Icon(
                  Icons.arrow_forward_outlined,
                  size: 18,
                  color: mActionColor,
                ),
              ))
        ],
      ),
    );
  }
}
