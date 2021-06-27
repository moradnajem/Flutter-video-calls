import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:get/get.dart';

class Flag extends StatelessWidget {
  final Country country;
  Flag(this.country);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Obx(() => Image.asset(country.flagUri ?? "", width: 32.0)),
        SizedBox(width: 6.0),
        Obx(() => Text(
              '${country.dialCode}',
              textDirection: TextDirection.ltr,
            )),
      ],
    );
  }
}
