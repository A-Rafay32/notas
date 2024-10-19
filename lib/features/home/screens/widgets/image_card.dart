// import 'package:flutter/material.dart';
// import 'package:notas/app/themes/app_colors.dart';
// import 'package:notas/app/themes/app_paddings.dart';
// import 'package:notas/core/extensions/routes_extenstion.dart';
// import 'package:notas/core/extensions/sizes_extensions.dart';
// import 'package:notas/core/extensions/snackbar_ext.dart';
// import 'package:notas/core/extensions/text_theme_ext.dart';
// import 'package:notas/features/home/models/house.dart';
// import 'package:notas/features/home/models/rental_house.dart';
// import 'package:notas/features/home/screens/chat_screen.dart';
// import 'package:notas/features/home/screens/widgets/custom_pop_menu_button.dart';

// class HouseDetailImage extends StatefulWidget {
//   const HouseDetailImage(
//       {required this.house, required this.h, required this.w, super.key});

//   final double h;
//   final double w;
//   final RentalHouse house;

//   @override
//   State<HouseDetailImage> createState() => _HouseDetailImageState();
// }

// class _HouseDetailImageState extends State<HouseDetailImage> {
//   int currentPage = 0;

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       itemCount: widget.house.images.length,
//       itemBuilder: (context, index) => Column(
//         children: [
//           Stack(
//             children: [
//               ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     bottomLeft: Radius.circular(30),
//                     bottomRight: Radius.circular(30),
//                   ),
//                   child: Image.asset(
//                     widget.house.images[index],
//                     width: context.w,
//                     height: context.h * 0.31,
//                     fit: BoxFit.cover,
//                   )),
//               Positioned(
//                   right: 10,
//                   top: 20,
//                   child: CustomPopupMenuButton(
//                     popupMenuItemList: [
//                       PopupMenuItem(
//                           child: PopUpButton(
//                               press: () {
//                                 // if (widget.house.tenantId != null) {
//                                 // context.push(CreateBillScreen(
//                                 //     tenantId: widget.house.tenantId,
//                                 //     sellerId: widget.house.listedBy));
//                                 // } else {
//                                 context.showSnackBar(
//                                     "Can't Add Rent on unsold house ");
//                                 // }
//                               },
//                               title: "Add Bills")),
//                       PopupMenuItem(
//                           child: PopUpButton(
//                               press: () {}, title: "Seller Profile")),
//                       PopupMenuItem(
//                           child: PopUpButton(
//                               press: () {}, title: "Seller Profile")),
//                     ],
//                   )),
//               Positioned(
//                 left: 10,
//                 top: 20,
//                 child: Card(
//                   shape: const CircleBorder(),
//                   color: Colors.white,
//                   child: GestureDetector(
//                     onTap: () {
//                       context.pop();
//                     },
//                     child: const Padding(
//                       padding: EdgeInsets.all(9),
//                       child: Icon(
//                         Icons.arrow_back_ios_new_rounded,
//                         color: AppColors.primaryColor,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           AppSizes.tinyY,
//           ImageNumber(
//             currentImage: index,
//             totalImages: widget.house.images.length,
//           )
//         ],
//       ),
//     );
//   }
// }

// class ImageNumber extends StatelessWidget {
//   const ImageNumber({
//     super.key,
//     required this.currentImage,
//     required this.totalImages,
//   });

//   final int currentImage;
//   final int totalImages;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.arrow_back_ios_new_rounded,
//               color: AppColors.primaryColor,
//               size: 20,
//             )),
//         AppSizes.largeX,
//         Text(
//           "${currentImage + 1}/$totalImages",
//           style: context.textTheme.bodyLarge
//               ?.copyWith(fontWeight: FontWeight.w700),
//         ),
//         AppSizes.largeX,
//         IconButton(
//             onPressed: () {},
//             icon: const Icon(
//               Icons.arrow_forward_ios_rounded,
//               color: AppColors.primaryColor,
//               size: 20,
//             ))
//       ],
//     );
//   }
// }

// class Dot extends StatelessWidget {
//   Dot({
//     required this.color,
//     required this.currentPage,
//     super.key,
//   });

//   int currentPage;
//   final Color color;

//   @override
//   Widget build(BuildContext context) {
//     return AnimatedContainer(
//       margin: const EdgeInsets.only(right: 8),
//       duration: const Duration(milliseconds: 100),
//       width: 8,
//       height: 8,
//       decoration: BoxDecoration(color: color, shape: BoxShape.circle),
//     );
//   }
// }
