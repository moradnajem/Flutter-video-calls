import 'package:flutter/material.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class LocalVideoCall extends StatefulWidget {
  const LocalVideoCall({Key? key}) : super(key: key);

  @override
  _LocalVideoCallState createState() => _LocalVideoCallState();
}

class _LocalVideoCallState extends State<LocalVideoCall> {
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();

  @override
  void initState() {
    _localRenderer.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90.0,
      height: 120.0,
      child: RTCVideoView(_localRenderer, mirror: true),
      decoration: BoxDecoration(color: Colors.black54),
    );
  }
}
