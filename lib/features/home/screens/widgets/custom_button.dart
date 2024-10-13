import 'package:flutter/material.dart';
import 'package:notas/app/themes/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.w,
    required this.h,
    required this.onTap,
    required this.title,
    this.buttonColor = AppColors.primaryColor,
  });

  final double w;
  final double h;
  final Function() onTap;
  final Color buttonColor;
  final String title;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        height: h * 0.08,
        width: w * 0.9,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  blurRadius: 20,
                  color: Colors.black.withOpacity(0.2),
                  offset: const Offset(10, 10))
            ]),
        child: Center(
          child: Text(title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 17,
              )),
        ),
      ),
    );
  }
}

class ContactButton extends StatelessWidget {
  const ContactButton(
      {required this.w,
      required this.h,
      required this.icon,
      required this.onTap,
      required this.title,
      super.key});

  final double w;
  final double h;
  final Function() onTap;
  final String title;
  final Icon icon;

// Icon(color: Colors.white, Icons.email_outlined)
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: h * 0.07,
        width: w * 0.4,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green.shade400),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            child: icon,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontFamily: "Raleway",
                fontSize: 17,
                color: Colors.white),
          ),
        ]),
      ),
    );
  }
}
