import 'package:configuration/di/di_module.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/views/common/view/coutries/widget/countries_search_list.dart';
import 'package:flutter_video_calls/views/common/view/coutries/widget/country_flag.dart';
import 'package:flutter_video_calls/views/sign_up/controller/signup_x.dart';
import 'package:get/get.dart';
import 'package:ui/buttons/button_radius.dart';
import 'package:ui/style/style.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _signUpController = SignUpController(authRepository: getIt.get());

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
                    style: TextStyle(
                        color: mColorBlack,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: mSpacing,
                  ),
                  Text(
                    S.current.reason_provide_phone_number,
                    style: TextStyle(
                      color: mColorTextSecondary,
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(
                    height: 40,
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

  _phoneNumberInput() => Container(
        height: 56,
        child: Row(
          children: [
            GestureDetector(
              onTap: () async {
                final country = await showCountrySelectorDialog();
                if (country != null) _signUpController.country.value = country;
              },
              child: Container(
                height: 56,
                margin: EdgeInsets.only(right: 8.0),
                padding: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0)),
                child: ObxValue<Rx<Country>>(
                  (country) => CountryFlag(country.value),
                  _signUpController.country,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 56,
                padding: EdgeInsets.only(right: 8.0, left: 8.0),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(4.0)),
                child: TextFormField(
                  autofocus: false,
                  onChanged: (value) {
                    _signUpController.rawPhoneNumber.value = value;
                  },
                  validator: (value) {
                    if (value?.isEmpty == true) {
                      return S.current.phone_number_is_not_empty;
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
                      hintText: S.current.phone_number_hint,
                      hintStyle: TextStyle(
                          color: mColorTextHint,
                          fontWeight: FontWeight.bold,
                          fontSize: 34)),
                  keyboardType: TextInputType.number,
                ),
              ),
            )
          ],
        ),
      );

  _continueVerifyCode() => Container(
        margin: EdgeInsets.symmetric(vertical: 18.0),
        child: Obx(
          () => ButtonRadius(
            height: 55.0,
            label: S.current.next,
            background: mColorPrimary,
            textColor: Colors.white,
            enable: _signUpController.phoneNumberIsCorrect,
            callback: () {
              _signUpController.signUp();
            },
          ),
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