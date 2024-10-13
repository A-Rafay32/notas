import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/themes/app_colors.dart';

class SocialCard extends StatelessWidget {
  const SocialCard({super.key});

  static const List<String> assets = [
    "assets/svgs/google.svg",
    "assets/svgs/fb.svg",
    "assets/svgs/twitter.svg",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        ...List.generate(
          assets.length,
          (index) => Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: AppColors.primaryColor)),
            padding: const EdgeInsets.all(5),
            child: IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                assets[index],
                height: 30,
                width: 30,
              ),
            ),
          ),
        )
      ]),
    );
  }
}
