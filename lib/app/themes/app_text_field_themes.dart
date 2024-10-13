import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/text_theme.dart';

class AppTextFieldDecorations {
  static final searchFieldDecoration = InputDecoration(
      fillColor: AppColors.blackshadowColor,
      filled: true,
      border: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.blackshadowColor),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10),

      // prefixIcon: Padding(
      //   padding: EdgeInsets.only(top: 10.sp, bottom: 10.sp),
      //   child: SvgPicture.asset(
      //     AppSvgs.search,
      //     colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      //   ),
      // ),
      suffixIcon: Container(
        padding: EdgeInsets.all(9.sp),
        margin: EdgeInsets.all(9.sp),
        decoration: BoxDecoration(
            gradient: AppColors.linearGradient, shape: BoxShape.circle),
        child: SvgPicture.asset(
          AppSvgs.filter,
          colorFilter: const ColorFilter.mode(Colors.black, BlendMode.srcIn),
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 23.h),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "Search",
      hintStyle: AppTextTheme.bodyMedium.copyWith(color: Colors.white),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10));

  static final emailInputDecoration = InputDecoration(
      suffixIcon: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.0),
        child: Icon(
          Icons.email_outlined,
          color: AppColors.textWhiteColor,
        ),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 23.h),
      labelText: "Email",
      labelStyle: const TextStyle(color: AppColors.textWhiteColor),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: "Enter your email",
      hintStyle: AppTextTheme.textTheme.labelMedium?.copyWith(
          color: AppColors.textWhiteColor.withOpacity(0.6),
          fontWeight: FontWeight.w900),
      focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.red.shade900),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10),
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textWhiteColor),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.textWhiteColor),
          borderRadius: BorderRadius.circular(15),
          gapPadding: 10));

  static passwordInputDecoration(bool isObscure, Function() onPressed) {
    return InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: IconButton(
            onPressed: onPressed,
            icon: (isObscure)
                ? SvgPicture.asset("assets/svgs/eye_closed.svg",
                    height: 30,
                    width: 30,
                    colorFilter: const ColorFilter.mode(
                        AppColors.textWhiteColor, BlendMode.srcIn))
                : SvgPicture.asset("assets/svg/eye_open.svg",
                    height: 30,
                    width: 30,
                    colorFilter: const ColorFilter.mode(
                        AppColors.textWhiteColor, BlendMode.srcIn)),
            iconSize: 28,
            color: AppColors.textWhiteColor,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 23.h),
        labelText: "Password",
        labelStyle: const TextStyle(color: AppColors.textWhiteColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Enter your password",
        hintStyle: AppTextTheme.textTheme.labelMedium?.copyWith(
            color: AppColors.textWhiteColor.withOpacity(0.6),
            fontWeight: FontWeight.w900),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10),
        errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red.shade900),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textWhiteColor),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textWhiteColor),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10));
  }

  static genericInputDecoration({
    Widget? suffixIcon,
    String? hint,
    required String label,
  }) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 23.h),
        labelText: label,
        labelStyle: const TextStyle(color: AppColors.textWhiteColor),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: hint ?? "Enter your ${label.toLowerCase()}",
        hintStyle: AppTextTheme.textTheme.labelMedium?.copyWith(
            color: AppColors.textWhiteColor.withOpacity(0.6),
            fontWeight: FontWeight.w900),
        focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textWhiteColor),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10),
        errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textWhiteColor),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10),
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textWhiteColor),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.textWhiteColor),
            borderRadius: BorderRadius.circular(15),
            gapPadding: 10));
  }
}
