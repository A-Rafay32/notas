import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
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
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
      child: Column(
        children: [
          SizedBox(
            height: 10.h,
          ),
          Container(
            height: 2,
            width: 40,
            color: Colors.grey.shade200,
          ),
          SizedBox(
            height: 30.h,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 24.sp,
                color: Colors.red,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.h),
          Divider(
            color: Colors.grey.shade100,
          ),
          SizedBox(height: 30.h),
          Text(
            subtitle,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textBlackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(height: 12.h),
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
