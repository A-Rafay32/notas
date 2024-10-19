import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/snackbar_ext.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/core/utils/types.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/home/providers/home_state_provider.dart';
import 'package:notas/features/home/screens/widgets/expedition_card.dart';
import 'package:notas/features/home/screens/widgets/log_out_bottom_sheet.dart';
import 'package:notas/features/home/screens/widgets/profile_options_list.dart';
import 'package:notas/features/home/screens/widgets/user_avatar.dart';

class BuyerProfileScreen extends ConsumerWidget {
  const BuyerProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(currentUserProvider)?.uid ?? "";
    final user = ref.watch(currentUserDocProvider);

    return Container(
        height: context.h,
        width: context.w,
        color: AppColors.backgroundColor,
        padding: AppPaddings.small,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          UserAvatar(
            userName: ref.read(currentUserProvider)?.displayName ?? "",
            userImage: "assets/svgs/profile/user_avatar.png",
          ),
          AppSizes.largeY,
          Text("Your Quizes", style: Theme.of(context).textTheme.headlineSmall),
          AppSizes.normalY,

          const Spacer(),

          // const ProfileOptionsList(),
          ProfileOptionsCard(
            onTap: () {
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
              );
            },
            icon: "assets/svgs/profile/logout.svg",
            text: "Logout",
            w: context.w,
          ),
          AppSizes.largeY,
          AppSizes.largeY,
        ]));
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
