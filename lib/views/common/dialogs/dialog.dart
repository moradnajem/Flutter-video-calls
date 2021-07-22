import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showDialogError({String? title, required String? content}) => Get.dialog(
      AlertDialog(
        title: Text(title ?? S.current.server_error),
        content: Text(content ?? ""),
        actions: <Widget>[
          TextButton(
            child: Text(S.current.close),
            onPressed: () {
              Get.back();
            },
          )
        ],
      ),
      barrierDismissible: false,
    );

showDialogLoading() => Get.dialog(
      WillPopScope(
        onWillPop: () async => false,
        child: Center(
          child: SizedBox(
            width: 60.w,
            height: 60,
            child: CircularProgressIndicator(
              strokeWidth: 10,
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
