import 'package:configuration/di/di_module.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/style/style.dart';
import 'package:flutter_video_calls/views/common/buttons/button_radius.dart';
import 'package:flutter_video_calls/views/common/coutries/widget/countries_search_list.dart';
import 'package:flutter_video_calls/views/common/coutries/widget/country_flag.dart';
import 'package:flutter_video_calls/views/sign_in/controller/signin_x.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _signInController = SignInController(authRepository: getIt.get());

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
          padding: EdgeInsets.symmetric(horizontal: mSpacing),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: mSpacing,
                  ),
                  Text(
                    S.current.what_is_phone_number,
                    style: mTitleStyle.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: mSizeH4,
                    ),
                  ),
                  SizedBox(
                    height: mSpacing,
                  ),
                  Text(
                    S.current.provide_phone_number_registered_before,
                    style: mHintStyle,
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  _phoneNumberInput(),
                ],
              ),
              _continueVerifyCode()
            ],
          ),
        ),
      ),
    );
  }

  final phoneNumberInputSize = 56.h;

  _phoneNumberInput() => Container(
        height: phoneNumberInputSize,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                final country = await showCountrySelectorDialog();
                if (country != null) _signInController.country.value = country;
              },
              child: Container(
                height: phoneNumberInputSize,
                margin: EdgeInsets.only(right: 8.w),
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0)),
                child: ObxValue<Rx<Country>>(
                  (country) => CountryFlag(country.value),
                  _signInController.country,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: phoneNumberInputSize,
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5.0)),
                child: TextFormField(
                  autofocus: false,
                  onChanged: (value) {
                    _signInController.rawPhoneNumber.value = value;
                    _signInController.checkPhoneNumberIsCorrect();
                  },
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return S.current.phone_number_is_not_empty;
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
                    hintText: S.current.phone_number_hint,
                    hintStyle: mHintStyle.copyWith(
                      fontSize: mSizeH3,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  keyboardType: TextInputType.number,
                ),
              ),
            )
          ],
        ),
      );

  _continueVerifyCode() => Container(
        margin: EdgeInsets.symmetric(vertical: 18.h),
        child: ObxValue<RxBool>(
          (phoneNumberIsCorrect) => ButtonRadius(
            label: S.current.next,
            background: mColorPrimary,
            textColor: Colors.white,
            enable: phoneNumberIsCorrect.value,
            callback: () {
              _signInController.sendVerifyCode();
            },
          ),
          _signInController.phoneNumberIsCorrect,
        ),
      );

  Future<Country?> showCountrySelectorDialog() => Get.dialog(
        AlertDialog(
          content: Container(
            width: double.maxFinite,
            child: CountrySearchList(),
          ),
        ),
        barrierDismissible: false,
      );
}
