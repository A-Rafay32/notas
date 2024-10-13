// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:notas/app/themes/app_colors.dart';

// class CustomPopupMenuButton extends StatelessWidget {
//   const CustomPopupMenuButton({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton(
//         constraints: BoxConstraints(maxWidth: 240.w),
//         shape: const RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(Radius.circular(10))),
//         icon: SvgPicture.asset(
//           "assets/exports/more.svg",
//           height: 30.h,
//           width: 30.w,
//           colorFilter: ColorFilter.mode(Colors.grey.shade600, BlendMode.srcIn),
//         ),
//         surfaceTintColor: Colors.white,
//         itemBuilder: (context) => [
//               PopupMenuItem(
//                 child: PopUpButton(
//                     svg: "assets/exports/Exclude.svg",
//                     press: () {},
//                     title: "Mark all as read"),
//               ),
//               PopupMenuItem(
//                   child: PopUpButton(
//                 svg: "assets/exports/Close Square.svg",
//                 press: () {},
//                 title: "Mark all as unread",
//               )),
//             ]);
//   }
// }

// class PopUpButton extends StatelessWidget {
//   const PopUpButton({
//     super.key,
//     required this.press,
//     required this.svg,
//     required this.title,
//   });

//   final String title;
//   final String svg;
//   final GestureTapCallback press;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(left: 0.0, right: 0),
//       child: TextButton(
//         style: TextButton.styleFrom(backgroundColor: Colors.transparent),
//         onPressed: press,
//         child: Row(
//           children: [
//             SvgPicture.asset(
//               svg,
//               height: 15,
//               width: 15,
//               colorFilter: const ColorFilter.mode(
//                   AppColors.textBlackColor, BlendMode.srcIn),
//             ),
//             SizedBox(
//               width: 10.h,
//             ),
//             Text(
//               title,
//               style: Theme.of(context).textTheme.titleSmall?.copyWith(
//                     color: AppColors.textBlackColor,
//                   ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
