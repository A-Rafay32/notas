import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';

class CatogoriesTabNav extends ConsumerStatefulWidget {
  const CatogoriesTabNav({super.key, required this.w});

  final double w;

  @override
  ConsumerState<CatogoriesTabNav> createState() => _CatogoriesTabNavState();
}

class _CatogoriesTabNavState extends ConsumerState<CatogoriesTabNav> {
  static int selectedTabIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: widget.w,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      color: AppColors.primaryColor,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          HomeTabNavigationItem(
            isTagSelected: selectedTabIndex == 0 ? true : false,
            onTap: () {},
            imageAsset: AppImages.spaceImages[0],
            text: "All",
          ),
          HomeTabNavigationItem(
              onTap: () {
                // ref
                //     .read(rentalHomeRepository)
                //     .getRentalHouse("S0CORtTumnE5Wt7NGKU1");
              },
              text: "House",
              isTagSelected: selectedTabIndex == 1 ? true : false,
              imageAsset: AppImages.spaceImages[1]),
          HomeTabNavigationItem(
              onTap: () {},
              text: "Apartment",
              isTagSelected: selectedTabIndex == 2 ? true : false,
              imageAsset: AppImages.spaceImages[2]),
        ],
      ),
    );
  }
}

class HomeTabNavigationItem extends StatelessWidget {
  const HomeTabNavigationItem(
      {super.key,
      required this.text,
      this.imageAsset,
      this.paddingHorz,
      this.paddingVer,
      this.fontSize,
      required this.onTap,
      required this.isTagSelected});

  final String text;
  final bool isTagSelected;
  final String? imageAsset;
  final Function() onTap;
  final double? paddingHorz;
  final double? paddingVer;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: AppColors.blackshadowColor,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
        child: Row(
          children: [
            AppSizes.smallX,
            if (imageAsset != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageAsset!,
                  height: 20,
                  width: 20,
                  fit: BoxFit.cover,
                ),
              ),
            AppSizes.tinyX,
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    fontSize: fontSize ?? 14,
                    color: Colors.white,
                  ),
            ),
            AppSizes.normalX
          ],
        ),
      ),
    );
  }
}
