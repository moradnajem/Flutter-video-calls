import 'dart:io';

import 'package:configuration/data/common/response_code.dart';
import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:configuration/data/exceptions/data_local_exception.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter_video_calls/data/account/model/role.dart';
import 'package:flutter_video_calls/data/account/repositories/account_repository.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_code_request.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_type.dart';
import 'package:flutter_video_calls/data/auth/model/verify_code_request.dart';
import 'package:flutter_video_calls/data/auth/model/verify_type_code.dart';
import 'package:flutter_video_calls/data/auth/repositories/auth_repository.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/views/call_out/call_out_route.dart';
import 'package:flutter_video_calls/views/dialogs/dialog.dart';
import 'package:get/get.dart';

class VerifyController extends GetxController {
  final AuthRepository authRepository;
  final AccountRepository accountRepository;

  SendVerifyType sendVerifyType = SendVerifyType.LOGIN;

  VerifyController({
    required this.authRepository,
    required this.accountRepository,
  });

  bool isRequesting = false;
  static const int MAX_INCORRECT_COUNT = 3;
  static const int EXPIRE_COUNT_DOWN = 30;

  RxString rawPhoneNumber = ''.obs;
  RxInt codeExpireCountDown = EXPIRE_COUNT_DOWN.obs;
  RxInt verifyIncorrectCount = MAX_INCORRECT_COUNT.obs;

  Country country = Country(
      name: "Vietnam",
      alpha2Code: "VN",
      alpha3Code: "VNM",
      dialCode: "+84",
      flagUri: 'assets/flags/vn.png');

  verification(int code) async {
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

      final response = sendVerifyType == SendVerifyType.REGISTER
          ? await authRepository.registrationVerification(VerifyCodeRequest(
              email: null,
              phoneNumber: rawPhoneNumber.value,
              dialCode: country.dialCode,
              alpha2Code: country.alpha2Code,
              alpha3Code: country.alpha3Code,
              typeCode: VerifyTypeCode.PHONE_NUMBER,
              verifyCode: code,
              deviceName: deviceName,
              deviceId: deviceId,
              platform: Platform.operatingSystem,
              role: Role.CUSTOMER))
          : await authRepository.loginVerification(VerifyCodeRequest(
              email: null,
              phoneNumber: rawPhoneNumber.value,
              dialCode: country.dialCode,
              alpha2Code: country.alpha2Code,
              alpha3Code: country.alpha3Code,
              typeCode: VerifyTypeCode.PHONE_NUMBER,
              verifyCode: code,
              deviceName: deviceName,
              deviceId: deviceId,
              platform: Platform.operatingSystem,
              role: Role.CUSTOMER));

      Get.back();
      if (response != null && response.account != null) {
        await accountRepository.saveAccount(response.account!, response.token);
        reset();
        CallOutRoute.push();
      } else {
        reset();
        Get.back();
        showDialogError(content: S.current.unknown_error);
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

  void reSendVerifyCode() async {
    try {
      showDialogLoading();
      await authRepository.sendVerifyCode(
        sendVerifyType,
        SendVerifyCodeRequest(
            email: null,
            phoneNumber: rawPhoneNumber.value,
            dialCode: country.dialCode,
            alpha2Code: country.alpha2Code,
            alpha3Code: country.alpha3Code,
            typeCode: VerifyTypeCode.PHONE_NUMBER),
      );
      Get.back();
      reset();
      Get.snackbar(S.current.request, S.current.requested_new_code,
          snackPosition: SnackPosition.TOP);
    } on ApiException catch (e) {
      Get.back();
      showDialogError(content: e.errorMessage);
    } catch (e) {
      printError(info: e.toString());
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
  }

  reset() {
    verifyIncorrectCount.value = MAX_INCORRECT_COUNT;
    codeExpireCountDown.value = EXPIRE_COUNT_DOWN;
  }
}
