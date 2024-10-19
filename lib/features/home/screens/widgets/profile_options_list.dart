import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/constants/firebase_constants.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/auth/repositories/user_repository.dart';
// import 'package:notas/features/seller/screen/seller_dashboard_screen.dart';
// import 'package:notas/features/seller/screen/seller_form_screen.dart';

class ProfileOptionsList extends ConsumerStatefulWidget {
  const ProfileOptionsList({
    super.key,
  });

  @override
  ConsumerState<ProfileOptionsList> createState() => _ProfileOptionsListState();
}

class _ProfileOptionsListState extends ConsumerState<ProfileOptionsList> {
  bool isSeller = false;
  @override
  void initState() {
    // ref
    //     .read(currentUserDocProvider)
    //     .fold((left) => null, (right) => isSeller = right.isSeller);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProfileOptionsCard(
          onTap: () {
            UserRepository().getUser(currentUser?.uid ?? "");
          },
          icon: "assets/svgs/profile/profile.svg",
          text: "Profile",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/Bag_outlined.svg",
          text: "My Houses",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/Bag_outlined.svg",
          text: "My Bills",
          w: context.w,
        ),
        const Divider(
          color: Color.fromARGB(255, 238, 238, 238),
        ),
        if (!isSeller)
          ProfileOptionsCard(
            onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                actionsAlignment: MainAxisAlignment.spaceBetween,
                actions: [
                  TextButton(
                      onPressed: () => context.pop(),
                      child: const Text("Cancel")),
                  TextButton(
                      onPressed: () {
                        context.pop();
                        // context.push(const SellerStoreScreen());
                      },
                      child: const Text("Continue")),
                ],
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Become A Seller ",
                        style: Theme.of(context).textTheme.headlineSmall),
                    AppSizes.normalY,
                    Text("Submit details and become a seller",
                        style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
              ),
            ),
            icon: "assets/svgs/profile/seller.svg",
            text: "Become A Seller",
            w: context.w,
          )
        else
          ProfileOptionsCard(
            onTap: () {},
            icon: "assets/svgs/profile/seller.svg",
            text: "Switch to Seller",
            w: context.w,
          ),
        const Divider(
          color: Color.fromARGB(255, 238, 238, 238),
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/wallet.svg",
          text: "Payments",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/privacy.svg",
          text: "Privacy & Security ",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/language.svg",
          text: "Language",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/region.svg",
          text: "Region",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          svgH: 15.h,
          svgW: 15.w,
          icon: "assets/svgs/profile/currency.svg",
          text: "Currency",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/help.svg",
          text: "Help Center",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/invite.svg",
          text: "Invite Friends",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/report.svg",
          text: "Report",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/terms.svg",
          text: "Terms & Conditions",
          w: context.w,
        ),
        ProfileOptionsCard(
          onTap: () {},
          icon: "assets/svgs/profile/rate.svg",
          text: "Rate us",
          w: context.w,
        ),
      ],
    );
  }
}

class ProfileOptionsCard extends StatelessWidget {
  const ProfileOptionsCard(
      {super.key,
      required this.w,
      this.svgH,
      this.svgW,
      required this.icon,
      required this.onTap,
      required this.text});

  final double w;
  final double? svgW;
  final double? svgH;
  final String icon;
  final String text;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: w,
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: svgW ?? 25.w,
              height: svgH ?? 25.h,
              colorFilter: ColorFilter.mode(
                  text == "Logout" ? Colors.red : AppColors.textWhiteColor,
                  BlendMode.srcIn),
            ),
            const SizedBox(width: 10),
            Text(
              text,
              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                    color: text == "Logout"
                        ? Colors.red
                        : AppColors.textWhiteColor,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 24.h,
            ),
          ],
        ),
      ),
    );
  }
}
