import 'package:configuration/data/exceptions/api_exception.dart';
import 'package:configuration/generated/l10n.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_code_request.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_type.dart';
import 'package:flutter_video_calls/data/auth/model/verify_type_code.dart';
import 'package:flutter_video_calls/data/auth/repositories/auth_repository.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/views/common/dialogs/dialog.dart';
import 'package:flutter_video_calls/views/verify_code/verify_code_route.dart';
import 'package:get/get.dart';
import 'package:libphonenumber/libphonenumber.dart';

class SignInController extends GetxController {
  RxString rawPhoneNumber = ''.obs;
  AuthRepository authRepository;

  SignInController({required this.authRepository});

  Rx<Country> country = Country(
          name: "Vietnam",
          alpha2Code: "VN",
          alpha3Code: "VNM",
          dialCode: "+84",
          flagUri: 'assets/flags/vn.png')
      .obs;

  RxBool phoneNumberIsCorrect = false.obs;

  checkPhoneNumberIsCorrect() async {
    phoneNumberIsCorrect.value = await PhoneNumberUtil.isValidPhoneNumber(
          phoneNumber: rawPhoneNumber.value,
          isoCode: country.value.alpha2Code,
        ) ??
        false;
  }

  void sendVerifyCode() async {
    try {
      final isValidPhoneNumber = await PhoneNumberUtil.isValidPhoneNumber(
        phoneNumber: rawPhoneNumber.value,
        isoCode: country.value.alpha2Code,
      );
      if (isValidPhoneNumber != true) {
        showDialogError(content: S.current.code_1015);
        return;
      }
      showDialogLoading();
      await authRepository.sendVerifyCode(
        SendVerifyType.LOGIN,
        SendVerifyCodeRequest(
            email: null,
            phoneNumber: rawPhoneNumber.value,
            dialCode: country.value.dialCode,
            alpha2Code: country.value.alpha2Code,
            alpha3Code: country.value.alpha3Code,
            typeCode: VerifyTypeCode.PHONE_NUMBER),
      );
      Get.back();
      VerifyCodeRoute.push(
        country.value,
        rawPhoneNumber.value,
        SendVerifyType.LOGIN,
      );
    } on ApiException catch (e) {
      Get.back();
      showDialogError(content: e.errorMessage);
    } catch (e) {
      printError(info: e.toString());
      Get.back();
      showDialogError(content: S.current.unknown_error);
    }
  }
}
