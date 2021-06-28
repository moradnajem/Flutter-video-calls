import 'package:configuration/data/common/api_exception.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/data/verify/model/get_verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_type.dart';
import 'package:flutter_video_calls/data/verify/repositories/verify_repository.dart';
import 'package:flutter_video_calls/views/dialogs/dialog.dart';
import 'package:flutter_video_calls/views/verify_pin/verify_pin_route.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  VerifyRepository verifyRepository;

  SignInController({required this.verifyRepository});

  RxString phoneNumber = ''.obs;
  Rx<Country?> country = Country(
          name: "Vietnam",
          alpha2Code: "VN",
          alpha3Code: "VNM",
          dialCode: "+84",
          flagUri: 'assets/flags/vn.png')
      .obs;

  phoneNumberIsCorrect() =>
      (phoneNumber.value.length >= 7 && phoneNumber.value.length < 11) ||
      phoneNumber.value.length == 14;

  void requestProvideVerifyCode() async {
    try {
      showDialogLoading();
      await verifyRepository.getVerifyCode(GetVerifyCodeRequest(
        null,
        phoneNumber.value,
        country.value?.dialCode,
        country.value?.alpha2Code,
        country.value?.alpha3Code,
        VerifyType.PHONE_NUMBER,
      ));
      Get.back();
      Get.toNamed(VerifyPinRoute.ID);
    } on ApiException catch (e) {
      Get.back();
      showDialogError(content: e.errorMessage);
    } catch (_) {
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
  }
}
