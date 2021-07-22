import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';

class CountryFlag extends StatelessWidget {
  final Country country;

  CountryFlag(this.country);

  @override
  Widget build(BuildContext context) {
    return Row(
      textDirection: TextDirection.ltr,
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Image.asset(country.flagUri ?? "", width: 32.0)),
        SizedBox(width: 6.0),
        Text(
          '${country.dialCode}',
          textDirection: TextDirection.ltr,
        ),
      ],
    );
  }
}
