// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:notas/app/themes/app_colors.dart';
// import 'package:notas/app/themes/app_paddings.dart';
// import 'package:notas/core/extensions/sizes_extensions.dart';
// import 'package:notas/core/extensions/snackbar_ext.dart';
// import 'package:notas/core/extensions/text_theme_ext.dart';
// import 'package:notas/features/auth/providers/user_notifier.dart';
// import 'package:notas/features/home/models/rental_house.dart';

// class FeaturedHouseImages extends ConsumerWidget {
//   const FeaturedHouseImages({
//     super.key,
//     required this.house,
//     required this.onTap,
//   });

//   final RentalHouse house;
//   final Function() onTap;
//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Stack(
//           children: [
//             ClipRRect(
//               borderRadius: BorderRadius.circular(20),
//               child: Image.asset(
//                 house.images[5],
//                 fit: BoxFit.cover,
//                 width: context.w * 0.8,
//                 height: context.h,
//               ),
//             ),
//             Positioned(
//               bottom: 0,
//               child: Container(
//                 width: context.w * 0.8,
//                 height: 100,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   gradient: AppColors.imageGradient,
//                 ),
//               ),
//             ),
//             Positioned(
//                 top: 20,
//                 right: 10,
//                 child: FavIcon(
//                   houseId: house.id,
//                 )),
//             Positioned(
//               bottom: 10,
//               left: 10,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     house.name.toString(),
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                   ),
//                   // AppSizes.tinyY,
//                   Text(
//                     "\$ ${house.rentPerMonth}",
//                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
//                           fontWeight: FontWeight.bold,
//                           color: Colors.white,
//                         ),
//                   ),
//                   AppSizes.tinyY,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       const IconCard(icon: Icons.bed_outlined),
//                       Text(
//                         "${house.houseDetails.roomQty} Bds",
//                         style: context.textTheme.bodyMedium
//                             ?.copyWith(color: Colors.white),
//                       ),
//                       const IconCard(icon: Icons.bathtub_outlined),
//                       Text(
//                         "${house.houseDetails.roomQty} Baths",
//                         style: context.textTheme.bodyMedium
//                             ?.copyWith(color: Colors.white),
//                       ),
//                       const IconCard(icon: Icons.star_border_rounded),
//                       Text(
//                         "${house.houseDetails.sizeInFeet} ft2",
//                         style: context.textTheme.bodyMedium
//                             ?.copyWith(color: Colors.white),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class FavIcon extends ConsumerWidget {
//   const FavIcon({super.key, required this.houseId});

//   final String houseId;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return GestureDetector(
//       onTap: () async {
//         // final result =
//         //     await ref.read(userNotifier.notifier).addToFavourites(houseId);
//         // result.fold((left) => context.showSnackBar(left.message),
//         //     (right) => context.showSnackBar(right.message));
//       },
//       child: const Card(
//         elevation: 5.0,
//         color: Colors.white,
//         shape: CircleBorder(),
//         child: Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Icon(
//             Icons.favorite_outline_rounded,
//             color: Colors.black,
//             size: 20,
//           ),
//         ),
//       ),
//     );
//   }
// }

// class IconCard extends StatelessWidget {
//   const IconCard({super.key, required this.icon});

//   final IconData icon;

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       elevation: 5.0,
//       color: Colors.white,
//       shape: const CircleBorder(),
//       child: Padding(
//         padding: AppPaddings.tiny,
//         child: Icon(
//           icon,
//           color: Colors.black,
//           size: 20,
//         ),
//       ),
//     );
//   }
// }
