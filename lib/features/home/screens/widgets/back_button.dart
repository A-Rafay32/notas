import 'package:flutter/material.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      decoration: BoxDecoration(color: Colors.grey.shade300, shape: BoxShape.circle),
      child: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
            // size: 20,
            size: 20,
            color: Colors.white,
            Icons.arrow_back_ios_rounded),
      ),
    );
  }
}
