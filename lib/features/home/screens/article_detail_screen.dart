import 'package:cached_network_image/cached_network_image.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/core/extensions/text_theme_ext.dart';
import 'package:notas/core/utils/loader.dart';
import 'package:notas/features/auth/providers/auth_providers.dart';
import 'package:notas/features/auth/screens/widgets/app_bar_white.dart';
import 'package:notas/features/auth/screens/widgets/button.dart';
import 'package:notas/features/home/model/space_articles_model.dart';
import 'widgets/description_card.dart';
import 'widgets/image_card.dart';
import 'widgets/price_card.dart';
import 'widgets/room_size_card.dart';

class ArticleDetailScreen extends ConsumerStatefulWidget {
  const ArticleDetailScreen({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  ConsumerState<ArticleDetailScreen> createState() => _HouseDetailScreenState();
}

class _HouseDetailScreenState extends ConsumerState<ArticleDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SizedBox(
        height: context.h,
        width: context.w,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: CachedNetworkImage(
                        imageUrl: widget.article.imageUrl,
                        fit: BoxFit.cover,
                        width: context.w,
                        height: context.h * 0.4,
                      )),
                  Positioned(
                      left: 10,
                      top: 10,
                      child: CupertinoNavigationBarBackButton(
                        color: AppColors.textWhiteColor,
                        onPressed: () {
                          context.pop();
                        },
                      ))
                ],
              ),
              // SizedBox(
              //   height: context.h * 0.4,
              //   width: context.w,
              //   child: HouseDetailImage(
              //       h: context.h, w: context.w, house: widget.house),
              // ),
              AppSizes.largeY,
              SizedBox(
                height: context.h * 0.9,
                width: context.w,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(widget.article.title,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: context.textTheme.headlineLarge
                              ?.copyWith(fontWeight: FontWeight.w700)),
                      AppSizes.tinyY,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(widget.article.newsSite,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.titleSmall?.copyWith(
                                color:
                                    AppColors.textWhiteColor.withOpacity(0.2),
                              )),
                          Text(widget.article.publishedAt,
                              overflow: TextOverflow.ellipsis,
                              style: context.textTheme.titleSmall?.copyWith(
                                color:
                                    AppColors.textWhiteColor.withOpacity(0.2),
                              )),
                        ],
                      ),
                      AppSizes.normalY,
                      Text(widget.article.summary,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: context.textTheme.bodySmall?.copyWith()),
                      Text(widget.article.summary,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 10,
                          style: context.textTheme.bodySmall?.copyWith()),
                      AppSizes.largeY,
                      AppSizes.largeY,
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FAButton(
      //   title: "Request a visit",
      //   onTap: () => context.push(CreateOfferScreen(
      //       amount: widget.house.rentPerMonth,
      //       sellerId: widget.house.listedBy)),
      // ),
    );
  }
}
