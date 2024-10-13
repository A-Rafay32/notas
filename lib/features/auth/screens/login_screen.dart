import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/auth/screens/register_screen.dart';
import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
import 'package:notas/features/auth/screens/widgets/button.dart';
import 'package:notas/features/auth/screens/widgets/forgot.dart';
import 'package:notas/features/auth/screens/widgets/form_field.dart';
import 'package:notas/features/auth/screens/widgets/header.dart';
import 'package:notas/features/auth/screens/widgets/signup_bar.dart';
import 'package:notas/features/auth/screens/widgets/socialcard.dart';

class LoginScreen extends ConsumerWidget {
  LoginScreen({
    super.key,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
            child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(
                AppImages.authImage,
                fit: BoxFit.cover,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      CupertinoNavigationBarBackButton(
                          color: AppColors.textWhiteColor, onPressed: () {}),
                      SizedBox(width: context.w * 0.35),
                      const Text(
                        "Login",
                        style: TextStyle(
                            color: AppColors.textWhiteColor, fontSize: 21),
                      ),
                    ],
                  ),
                  AppSizes.largeY,
                  LoginHeader(
                    w: context.w,
                    text1: "Welcome Back",
                    text2: "Sign in with your email and password ",
                    text3: "or continue with social media",
                  ),
                  AppSizes.largeY,
                  AuthFormField(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  AppSizes.tinyY,
                  const Forgot(),
                  AppSizes.normalY,
                  Button(
                    isLoading: ref.watch(authNotifier).isLoading,
                    press: () => ref.read(authNotifier.notifier).signIn(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                        context: context),
                    text: "Login",
                  ),
                  AppSizes.largeY,
                  AppSizes.largeY,
                  // GestureDetector(
                  //   onTap: () => ref
                  //       .read(socialAuthNotifier.notifier)
                  //       .googleSignIn(
                  //           email: emailController.text.trim(),
                  //           password: passwordController.text.trim(),
                  //           context: context),
                  //   child: Container(
                  //     height: 60.h,
                  //     width: context.w * 0.7,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(15),
                  //         border: Border.all(color: Colors.white54)),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.center,
                  //       children: [
                  //         SvgPicture.asset("assets/svgs/google.svg",
                  //             height: 30.h, width: 30.w),
                  //         SizedBox(width: 20.w),
                  //         Text("Sign in with Google",
                  //             style: context.textTheme.labelLarge)
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // const SocialCard(),
                  const Spacer(),
                  SignUpBar(
                    onTap: () => context.push(RegisterScreen()),
                    text1: "Dont't have an account?",
                    text2: "Sign up",
                  ),
                ],
              ),
            ],
          ),
        )));
  }
}
