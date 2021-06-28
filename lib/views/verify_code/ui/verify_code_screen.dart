import 'package:configuration/di/di_module.dart';
import 'package:configuration/generated/l10n.dart';
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

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _verifyController = getIt.get<VerifyController>();

  @override
  Widget build(BuildContext context) {
    _verifyController.phoneNumberWithAlpha2Code();
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
                  Obx(
                    () => Text(
                      _verifyController.normalizedNumber.value,
                      style: TextStyle(
                          color: mColorBlack,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: mSpacing,
                  ),
                  _verifyCodeInput(),
                ],
              ),
              TweenAnimationBuilder<Duration>(
                  duration: Duration(seconds: 30),
                  tween:
                      Tween(begin: Duration(seconds: 30), end: Duration.zero),
                  builder:
                      (BuildContext context, Duration value, Widget? child) {
                    final seconds = value.inSeconds % 60;
                    return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.current.have_not_received_verify_code,
                                style: TextStyle(
                                    color: mColorTextSecondary, fontSize: 16)),
                            GestureDetector(
                              onTap: () {
                                if (seconds <= 0) {
                                  _verifyController.requestProvideVerifyCode();
                                }
                              },
                              child: Text(
                                seconds > 0
                                    ? S.current
                                        .request_new_code_in_seconds(seconds)
                                    : S.current.request_new_code,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: seconds > 0
                                        ? mColorTextHint
                                        : mColorPrimaryLight,
                                    decoration: seconds > 0
                                        ? TextDecoration.none
                                        : TextDecoration.underline,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  _verifyCodeInput() => Form(
        // key: formKey,
        child: TextFormField(
          autofocus: false,
          onChanged: (value) async {
            if (value.length == 6) {
              _verifyController.verifyCode(int.parse(value.trim()));

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
