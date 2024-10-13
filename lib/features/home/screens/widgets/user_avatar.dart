import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';

class UserAvatar extends StatelessWidget {
  const UserAvatar({
    super.key,
    required this.userName,
    required this.userImage,
  });

  final String userName;
  final String userImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            backgroundImage: Image.asset(userImage).image),
        AppSizes.normalX,
        Text(
          userName,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                fontSize: 27.sp,
                color: AppColors.textWhiteColor,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
