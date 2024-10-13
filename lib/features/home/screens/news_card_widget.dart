import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/app/constants/app_images.dart';
import 'package:notas/app/themes/app_styles.dart';
import 'package:notas/app/themes/app_colors.dart';
import 'package:notas/app/themes/app_paddings.dart';
import 'package:notas/core/extensions/routes_extenstion.dart';
import 'package:notas/core/extensions/sizes_extensions.dart';
import 'package:notas/features/auth/providers/user_notifier.dart';
import 'package:notas/features/home/screens/widgets/house_image_view.dart';

class NewsCardWidget extends ConsumerStatefulWidget {
  const NewsCardWidget({
    super.key,
    required this.image,
    required this.description,
    required this.name,
    required this.id,
    required this.onTapFav,
  });

  final Function() onTapFav;
  final String name;
  final String id;
  final String description;
  final String image;

  @override
  ConsumerState<NewsCardWidget> createState() => _NewsCardWidgetState();
}

class _NewsCardWidgetState extends ConsumerState<NewsCardWidget> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));

    return GestureDetector(
      onTap: () {
        ref.read(userNotifier.notifier).updateUserExpeditionIds(
              expeditionId: widget.id.toString(),
            );
        // context.push(ExpeditionDetailScreen(
        //   expeditionId: widget.id.toString(),
        //   expeditionName: widget.name.toString(),
        // ));
      },
      child: Container(
          padding: AppPaddings.tiny,
          decoration: BoxDecoration(
            // boxShadow: AppStyles.boxShadow,
            color: AppColors.primaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              CachedNetworkImage(
                  imageUrl: widget.image.toString(),
                  width: 200.w,
                  height: context.h * 0.13,
                  imageBuilder: (context, imageProvider) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                  progressIndicatorBuilder: (context, url, downloadProgress) =>
                      SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: CircularProgressIndicator(
                              value: downloadProgress.progress)),
                  errorWidget: (context, url, error) => ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          AppImages.defaultImage,
                          width: 200.w,
                          fit: BoxFit.cover,
                        ),
                      )),

              // HouseImageView(
              //   width: 200.w,
              //   isPremium: true,
              //   productImage: widget.image,
              //   context: context,
              // ),
              AppSizes.smallY,
              productDetails(context),
            ],
          )),
    );
  }

  Column productDetails(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          widget.name.toString(),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: AppColors.textWhiteColor,
              ),
        ),
        // AppSizes.tinyY,
        // SizedBox(
        //   width: 200.w,
        //   child: Text(
        //     widget.description,
        //     maxLines: 2,
        //     overflow: TextOverflow.ellipsis,
        //     style: Theme.of(context)
        //         .textTheme
        //         .bodySmall
        //         ?.copyWith(fontSize: 10.sp, color: AppColors.textWhiteColor),
        //   ),
        // ),
      ],
    );
  }
}
