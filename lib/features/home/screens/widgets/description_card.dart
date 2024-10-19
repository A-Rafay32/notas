// import 'package:flutter/material.dart';
// import 'package:notas/features/home/models/house.dart';

// class DescriptionCard extends StatefulWidget {
//   const DescriptionCard({
//     super.key,
//     required this.house,
//   });

//   final House house;

//   @override
//   State<DescriptionCard> createState() => _DescriptionCardState();
// }

// class _DescriptionCardState extends State<DescriptionCard> {
//   final TextEditingController _controller = TextEditingController();
//   String newDescription = '';

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   void initState() {
//     _controller.text = widget.house.description;
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text("Description",
//             style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                   fontWeight: FontWeight.w600,
//                   fontSize: 18,
//                   fontFamily: "Raleway",
//                 )),
//         const SizedBox(height: 5),
//         Text(
//           "${widget.house.description} ",
//           style: Theme.of(context).textTheme.labelLarge?.copyWith(
//               fontFamily: "Raleway",
//               color: Colors.grey,
//               fontSize: 15,
//               fontWeight: FontWeight.w600),
//         ),
//       ],
//     );
//   }
// }
