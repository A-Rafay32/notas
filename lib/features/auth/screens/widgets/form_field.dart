import "package:email_validator/email_validator.dart";
import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:notas/app/themes/app_colors.dart";
import "package:notas/app/themes/app_text_field_themes.dart";
import "package:notas/features/auth/screens/widgets/custom_text_field.dart";

class AuthFormField extends StatefulWidget {
  const AuthFormField({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<AuthFormField> createState() => _AuthFormFieldState();
}

class _AuthFormFieldState extends State<AuthFormField> {
  bool isObscure = false;
  // final formKey = GlobalKey<FormState>();

  void setObscureText() {
    setState(() {
      isObscure = !isObscure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      // key: Provider.of<login>(context, listen: false).formKey,
      child: Column(
        children: [
          CustomTextField(
              validator: (value) {
                return value != null && !EmailValidator.validate(value)
                    ? "Enter a valid email "
                    : null;
              },
              controller: widget.emailController,
              inputDecoration: AppTextFieldDecorations.emailInputDecoration),
          const SizedBox(
            height: 20,
          ),
          CustomTextField(
            validator: (value) {
              return value != null && value.length < 6
                  ? "Enter min 6 characters "
                  : null;
            },
            obscureText: isObscure,
            controller: widget.passwordController,
            inputDecoration: AppTextFieldDecorations.passwordInputDecoration(
                isObscure, setObscureText),
          ),
        ],
      ),
    );
  }
}
