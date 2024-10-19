import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/features/home/providers/home_state_provider.dart';

class CustomNavigationBar extends ConsumerWidget {
  CustomNavigationBar({
    super.key,
    required this.w,
  });

  final double w;

  List<String> navs = [
    "Home",
    // "Exoplanets",
    "Constellations",
    "You"
  ];
  List<String> navSvgs = [
    AppSvgs.home,
    // AppSvgs.planets,
    AppSvgs.constellations,
    AppSvgs.profile
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentTab = ref.watch(homeStateProvider);
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
      height: 65,
      width: w * 0.8,
      decoration: BoxDecoration(
        boxShadow: const [
          // BoxShadow(
          //     offset: const Offset(0, 10),
          //     blurRadius: 35,
          //     color: AppColors.secondaryColor.withOpacity(0.32))
        ],
        color: AppColors.secondaryColor.withOpacity(0.6),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          navs.length,
          (index) => BottomNavBarItem(
            text: navs[index],
            onTap: () {
              ref.read(homeStateProvider.notifier).state = index;
              currentTab = index;
            },
            isTagSelected: currentTab == index ? true : false,
            iconAsset: navSvgs[index],
          ),
        ),
      ),
    );
  }
}

class BottomNavBarItem extends StatelessWidget {
  const BottomNavBarItem(
      {super.key,
      required this.text,
      this.iconAsset,
      required this.onTap,
      required this.isTagSelected});

  final String text;
  final bool isTagSelected;
  final String? iconAsset;

  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
        // padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        child: Column(
          children: [
            iconAsset == null
                ? Container()
                : SvgPicture.asset(
                    iconAsset!,
                    height: 17,
                    width: 17,
                    colorFilter: ColorFilter.mode(
                        isTagSelected
                            ? AppColors.textWhiteColor
                            : AppColors.textWhiteColor.withOpacity(0.3),
                        BlendMode.srcIn),
                  ),
            const SizedBox(
              height: 5,
            ),
            Text(
              text,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isTagSelected
                        ? AppColors.textWhiteColor
                        : AppColors.textWhiteColor.withOpacity(0.3),
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
