import "package:email_validator/email_validator.dart";
import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_colors.dart';
import "package:notas/app/themes/app_paddings.dart";
import "package:notas/app/themes/app_text_field_themes.dart";
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
import 'package:notas/features/auth/screens/widgets/button.dart';
import 'package:notas/features/auth/screens/widgets/custom_text_field.dart';
import 'package:notas/features/auth/screens/widgets/form_field.dart';
import 'package:notas/features/auth/screens/widgets/header.dart';
import 'package:notas/features/auth/screens/widgets/signup_bar.dart';

class RegisterScreen extends ConsumerWidget {
  RegisterScreen({super.key});

  bool isReset = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            children: [
              Row(
                children: [
                  CupertinoNavigationBarBackButton(
                      color: AppColors.textWhiteColor,
                      onPressed: () {
                        context.pop();
                      }),
                  SizedBox(width: context.w * 0.3),
                  const Text(
                    "Register",
                    style: TextStyle(
                        color: AppColors.textWhiteColor, fontSize: 21),
                  ),
                ],
              ),
              AppSizes.largeY,
              LoginHeader(
                  w: context.w,
                  text1: "Create Your Account",
                  text2: "Sign up with your email and password",
                  text3: "or continue with social media"),
              AppSizes.largeY,
              CustomTextField(
                  validator: (value) {
                    return value == null ? "Field can't be empty" : null;
                  },
                  controller: nameController,
                  inputDecoration:
                      AppTextFieldDecorations.genericInputDecoration(
                          label: "Name")),
              AppSizes.normalY,
              AuthFormField(
                emailController: emailController,
                passwordController: passwordController,
              ),
              AppSizes.largeY,
              Button(
                isLoading: ref.watch(authNotifier).isLoading,
                press: () => ref.read(authNotifier.notifier).register(
                    name: nameController.text.trim(),
                    email: emailController.text.trim(),
                    password: passwordController.text.trim(),
                    context: context),
                text: "Register",
              ),
              const Spacer(),
              SignUpBar(
                onTap: () => context.pop(),
                text1: "Already have an account?",
                text2: "Sign In",
              ),
            ],
          ),
        ));
  }
}

class ForgotFormField extends StatefulWidget {
  const ForgotFormField({super.key});

  @override
  State<ForgotFormField> createState() => _ForgotFormFieldState();
}

class _ForgotFormFieldState extends State<ForgotFormField> {
  TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  // Future resetPassword() async {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => const Center(child: CircularProgressIndicator()),
  //   );
  //   try {
  //     await FirebaseAuth.instance
  //         .sendPasswordResetEmail(email: emailController.text.trim());
  //     Util.showSnackBar("Password Reset Email Sent");
  //     Navigator.of(context).popUntil((route) => route.isFirst);
  //   } on FirebaseException catch (e) {
  //     print(e.message);
  //     Util.showSnackBar(e.message);
  //     Navigator.pop(context);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Form(
        child: Container(
      height: size.height * 0.18,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: TextFormField(
          validator: (value) {
            return value != null && !EmailValidator.validate(value)
                ? "Enter a valid email "
                : null;
          },
          controller: emailController,
          cursorColor: Colors.black,
          style: const TextStyle(fontSize: 16, color: Colors.black),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: AppTextFieldDecorations.emailInputDecoration),
    ));
  }
}
