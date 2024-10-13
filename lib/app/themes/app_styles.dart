import 'package:flutter/material.dart';

class AppStyles {
  static List<BoxShadow> boxShadow = [
    BoxShadow(
        blurRadius: 10,
        color: Colors.grey.shade200.withOpacity(0.7),
        offset: const Offset(-10, 10)),
    BoxShadow(
        blurRadius: 10,
        color: Colors.grey.shade200.withOpacity(0.7),
        offset: const Offset(10, -10))
  ];
}
