import 'dart:io';

import 'package:configuration/data/common/response_code.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_video_calls/data/account/repositories/account_repository.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/data/account/model/role.dart';
import 'package:flutter_video_calls/data/verify/model/get_verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_code_request.dart';
import 'package:flutter_video_calls/data/verify/model/verify_type.dart';
import 'package:flutter_video_calls/data/verify/repositories/verify_repository.dart';
import 'package:flutter_video_calls/views/dialogs/dialog.dart';
import 'package:flutter_video_calls/views/home/home_route.dart';
import 'package:flutter_video_calls/views/verify_code/verify_code_route.dart';
import 'package:get/get.dart';
import 'package:libphonenumber/libphonenumber.dart';
import 'package:configuration/data/exceptions/data_local_exception.dart';

class VerifyController extends GetxController {
  VerifyRepository verifyRepository;
  AccountRepository accountRepository;

  VerifyController(
      {required this.verifyRepository, required this.accountRepository});

  bool isRequesting = false;
  static const int MAX_INCORRECT_COUNT = 3;
  static const int EXPIRE_COUNT_DOWN = 30;

  RxString rawPhoneNumber = ''.obs;
  RxString normalizedNumber = ''.obs;
  RxInt codeExpireCountDown = EXPIRE_COUNT_DOWN.obs;
  RxInt verifyIncorrectCount = MAX_INCORRECT_COUNT.obs;

  Rx<Country> country = Country(
          name: "Vietnam",
          alpha2Code: "VN",
          alpha3Code: "VNM",
          dialCode: "+84",
          flagUri: 'assets/flags/vn.png')
      .obs;

  phoneNumberIsCorrect() =>
      (rawPhoneNumber.value.length >= 7 && rawPhoneNumber.value.length < 11) ||
      rawPhoneNumber.value.length == 14;

  phoneNumberWithAlpha2Code() async {
    normalizedNumber.value = await PhoneNumberUtil.normalizePhoneNumber(
            phoneNumber: rawPhoneNumber.value,
            isoCode: country.value.alpha2Code) ??
        '';
  }

  verifyCode(int code) async {
    if (isRequesting) return;
    try {
      isRequesting = true;
      showDialogLoading();

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

      final response = await verifyRepository.verifyCode(VerifyCodeRequest(
          email: null,
          phoneNumber: rawPhoneNumber.value,
          dialCode: country.value.dialCode,
          alpha2Code: country.value.alpha2Code,
          alpha3Code: country.value.alpha3Code,
          type: VerifyType.PHONE_NUMBER,
          verifyCode: code,
          deviceName: deviceName,
          deviceId: deviceId,
          platform: Platform.operatingSystem,
          role: Role.CUSTOMER));

      Get.back();
      if (response?.account == null) {
        _reset();
        Get.back();
        showDialogError(content: S.current.unknown_error);
      } else {
        await accountRepository.saveAccount(response!.account!);
        _reset();
        Get.offAllNamed(HomeRoute.ID);
      }
    } on ApiException catch (e) {
      Get.back();
      await showDialogError(content: e.errorMessage);

      if (e.errorCode == ResponseCode.VERIFY_CODE_INCORRECT) {
        verifyIncorrectCount.value = e.errorBody ?? 0;
      }
      if (e.errorCode == ResponseCode.VERIFY_CODE_EXPIRE ||
          e.errorCode == ResponseCode.WRONG_TOO_MANY_TIME) {
        verifyIncorrectCount.value = 0;
        Get.back();
      }
    } on DataLocalException catch (e) {
      Get.back();
      showDialogError(content: e.errorMessage);
    } catch (e) {
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
    isRequesting = false;
  }

  void reRequestProvideVerifyCode() async {
    try {
      await verifyRepository.getVerifyCode(GetVerifyCodeRequest(
        null,
        rawPhoneNumber.value,
        country.value.dialCode,
        country.value.alpha2Code,
        country.value.alpha3Code,
        VerifyType.PHONE_NUMBER,
      ));
      _reset();
      Get.snackbar(S.current.request, S.current.requested_new_code,
          snackPosition: SnackPosition.TOP);
    } on ApiException catch (e) {
      showDialogError(content: e.errorMessage);
    } catch (e) {
      printError(info: e.toString());
      showDialogError(content: S.current.unknown_error);
    }
  }

  void requestProvideVerifyCode() async {
    try {
      showDialogLoading();
      await verifyRepository.getVerifyCode(GetVerifyCodeRequest(
        null,
        rawPhoneNumber.value,
        country.value.dialCode,
        country.value.alpha2Code,
        country.value.alpha3Code,
        VerifyType.PHONE_NUMBER,
      ));
      Get.back();
      _reset();
      Get.toNamed(VerifyCodeRoute.ID);
    } on ApiException catch (e) {
      Get.back();
      showDialogError(content: e.errorMessage);
    } catch (e) {
      printError(info: e.toString());
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
  }

  _reset() {
    verifyIncorrectCount.value = MAX_INCORRECT_COUNT;
    codeExpireCountDown.value = EXPIRE_COUNT_DOWN;
  }
}
