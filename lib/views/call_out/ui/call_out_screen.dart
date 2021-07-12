import 'package:flutter/material.dart';
import 'package:flutter_video_calls/views/common/view/call/local_video_call.dart';

class CallOutScreen extends StatefulWidget {
  const CallOutScreen({Key? key}) : super(key: key);

  @override
  _CallOutScreenState createState() => _CallOutScreenState();
}

class _CallOutScreenState extends State<CallOutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            child: LocalVideoCall(),
            right: 10,
            top: 10,
          )
        ],
      ),
    );
  }
}
