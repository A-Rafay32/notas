import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:notas/features/home/screens/widgets/featured_house_images.dart';

class HouseImageView extends StatelessWidget {
  const HouseImageView({
    super.key,
    required this.context,
    required this.productImage,
    required this.isPremium,
    required this.width,
  });

  final BuildContext context;
  final String productImage;
  final bool isPremium;
  final double width;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(428, 926));
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            productImage,
            width: width,
            fit: BoxFit.cover,
          ),
        ),
        // if (isPremium)
        //   Positioned(
        //     left: 0,
        //     child: Container(
        //       padding: EdgeInsets.all(11.h),
        //       decoration: BoxDecoration(
        //           color: AppColors.premiumTagcolor,
        //           borderRadius: const BorderRadius.only(
        //               topLeft: Radius.circular(20),
        //               bottomRight: Radius.circular(20))),
        //       child: SvgPicture.asset(
        //         "assets/exports/diamond.svg",
        //         height: 22.h,
        //         width: 22.w,
        //         colorFilter:
        //             const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        //       ),
        //     ),
        //   ),
        // Positioned(
        //   right: 0,
        //   child: Container(
        //       padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        //       margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.w),
        //       decoration: BoxDecoration(
        //           color: houseType == HouseType.Rent
        //               ? AppColors.rentColor
        //               : AppColors.sellColor,
        //           borderRadius: BorderRadius.circular(20)),
        //       child: Text(
        //         houseType.name,
        //         style: Theme.of(context).textTheme.labelMedium?.copyWith(
        //             color: AppColors.backgroundColor, fontSize: 15.sp),
        //       )),
        // ),
        // const Positioned(
        //     left: 0,
        //     child: FavIcon(
        //       houseId: "",
        //     ))
      ],
    );
  }
}
