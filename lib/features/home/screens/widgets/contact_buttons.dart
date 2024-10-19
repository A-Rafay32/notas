// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:notas/features/home/models/house.dart';

// import 'custom_button.dart';

// class ContactButtons extends StatelessWidget {
//   const ContactButtons({
//     super.key,
//     required this.w,
//     required this.h,
//     required this.house,
//   });

//   final double w;
//   final double h;
//   final House house;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             ContactButton(
//                 w: w,
//                 h: h,
//                 icon: const Icon(
//                     size: 25, color: Colors.white, Icons.email_outlined),
//                 onTap: () async {},
//                 title: "Email"),
//             ContactButton(
//                 w: w,
//                 h: h,
//                 icon: const Icon(
//                     size: 25, color: Colors.white, Icons.call_outlined),
//                 onTap: () async {},
//                 title: "Call")
//           ],
//         ),
//       ],
//     );
//   }
// }
