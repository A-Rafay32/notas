import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/core/utils/gen_random_ids.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
import 'package:notas/features/collections/models/collections.dart';
import 'package:notas/features/collections/providers/collection_notifier.dart';
import 'package:notas/features/collections/providers/collection_providers.dart';
import 'package:notas/features/quotes/screens/quote_screen.dart';

class CollectionScreen extends ConsumerWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: AppPaddings.normal,
      height: context.h,
      width: context.w,
      child: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            CreateCollectionWidget(),
            const AllCollectionWidget(),
          ],
        ),
      ),
    );
  }
}

class AllCollectionWidget extends ConsumerWidget {
  const AllCollectionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = ref.read(currentUserProvider)?.uid;
    final streamValue = ref.watch(getCollectionsByUser(userId.toString()));

    return streamValue.when(
      data: (data) => SizedBox(
          height: context.h * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...List.generate(
                data.length,
                (index) => GestureDetector(
                  onTap: () {
                    context.push(QuoteScreen(
                      collection: data[index],
                    ));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(children: [
                      Icon(Icons.arrow_forward_ios, size: 10.h),
                      AppSizes.tinyX,
                      Text(
                        data[index].name,
                        style: context.textTheme.labelMedium
                            ?.copyWith(color: AppColors.textWhiteColor),
                      ),
                    ]),
                  ),
                ),
              ),
            ],
          )),
      error: (error, stackTrace) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "No Collections Exist",
            style: context.textTheme.labelMedium
                ?.copyWith(color: AppColors.textWhiteColor.withOpacity(0.6)),
          ),
          AppSizes.normalY,
          const Icon(Icons.error_outline_rounded, size: 60)
        ],
      ),
      loading: () => const Loader(),
    );
  }
}

class CreateCollectionWidget extends ConsumerWidget {
  CreateCollectionWidget({
    super.key,
  });
  TextEditingController collectionController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      child: InkWell(
        onTap: () {
          showDialog(
            barrierDismissible: true,
            useSafeArea: true,
            context: context,
            builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cancel",
                        style: context.textTheme.labelMedium
                            ?.copyWith(color: AppColors.textWhiteColor))),
                TextButton(
                    onPressed: () => createCollection(context, ref),
                    child: Text("OK",
                        style: context.textTheme.labelMedium
                            ?.copyWith(color: AppColors.textWhiteColor)))
              ],
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("New Collection",
                      style: context.textTheme.labelMedium
                          ?.copyWith(color: AppColors.textWhiteColor)),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: collectionController,
                    cursorColor: Colors.white70,
                    // cursorHeight: 19,
                    style: const TextStyle(
                        fontFamily: "Kanit",
                        fontSize: 19,
                        color: Colors.white70),
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          borderSide:
                                const BorderSide(color: Colors.white60)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.white60))),
                  )
                ],
              ),
              backgroundColor: AppColors.blackshadowColor,
            ),
          );
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Icon(
            Icons.add,
            color: Colors.white70,
          ),
          AppSizes.tinyX,
          Text("Create new collection",
              style: context.textTheme.labelMedium
                  ?.copyWith(color: AppColors.textWhiteColor))
        ]),
      ),
    );
  }

  void createCollection(BuildContext context, WidgetRef ref) {
    final userId = ref.read(currentUserProvider)?.uid;

    final Collection collection = Collection(
        id: generateId(),
        createdBy: userId.toString(),
        name: collectionController.text.trim().toString());
    ref.read(collectionNotifier.notifier).createCollection(collection, context);
    context.pop();
  }
}
