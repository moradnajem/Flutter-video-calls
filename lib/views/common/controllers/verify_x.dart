import 'dart:io';

import 'package:configuration/data/common/api_exception.dart';
import 'package:configuration/data/common/response_code.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/data/verify/model/get_verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_type.dart';
import 'package:flutter_video_calls/data/verify/repositories/verify_repository.dart';
import 'package:flutter_video_calls/views/dialogs/dialog.dart';
import 'package:flutter_video_calls/views/home/home_route.dart';
import 'package:flutter_video_calls/views/verify_code/verify_code_route.dart';
import 'package:get/get.dart';
import 'package:libphonenumber/libphonenumber.dart';

class VerifyController extends GetxController {
  VerifyRepository verifyRepository;

  VerifyController({required this.verifyRepository});

  RxString phoneNumber = ''.obs;
  RxString normalizedNumber = ''.obs;

  Rx<Country> country = Country(
          name: "Vietnam",
          alpha2Code: "VN",
          alpha3Code: "VNM",
          dialCode: "+84",
          flagUri: 'assets/flags/vn.png')
      .obs;

  phoneNumberIsCorrect() =>
      (phoneNumber.value.length >= 7 && phoneNumber.value.length < 11) ||
      phoneNumber.value.length == 14;

  phoneNumberWithAlpha2Code() async {
    normalizedNumber.value = await PhoneNumberUtil.normalizePhoneNumber(
            phoneNumber: phoneNumber.value,
            isoCode: country.value.alpha2Code) ??
        '';
  }

  verifyCode(int code) async {
    try {
      DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      var deviceId = "";
      var deviceName = "";
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
        deviceName = androidInfo.model;
      }
      if (Platform.isIOS) {
        final iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor;
        deviceName = iosInfo.utsname.machine;
      }

      await verifyRepository.verifyCode(VerifyCodeRequest(
        email: null,
        phoneNumber: phoneNumber.value,
        dialCode: country.value.dialCode,
        alpha2Code: country.value.alpha2Code,
        alpha3Code: country.value.alpha3Code,
        type: VerifyType.PHONE_NUMBER,
        verifyCode: code,
        deviceName: deviceName,
        deviceId: deviceId,
        platform: Platform.operatingSystem,
      ));
      Get.offAndToNamed(HomeRoute.ID);
    } on ApiException catch (e) {
      Get.back();
      if(e.errorCode == ResponseCode.VERIFY_CODE_NOT_CORRECT){
        //TODO show message error
      }else {
        showDialogError(content: e.errorMessage);
      }
    } catch (_) {
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
  }

  void reRequestProvideVerifyCode() async {
    try {
      await verifyRepository.getVerifyCode(GetVerifyCodeRequest(
        null,
        phoneNumber.value,
        country.value.dialCode,
        country.value.alpha2Code,
        country.value.alpha3Code,
        VerifyType.PHONE_NUMBER,
      ));
      Get.snackbar(S.current.request, S.current.requested_new_code,
          snackPosition: SnackPosition.BOTTOM);
    } on ApiException catch (e) {
      Get.back();
      showDialogError(content: e.errorMessage);
    } catch (_) {
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
  }

  void requestProvideVerifyCode() async {
    try {
      showDialogLoading();
      await verifyRepository.getVerifyCode(GetVerifyCodeRequest(
        null,
        phoneNumber.value,
        country.value.dialCode,
        country.value.alpha2Code,
        country.value.alpha3Code,
        VerifyType.PHONE_NUMBER,
      ));
      Get.back();
      Get.toNamed(VerifyCodeRoute.ID);
    } on ApiException catch (e) {
      Get.back();
      showDialogError(content: e.errorMessage);
    } catch (_) {
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
  }
}
