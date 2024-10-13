import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notas/app/themes/app_colors.dart';

class AppTextTheme {
  static final bodyMedium = GoogleFonts.urbanist(
      fontSize: 14,
      color: AppColors.textWhiteColor,
      fontWeight: FontWeight.w400);

  static final titleMedium = GoogleFonts.urbanist(
      fontSize: 20,
      color: AppColors.textWhiteColor,
      fontWeight: FontWeight.w700);

  static final textTheme = TextTheme(
    titleLarge: GoogleFonts.urbanist(
        fontSize: 16,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w700),
    titleMedium: GoogleFonts.urbanist(
        fontSize: 14,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w700),
    titleSmall: GoogleFonts.urbanist(
        fontSize: 12,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w700),
    headlineLarge: GoogleFonts.urbanist(
        fontSize: 26,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.bold),
    headlineMedium: GoogleFonts.urbanist(
        fontSize: 20,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.bold),
    headlineSmall: GoogleFonts.urbanist(
        fontSize: 18,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.bold),
    bodyLarge: GoogleFonts.urbanist(
        fontSize: 16,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w400),
    bodyMedium: GoogleFonts.urbanist(
        fontSize: 14,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w400),
    bodySmall: GoogleFonts.urbanist(
        fontSize: 12,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w400),
    labelLarge: GoogleFonts.urbanist(
        fontSize: 16,
        color: AppColors.textWhiteColor.withOpacity(0.8),
        fontWeight: FontWeight.w400),
    labelMedium: GoogleFonts.urbanist(
        fontSize: 14,
        color: AppColors.textWhiteColor.withOpacity(0.8),
        fontWeight: FontWeight.w400),
    labelSmall: GoogleFonts.urbanist(
        fontSize: 12,
        color: AppColors.textWhiteColor.withOpacity(0.8),
        fontWeight: FontWeight.w400),
  );
}
