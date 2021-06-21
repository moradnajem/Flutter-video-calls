import 'package:flutter/material.dart';

class Utils {
  static void afterBuild(Function callback) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      callback();
    });
  }
}

// Map<String, double> ratios = {
//   '1:1': 1 / 1,
//   '9:16': 9 / 16,
//   '3:4': 3 / 4,
//   '9:21': 9 / 21,
//   'full': MediaQuery.of(context).size.aspectRatio,
// };
