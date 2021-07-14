import 'package:configuration/route/route_define.dart';
import 'package:configuration/utility/utils.dart';
import 'package:flutter_video_calls/data/auth/model/send_verify_type.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/views/verify_code/ui/verify_code_screen.dart';
import 'package:get/get.dart';

class VerifyCodeRoute extends RouteDefine {
  static const ID = "VerifyCode";

  static push(
    Country country,
    String phoneNumber,
    SendVerifyType sendVerifyType,
  ) {
    Get.toNamed(
      ID,
      arguments: {
        "country": country,
        "phoneNumber": phoneNumber,
        "sendVerifyType": SendVerifyTypeEnumMap[sendVerifyType],
      },
    );
  }

  @override
  List<Path> initRoute(Map? arguments) => [
        Path(
          name: ID,
          builder: (_) => VerifyCodeScreen(
            country: arguments != null ? arguments["country"] as Country : null,
            phoneNumber:
                arguments != null ? arguments["phoneNumber"] as String : null,
            sendVerifyType: arguments != null
                ? enumDecodeNullable(
                    SendVerifyTypeEnumMap, arguments['sendVerifyType'])
                : null,
          ),
        ),
      ];
}
