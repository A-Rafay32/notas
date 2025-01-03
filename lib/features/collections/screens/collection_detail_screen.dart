import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
import 'package:notas/features/collections/models/collections.dart';
import 'package:notas/features/home/screens/widgets/add_quote_dialog.dart';
import 'package:notas/features/quotes/providers/quotes_providers.dart';

class CollectionDetailScreen extends ConsumerWidget {
  const CollectionDetailScreen({super.key, required this.collection});

  final Collection collection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(getQuotesByCollection(collection.id));

    return Scaffold(
      appBar: AppBar(
          title: Text("Notas",
              style: context.textTheme.headlineLarge
                  ?.copyWith(color: AppColors.secondaryColor))),
      body: Container(
        padding: AppPaddings.normal,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("${collection.name}/",
              style: context.textTheme.headlineMedium?.copyWith()),
          AppSizes.normalY,
          streamValue.when(
            data: (data) => SizedBox(
              height: context.h * 0.6,
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => Container(
                  margin: AppPaddings.tiny,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. ${data[index].quotes} ~ ${data[index].author}",
                        style: context.textTheme.labelMedium
                            ?.copyWith(color: AppColors.textWhiteColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            error: (error, stackTrace) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "No Quotes Exist",
                  style: context.textTheme.labelMedium?.copyWith(
                      color: AppColors.textWhiteColor.withOpacity(0.6)),
                ),
                AppSizes.normalY,
                const Icon(Icons.error_outline_rounded, size: 60)
              ],
            ),
            loading: () => const Loader(),
          )
        ]),
      ),
    );
  }
}
