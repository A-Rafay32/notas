import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/text_theme.dart';

class AppTextFieldDecorations {
  static InputDecoration searchFieldDecoration(BuildContext context) =>
      InputDecoration(
          fillColor: AppColors.blackshadowColor,
          filled: true,
          border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.blackshadowColor),
              borderRadius: BorderRadius.circular(15),
              gapPadding: 10),
          suffixIcon: Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
            child: const CircleAvatar(
              backgroundColor: Colors.green,
              backgroundImage:
                  AssetImage("assets/svgs/profile/user_avatar.png"),
              radius: 3,
            ),
          ),
          prefixIcon: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
              // _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu,
              size: 25.sp,
              color: AppColors.textWhiteColor,
            ),
          ),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 30.w, vertical: 19.h),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          hintText: "Search your notes",
          hintStyle:
              AppTextTheme.textTheme.bodyLarge?.copyWith(color: Colors.white),
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
