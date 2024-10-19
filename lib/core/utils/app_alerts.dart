import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';

SnackBar snackBarContent({
  Color color = AppColors.primaryColor,
  required String message,
  required BuildContext context,
  double w = double.infinity,
}) {
  return SnackBar(
    width: context.w * 0.9,
    backgroundColor: color,
    elevation: 5,
    padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 10.h),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    content: Center(
      child: Text(
        message,
        textAlign: TextAlign.center,
        style: context.textTheme.bodyMedium?.copyWith(
          color: Colors.white,
        ),
      ),
    ),
  );
}
