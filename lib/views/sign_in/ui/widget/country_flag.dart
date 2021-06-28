import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/views/common/controllers/verify_x.dart';
import 'package:flutter_video_calls/views/sign_in/ui/widget/countries_search_list.dart';
import 'package:get/get.dart';

class CountryFlag extends StatelessWidget {
  final VerifyController _verifyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final country = await showCountrySelectorDialog();
        if (country != null) _verifyController.country.value = country;
      },
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
                () => ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child: Image.asset(
                    _verifyController.country.value.flagUri ?? "",
                    width: 32.0)),
          ),
          SizedBox(width: 6.0),
          Obx(() => Text(
            '${_verifyController.country.value.dialCode}',
                textDirection: TextDirection.ltr,
              )),
        ],
      ),
    );
  }

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
