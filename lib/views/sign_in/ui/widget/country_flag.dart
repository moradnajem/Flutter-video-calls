import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/views/common/controllers/verify_x.dart';
import 'package:get/get.dart';

class CountryFlag extends StatelessWidget {
  final VerifyController _verifyController = Get.find();

  @override
  Widget build(BuildContext context) {
    return ObxValue<Rx<Country>>(
        (country) => Row(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image.asset(country.value.flagUri ?? "",
                        width: 32.0)),
                SizedBox(width: 6.0),
                Text(
                  '${country.value.dialCode}',
                  textDirection: TextDirection.ltr,
                ),
              ],
            ),
        _verifyController.country);
  }
}
