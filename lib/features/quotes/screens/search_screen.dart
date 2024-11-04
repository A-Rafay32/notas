import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/app/themes/app_text_field_themes.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/features/quotes/providers/quotes_providers.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    final streamValue = ref.watch(getQuotesBySearch(searchController.text));

    return Scaffold(
      body: Container(
        padding: AppPaddings.normal,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 70.h,
            child: TextField(
              controller: searchController,
              onChanged: (value) {
                searchController.text = value;
                setState(() {});
              },
              decoration:
                  AppTextFieldDecorations.searchFieldDecorationForSearch(
                      context),
            ),
          ),
          AppSizes.largeY,
          // Text("${collection.name}/",
          // style: context.textTheme.headlineMedium?.copyWith()),
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
                  "Nothing Found",
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
