import 'package:flutter/material.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';

class SignUpBar extends StatelessWidget {
  const SignUpBar({
    super.key,
    required this.text1,
    required this.text2,
    required this.onTap,
  });

  final String text1;
  final String text2;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.w,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text1,
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey.shade600,
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Text(
              text2,
              style: const TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 17,
                color: AppColors.secondaryColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
