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
import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
import 'package:notas/features/collections/models/collections.dart';
import 'package:notas/features/home/screens/widgets/add_quote_dialog.dart';
import 'package:notas/features/quotes/providers/quotes_providers.dart';
import 'package:notas/features/quotes/screens/search_screen.dart';

class QuoteScreen extends ConsumerStatefulWidget {
  const QuoteScreen({super.key, required this.collection});

  final Collection collection;

  @override
  ConsumerState<QuoteScreen> createState() => _QuoteScreenState();
}

class _QuoteScreenState extends ConsumerState<QuoteScreen> {
  // final searchValue = "";

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final streamValue = ref.watch(getQuotesByCollection(widget.collection.id));

    return Container(
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
            onTap: () => context.push(SearchScreen()),
            decoration: AppTextFieldDecorations.searchFieldDecoration(context),
          ),
        ),
        AppSizes.largeY,
        Text("${widget.collection.name}/",
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
    );
  }
}
