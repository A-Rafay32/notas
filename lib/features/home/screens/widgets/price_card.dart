// import 'package:flutter/material.dart';
// import 'package:notas/features/home/models/rental_house.dart';

// class PriceCard extends StatefulWidget {
//   const PriceCard({
//     super.key,
//     required this.house,
//   });

//   final RentalHouse house;

//   @override
//   State<PriceCard> createState() => _PriceCardState();
// }

// class _PriceCardState extends State<PriceCard> {
//   String newPrice = "";
//   final TextEditingController _controller = TextEditingController();

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//         child: Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         "${widget.house.rentPerMonth} USD Per Month ",
//         style: const TextStyle(
//             fontFamily: "Raleway", fontSize: 21, fontWeight: FontWeight.w600),
//       ),
//     ));
//   }
// }
