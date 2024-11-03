import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/features/auth/screens/widgets/button.dart';

class LogOutBottomSheet extends StatelessWidget {
  const LogOutBottomSheet(
      {super.key,
      required this.context,
      required this.w,
      required this.abortButton,
      required this.abortButtonText,
      required this.continueButton,
      required this.continueButtonText,
      required this.subtitle,
      required this.title,
      required this.message});

  final BuildContext context;
  final double w;
  final String title;
  final String subtitle;
  final String message;
  final String abortButtonText;
  final String continueButtonText;
  final Function() abortButton;
  final Function() continueButton;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.blackshadowColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10.h),
          Container(
            height: 2,
            width: 40,
            color: AppColors.tertiaryColor,
          ),
          SizedBox(height: 30.h),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 24.sp,
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
          AppSizes.smallY,
          const Divider(color: AppColors.tertiaryColor),
          AppSizes.normalY,
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Button(
                press: abortButton,
                text: "Cancel",
              ),
              Button(
                press: continueButton,
                text: "Continue",
              ),
            ],
          ),
          SizedBox(height: 10.h),
        ],
      ),
    );
  }
}
