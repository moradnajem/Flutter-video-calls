import 'package:configuration/di/di_module.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:configuration/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video_calls/views/common/controllers/verify_x.dart';
import 'package:get/get.dart';
import 'package:ui/style/style.dart';

class VerifyCodeScreen extends StatefulWidget {
  const VerifyCodeScreen({Key? key}) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen>
    with TickerProviderStateMixin {
  final _verifyController = getIt.get<VerifyController>();
  TextEditingController _textFormController = TextEditingController();
  late Animation<Duration> _animation;
  AnimationController? _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration:
            Duration(seconds: _verifyController.codeExpireCountDown.value),
        vsync: this);
    _animation = Tween(
            begin:
                Duration(seconds: _verifyController.codeExpireCountDown.value),
            end: Duration.zero)
        .animate(_controller!)
          ..addListener(() {
            _verifyController.codeExpireCountDown.value =
                _animation.value.inSeconds % 60;
          });
    _verifyController.codeExpireCountDown.stream.listen((value) {
      if (value == 30) {
        _controller?.forward(from: 0.0);
      }
    });
    _verifyController.verifyIncorrectCount.stream.listen((value) {
      _textFormController.clear();
    });
    _controller?.forward();
    Utils.afterBuild(() {
      _verifyController.phoneNumberWithAlpha2Code();
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller?.dispose();
    _controller = null;
    super.dispose();
  }

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
      body: SafeArea(
        child: Container(
          color: Colors.white,
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: mSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: mSpacing,
                  ),
                  Text(
                    S.current.enter_verify_code,
                    style: TextStyle(color: mColorBlack, fontSize: 16),
                  ),
                  ObxValue<RxString>(
                      (normalizedNumber) => Text(
                            normalizedNumber.value,
                            style: TextStyle(
                                color: mColorBlack,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                      _verifyController.normalizedNumber),
                  SizedBox(
                    height: mSpacing,
                  ),
                  _verifyCodeInput(),
                  ObxValue<RxInt>(
                    (verifyIncorrectCount) => Text(
                      verifyIncorrectCount >= 3
                          ? ""
                          : S.current.enters_code_incorrect(
                              verifyIncorrectCount.value),
                      style: TextStyle(color: Colors.red, fontSize: 14),
                    ),
                    _verifyController.verifyIncorrectCount,
                  )
                ],
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ObxValue<RxInt>(
                      (codeExpireCountDown) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(S.current.have_not_received_verify_code,
                                  style: TextStyle(
                                      color: mColorTextSecondary,
                                      fontSize: 16)),
                              GestureDetector(
                                onTap: () {
                                  if (codeExpireCountDown.value <= 0) {
                                    _verifyController
                                        .reRequestProvideVerifyCode();
                                  }
                                },
                                child: Text(
                                  codeExpireCountDown.value > 0
                                      ? S.current.request_new_code_in_seconds(
                                          codeExpireCountDown.value)
                                      : S.current.request_new_code,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: codeExpireCountDown.value > 0
                                          ? mColorTextHint
                                          : mColorPrimaryLight,
                                      decoration: codeExpireCountDown.value > 0
                                          ? TextDecoration.none
                                          : TextDecoration.underline,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                      _verifyController.codeExpireCountDown)),
            ],
          ),
        ),
      ),
    );
  }

  _verifyCodeInput() => Form(
        // key: formKey,
        child: TextFormField(
          controller: _textFormController,
          autofocus: false,
          onChanged: (value) async {
            if (value.length >= 6) {
              await _verifyController.verifyCode(int.parse(value.trim()));
            }
          },
          cursorColor: mColorTextHint,
          style: TextStyle(
              color: mColorTextSecondary,
              fontWeight: FontWeight.bold,
              fontSize: 34),
          decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8.0),
              fillColor: Colors.white,
              border: InputBorder.none,
              hintText: '000000',
              counterText: "",
              hintStyle: TextStyle(
                  color: mColorTextHint,
                  fontWeight: FontWeight.bold,
                  fontSize: 34)),
          maxLength: 6,
          keyboardType: TextInputType.number,
          enableSuggestions: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          autocorrect: false,
        ),
      );
}
