import 'dart:math';

import 'package:flutter/cupertino.dart';

class Brain {
  final double finalheight;
  final int finalWeignt;

  double _bmi;
  Brain({@required this.finalheight, this.finalWeignt});

  String BMIValue() {
    _bmi = finalWeignt / pow(finalheight / 100, 2);
    return _bmi.toStringAsFixed(1).toString();
  }

  String BMIResult() {
    if (_bmi >= 25) {
      return "Over Weignt";
    } else if (_bmi <= 18.5) {
      return "Under Weignt";
    } else {
      return "Normal";
    }
  }

  String BMIMessage() {
    if (_bmi >= 25) {
      return "Start doing excercise daily otherwise your life is in risk.";
    } else if (_bmi <= 18.5) {
      return "Start doing excercise daily otherwise your life is in risk.";
    } else {
      return "Your BMI is perfect with respect to your weight and height.";
    }
  }
}
