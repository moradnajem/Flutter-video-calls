import 'package:configuration/di/di_module.dart';
import 'package:configuration/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/webrtc/signaling.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class LocalVideoCall extends StatefulWidget {
  const LocalVideoCall({Key? key}) : super(key: key);

  @override
  _LocalVideoCallState createState() => _LocalVideoCallState();
}

class _LocalVideoCallState extends State<LocalVideoCall> {
  final _localRenderer = getIt<RTCVideoRenderer>();
  final _signaling = getIt<Signaling>();

  @override
  void initState() {
    initRenderers();
    super.initState();
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
  void deactivate() {
    super.deactivate();
    _localRenderer.dispose();
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
