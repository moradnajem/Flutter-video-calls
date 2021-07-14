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
      body: Column(
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
                Positioned(
                  child: LocalVideoCall(),
                  right: 10,
                  top: 10,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
