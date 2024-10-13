// import 'package:ez_homes/data/database_service/user_database.dart';
// import 'package:flutter/material.dart';

// import '../../../model/user.dart';
// import '../../../data/database_service/house_database.dart';

// class RenewHouseCard extends StatelessWidget {
//   const RenewHouseCard({
//     super.key,
//     required this.h,
//     required this.w,
//     required this.text,
//     required this.price,
//     required this.imageUrl,
//     required this.onTap,
//     required this.onDelete,
//   });

//   final double h;
//   final double w;
//   final String text;
//   final String imageUrl;
//   final int price;
//   final void Function() onTap;
//   final void Function() onDelete;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         onTap: onTap,
//         child: Container(
//           height: h * 0.13,
//           width: w,
//           margin: const EdgeInsets.only(bottom: 15, left: 5, right: 5),
//           padding: const EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 0),
//           decoration: BoxDecoration(
//               color: Colors.grey.shade100,
//               borderRadius: BorderRadius.circular(20)),
//           child: Row(
//             children: [
//               Container(
//                 height: 100,
//                 width: 80,
//                 padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(15),
//                   child: Image.network(
//                     imageUrl,
//                     fit: BoxFit.cover,
//                   ),
//                 ),
//               ),
//               Container(
//                 width: w * 0.6,
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: h * 0.05,
//                       child: Row(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "$text Repair",
//                               style: const TextStyle(
//                                   fontFamily: "Raleway",
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           const Spacer(),
//                           if (UserDBHelper.userData?.usertype == UserType.admin)
//                             IconButton(
//                                 onPressed: onDelete,
//                                 icon: const Icon(Icons.delete_outline_rounded))
//                         ],
//                       ),
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         "\$ $price",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontFamily: "Raleway",
//                             fontSize: 17,
//                             color: Colors.blue.shade800),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
