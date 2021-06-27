import 'package:flutter/material.dart';
import 'package:flutter_video_calls/data/country/model/country_model.dart';
import 'package:flutter_video_calls/views/sign_in/controllers/sign_in_x.dart';
import 'package:flutter_video_calls/views/sign_in/ui/widget/countries_search_list.dart';
import 'package:get/get.dart';

class CountryFlag extends StatelessWidget {
  final SignInController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final country = await showCountrySelectorDialog(context);
        _controller.country.value = country;
      },
      child: Row(
        textDirection: TextDirection.ltr,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Obx(
            () => ClipRRect(
                borderRadius: BorderRadius.circular(4.0),
                child:
                    Image.asset(_controller.country.value?.flagUri ?? "", width: 32.0)),
          ),
          SizedBox(width: 6.0),
          Obx(() => Text(
                '${_controller.country.value?.dialCode}',
                textDirection: TextDirection.ltr,
              )),
        ],
      ),
    );
  }

  Future<Country?> showCountrySelectorDialog(BuildContext context) =>
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => AlertDialog(
          content: Container(
            width: double.maxFinite,
            child: CountrySearchList(),
          ),
        ),
      );
}
