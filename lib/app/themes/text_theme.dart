  import 'dart:ui';

  import 'package:flutter/material.dart';
  import 'package:google_fonts/google_fonts.dart';
  import 'package:notas/app/themes/app_colors.dart';

  class AppTextTheme {
    static final bodyMedium = GoogleFonts.ubuntuMono(
        fontSize: 14,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w400);

    static final titleMedium = GoogleFonts.ubuntuMono(
        fontSize: 20,
        color: AppColors.textWhiteColor,
        fontWeight: FontWeight.w700);

    static final textTheme = TextTheme(
      titleLarge: GoogleFonts.ubuntuMono(
          fontSize: 16,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.w700),
      titleMedium: GoogleFonts.ubuntuMono(
          fontSize: 14,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.w700),
      titleSmall: GoogleFonts.ubuntuMono(
          fontSize: 12,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.w700),
      headlineLarge: GoogleFonts.ubuntuMono(
          fontSize: 26,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.bold),
      headlineMedium: GoogleFonts.ubuntuMono(
          fontSize: 20,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.bold),
      headlineSmall: GoogleFonts.ubuntuMono(
          fontSize: 18,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.bold),
      bodyLarge: GoogleFonts.ubuntuMono(
          fontSize: 16,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.w400),
      bodyMedium: GoogleFonts.ubuntuMono(
          fontSize: 14,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.ubuntuMono(
          fontSize: 12,
          color: AppColors.textWhiteColor,
          fontWeight: FontWeight.w400),
      labelLarge: GoogleFonts.ubuntuMono(
          fontSize: 16,
          color: AppColors.textWhiteColor.withOpacity(0.8),
          fontWeight: FontWeight.w400),
      labelMedium: GoogleFonts.ubuntuMono(
          fontSize: 14,
          color: AppColors.textWhiteColor.withOpacity(0.8),
          fontWeight: FontWeight.w400),
      labelSmall: GoogleFonts.ubuntuMono(
          fontSize: 12,
          color: AppColors.textWhiteColor.withOpacity(0.8),
          fontWeight: FontWeight.w400),
    );
  }
