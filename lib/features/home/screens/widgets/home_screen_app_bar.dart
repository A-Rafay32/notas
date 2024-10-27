import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notas/app/constants/firebase_constants.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';

class HomeScreenAppBar extends ConsumerWidget {
  const HomeScreenAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // String? userName = FirebaseAuth.instance.currentUser?.displayName;

    return AppBar(
      // backgroundColor: AppColors.backgroundColor,
      centerTitle: false,
      leading: const Padding(
        padding: EdgeInsets.only(left: 5, top: 5, bottom: 8),
        child: CircleAvatar(
          backgroundColor: Colors.green,
          backgroundImage: AssetImage("assets/svgs/profile/user_avatar.png"),
          radius: 3,
        ),
      ),
      title: Column(
        children: [
          Text(
            ref.watch(currentUserProvider)?.displayName.toString() ?? "",
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 20),
          ),
          // Text(
          //   "London, UK",
          //   style: Theme.of(context).textTheme.titleSmall?.copyWith(),
          // ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: const ButtonStyle(
              padding: WidgetStatePropertyAll(EdgeInsets.all(5)),
              backgroundColor:
                  WidgetStatePropertyAll(AppColors.blackshadowColor),
              elevation: WidgetStatePropertyAll(10.0),
              shape: WidgetStatePropertyAll(CircleBorder())),
          child: const Icon(
            Icons.notifications_none_outlined,
            size: 25,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
