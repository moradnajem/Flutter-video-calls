import 'package:configuration/generated/l10n.dart';
import 'package:flutter/material.dart';

extension EnumToName on String {
  String enumToName() {
    final List<String> paths = this.split('.');
    return paths[1];
  }
}

extension GreetingByTime on TimeOfDay {
  String greetingByTimeWithUsername(String userName){
    String greeting = "";

    if(hour >= 5 && hour < 12){
      greeting = S.current.good_morning(userName);
    }else if(hour >= 12 && hour < 18){
      greeting = S.current.good_afternoon(userName);
    }else if(hour >= 18 && hour < 22){
      greeting = S.current.good_evening(userName);
    }else{
      greeting = S.current.good_night(userName);
    }
    return greeting;
  }
}