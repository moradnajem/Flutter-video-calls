import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/source/local/introduction_pref.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    IntroductionPref.saveIntroState(canShow: false);
    return Container(
      child: Center(
        child: Text("Introduction", style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
