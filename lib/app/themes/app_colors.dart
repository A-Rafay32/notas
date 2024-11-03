import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  // static const Color primaryColor = Color.fromARGB(255, 53, 55, 75);
  // static const Color secondaryColor = Color.fromARGB(255, 120, 160, 131);
  static const Color primaryColor = Color.fromARGB(255, 40, 40, 43);
  static const Color secondaryColor = Color.fromRGBO(56, 142, 60, 1);
  static const Color tertiaryColor = Color.fromARGB(255, 52, 73, 85);
  static LinearGradient linearGradient = const LinearGradient(colors: [
    Color.fromARGB(255, 120, 160, 131),
    Color.fromARGB(255, 80, 114, 123)
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);
  static LinearGradient imageGradient = const LinearGradient(
      colors: [Colors.black12, Colors.black87],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  // static const Color backgroundColor = Color.fromARGB(255, 53, 55, 75);
  static const Color backgroundColor = Color.fromARGB(255, 40, 40, 43);
  static const Color blackshadowColor = Color.fromARGB(255, 32, 31, 31);
  // static Color sellColor = const Color.fromARGB(255, 7, 189, 116);
  // static Color rentColor = const Color.fromARGB(255, 36, 107, 253);

  static const Color kbackgroundColor = Color.fromARGB(17, 255, 255, 255);
  static const Color textBlackColor = Colors.black;
  static const Color textWhiteColor = Colors.white;
  static Color shadowColor = const Color(0xFFF9F9F9);
}
