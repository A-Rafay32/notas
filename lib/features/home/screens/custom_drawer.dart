import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/snackbar_ext.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/core/utils/types.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/collections/providers/collection_providers.dart';
import 'package:notas/features/collections/screens/collection_screen.dart';
import 'package:notas/features/home/providers/home_state_provider.dart';
import 'package:notas/features/home/screens/widgets/log_out_bottom_sheet.dart';

class CustomDrawer extends ConsumerStatefulWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  ConsumerState<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends ConsumerState<CustomDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userId = ref.read(currentUserProvider)?.uid;
    final streamValue = ref.watch(getCollectionsByUser(userId.toString()));

    return Drawer(
        elevation: 20.0,
        width: context.w * 0.7,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(right: Radius.circular(40))),
        child: Container(
          padding: AppPaddings.normal,
          child: Column(
            children: [
              SizedBox(
                  height: 100,
                  width: context.w * 0.7,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/svgs/author.svg",
                            height: 35,
                            width: 35,
                            colorFilter: const ColorFilter.mode(
                                AppColors.secondaryColor, BlendMode.srcIn)),
                        AppSizes.tinyX,
                        const Text(
                          "Collections",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "Kanit",
                              fontSize: 24,
                              color: AppColors.secondaryColor),
                        ),
                      ],
                    ),
                  )),
              streamValue.when(
                  data: (data) => Expanded(
                          // height: context.h * 0.2,
                          child: SizedBox(
                        width: context.w * 0.7,
                        child: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(
                            thickness: 0.5,
                            color: AppColors.textWhiteColor,
                          ),
                          itemCount: data.length,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.symmetric(vertical: 10.h),
                            child: Row(children: [
                              Icon(Icons.arrow_forward_ios_sharp, size: 15.h),
                              AppSizes.tinyX,
                              Text(
                                data[index].name,
                                style: context.textTheme.labelMedium
                                    ?.copyWith(color: AppColors.textWhiteColor),
                              ),
                            ]),
                          ),
                        ),
                      )),
                  error: (error, stackTrace) => Text(
                        "No Collections Exist",
                        style: context.textTheme.labelMedium?.copyWith(
                            color: AppColors.textWhiteColor.withOpacity(0.6)),
                      ),
                  loading: () => const Loader()),
              const Divider(
                thickness: 0.5,
                color: AppColors.textWhiteColor,
              ),
              CreateCollectionWidget(),
              const Divider(
                thickness: 0.5,
                color: AppColors.textWhiteColor,
              ),
              AppSizes.smallY,
              GestureDetector(
                onTap: () => {
                  showModalBottomSheet(
                    constraints: BoxConstraints(maxHeight: 300.h),
                    context: context,
                    builder: (context) {
                      return LogOutBottomSheet(
                          message: "",
                          abortButtonText: "Cancel",
                          continueButton: () => _signOut(ref, context),
                          continueButtonText: "Yes, Logout",
                          subtitle: "Are you sure you want to log out?",
                          title: "Logout",
                          abortButton: () {
                            context.pop();
                          },
                          context: context,
                          w: context.w);
                    },
                  )
                },
                child: Row(
                  children: [
                    SvgPicture.asset(
                      "assets/svgs/profile/logout.svg",
                      width: 20.w,
                      height: 20.h,
                      colorFilter:
                          const ColorFilter.mode(Colors.red, BlendMode.srcIn),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Logout",
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(
                            color: Colors.red,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  void _signOut(WidgetRef ref, BuildContext context) async {
    Either0 result =
        await ref.read(authNotifier.notifier).signOut().whenComplete(() {
      context.pop();
      ref.read(homeStateProvider.notifier).state = 0;
    });
    result.fold((left) {
      context.showSnackBar(left.message.toString());
    }, (right) {
      print("success${right.message}");
    });
  }
}
