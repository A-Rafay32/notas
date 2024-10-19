import 'package:flutter/material.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({
    super.key,
    required this.h,
    required this.w,
    required this.text,
  });

  final double h;
  final double w;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w,
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.black,
          fontFamily: "Raleway",
        ),
      ),
    );
  }
}
