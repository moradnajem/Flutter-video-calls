import 'package:configuration/di/di_module.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:configuration/utility/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_type.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/style/style.dart';
import 'package:flutter_video_calls/views/verify_code/controller/verify_x.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerifyCodeScreen extends StatefulWidget {
  final Country? country;
  final String? phoneNumber;
  final SendVerifyType? sendVerifyType;

  VerifyCodeScreen({
    required this.sendVerifyType,
    required this.country,
    required this.phoneNumber,
    Key? key,
  }) : super(key: key);

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen>
    with TickerProviderStateMixin {
  final _verifyController = VerifyController(
    authRepository: getIt.get(),
    accountRepository: getIt.get(),
  );

  final TextEditingController _textFormController = TextEditingController();
  late Animation<Duration> _animation;
  AnimationController? _controller;

  @override
  void initState() {
    _verifyController.rawPhoneNumber.value = widget.phoneNumber ?? "";
    _verifyController.country = widget.country!;
    _verifyController.sendVerifyType = widget.sendVerifyType!;

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
    afterBuild(() {
      _verifyController.phoneNumberWithAlpha2Code();
      _verifyController.codeExpireCountDown.value = 30;
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
                    style: mTitleStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: mSizeH5,
                    ),
                  ),
                  ObxValue<RxString>(
                      (normalizedNumber) => Text(
                            normalizedNumber.value,
                            style: mTitleStyle.copyWith(
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontSize: mSizeH5,
                            ),
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
                      style: mPrimaryTextStyle.copyWith(color: Colors.red),
                    ),
                    _verifyController.verifyIncorrectCount,
                  )
                ],
              ),
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: ObxValue<RxInt>(
                      (codeExpireCountDown) => Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                S.current.have_not_received_verify_code,
                                style: mPrimaryTextStyle,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (codeExpireCountDown.value <= 0) {
                                    _verifyController.reSendVerifyCode();
                                  }
                                },
                                child: Text(
                                    codeExpireCountDown.value > 0
                                        ? S.current.request_new_code_in_seconds(
                                            codeExpireCountDown.value)
                                        : S.current.request_new_code,
                                    textAlign: TextAlign.center,
                                    style: mActionTextStyle.copyWith(
                                      fontSize: mSizeH5,
                                      color: codeExpireCountDown.value > 0
                                          ? mColorTextHint
                                          : mColorPrimaryLight,
                                      decoration: codeExpireCountDown.value > 0
                                          ? TextDecoration.none
                                          : TextDecoration.underline,
                                    )),
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
              await _verifyController.verification(int.parse(value.trim()));
            }
          },
          cursorColor: mColorTextHint,
          style: mTextFieldStyle.copyWith(
            fontSize: mSizeH3,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(8.w),
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: '000000',
            counterText: "",
            hintStyle: mHintStyle.copyWith(
              fontSize: mSizeH3,
              fontWeight: FontWeight.bold,
            ),
          ),
          maxLength: 6,
          keyboardType: TextInputType.number,
          enableSuggestions: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          autocorrect: false,
        ),
      );
}
