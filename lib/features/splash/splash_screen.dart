import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/features/auth/screens/auth_builder.dart';
import 'dart:async';

import 'package:notas/features/home/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (_) => AuthStateBuilder(widget: HomeScreen())),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            AppImages.splashImage2,
            fit: BoxFit.cover,
          ),
          Positioned(
            left: context.w * 0.32,
            top: context.h * 0.4,
            child: Column(
              children: [
                Center(
                  child: Text(
                    'notas',
                    style: context.textTheme.headlineLarge
                        ?.copyWith(fontSize: 50.sp),
                    textAlign: TextAlign.center,
                  ),
                ),
                AppSizes.tinyY,
                Center(
                  child: Text(
                    'Chronicles of Exoplanets',
                    style: context.textTheme.labelMedium?.copyWith(),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
