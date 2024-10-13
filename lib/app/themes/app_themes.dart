import 'package:flutter/material.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/text_theme.dart';

class AppThemes {
  late final theme = ThemeData(
      primaryColor: AppColors.primaryColor,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
      textTheme: AppTextTheme.textTheme,
      elevatedButtonTheme: elevationButtonTheme,
      textButtonTheme: textButtonTheme,
      cardColor: AppColors.secondaryColor,
      appBarTheme: appBarTheme,
      visualDensity: VisualDensity.adaptivePlatformDensity,
      searchBarTheme: searchBarThemeData,
      snackBarTheme: snackbarTheme,
      bottomSheetTheme: bottomSheetTheme,
      bottomNavigationBarTheme: bottomNavigationBarTheme,
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.secondaryColor,
      ),
      scaffoldBackgroundColor: AppColors.backgroundColor,
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      dialogTheme: DialogTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          backgroundColor: AppColors.backgroundColor),
      iconButtonTheme: const IconButtonThemeData(
          style: ButtonStyle(
        iconColor: MaterialStatePropertyAll(Colors.white),
        elevation: MaterialStatePropertyAll(2.0),
      )),
      checkboxTheme: const CheckboxThemeData(
        fillColor: MaterialStatePropertyAll(Colors.white),
        checkColor: MaterialStatePropertyAll(AppColors.primaryColor),
      ),
      useMaterial3: true,
      shadowColor: AppColors.shadowColor);

  final snackbarTheme = SnackBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      insetPadding: const EdgeInsets.all(7),
      elevation: 1.0,
      behavior: SnackBarBehavior.floating,
      contentTextStyle: AppTextTheme.bodyMedium,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))));

  final navigationBarTheme = NavigationBarThemeData(
      backgroundColor: AppColors.primaryColor,
      surfaceTintColor: AppColors.primaryColor,
      elevation: 2.0,
      iconTheme:
          MaterialStatePropertyAll(IconThemeData(color: AppColors.shadowColor)),
      indicatorColor: AppColors.secondaryColor);
  final bottomNavigationBarTheme = BottomNavigationBarThemeData(
      backgroundColor: AppColors.backgroundColor,
      elevation: 2.0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: AppColors.secondaryColor,
      unselectedIconTheme: IconThemeData(color: AppColors.shadowColor),
      unselectedItemColor: AppColors.shadowColor,
      selectedIconTheme: const IconThemeData(color: AppColors.secondaryColor));

  final AppBarTheme appBarTheme = AppBarTheme(
    centerTitle: true,
    titleTextStyle: AppTextTheme.titleMedium.copyWith(color: Colors.white),
    backgroundColor: AppColors.primaryColor,
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );

  final bottomSheetTheme = const BottomSheetThemeData(
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(240), topRight: Radius.circular(240))),
  );

  final TextButtonThemeData textButtonTheme = TextButtonThemeData(
      style: ButtonStyle(
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          textStyle: MaterialStatePropertyAll(AppTextTheme.bodyMedium),
          backgroundColor:
              const MaterialStatePropertyAll(AppColors.backgroundColor)));

  final elevationButtonTheme = ElevatedButtonThemeData(
      style: ButtonStyle(
    shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
    backgroundColor: const MaterialStatePropertyAll(AppColors.secondaryColor),
    elevation: const MaterialStatePropertyAll(2.0),
    textStyle: MaterialStatePropertyAll(AppTextTheme.bodyMedium),
  ));
  final searchBarThemeData = SearchBarThemeData(
    elevation: const MaterialStatePropertyAll(1.0),
    hintStyle: MaterialStatePropertyAll(
      AppTextTheme.bodyMedium,
    ),
    shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
    padding: const MaterialStatePropertyAll(
      EdgeInsets.all(5),
    ),
    backgroundColor: const MaterialStatePropertyAll(AppColors.blackshadowColor),
  );
}
