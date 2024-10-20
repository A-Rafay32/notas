import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/app/themes/app_text_field_themes.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/collections/providers/collection_providers.dart';
import 'package:notas/features/collections/screens/collection_screen.dart';
import 'package:notas/features/home/providers/home_state_provider.dart';
import 'package:notas/features/home/screens/buyer_profile_screen.dart';
import 'package:notas/features/home/screens/custom_drawer.dart';
import 'package:notas/features/home/screens/widgets/add_quote_dialog.dart';
import 'package:notas/features/home/screens/widgets/app_bars.dart';
import 'package:notas/features/home/screens/widgets/custom_navigation_bar.dart';
import 'package:notas/features/quotes/screens/quote_screen.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  String? collectionId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final collectionValue = ref.watch(getDefaultCollection);
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return SafeArea(
      child: Scaffold(
          key: scaffoldKey,
          extendBody: true,
          backgroundColor: AppColors.primaryColor,
          // appBar: AppBar(

          //   title: Text("Notas",
          //       style: context.textTheme.headlineLarge
          //           ?.copyWith(color: AppColors.secondaryColor)),
          // ),
          drawer: const CustomDrawer(),
          body: collectionValue.when(
            data: (data) {
              collectionId = data.id;
              return QuoteScreen(collection: data);
            },
            error: (error, stackTrace) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                    child: Icon(
                  Icons.error_outline_sharp,
                  size: 150,
                  color: AppColors.textWhiteColor.withOpacity(0.6),
                )),
                AppSizes.normalY,
                Center(
                  child: Text(
                    "No Quotes Exist",
                    style: context.textTheme.headlineSmall?.copyWith(
                        color: AppColors.textWhiteColor.withOpacity(0.6)),
                  ),
                ),
              ],
            ),
            loading: () => const Loader(),
          ),
          floatingActionButton:
              AddButton(collectionId: collectionId.toString())),
    );
  }
}
