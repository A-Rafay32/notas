// import 'package:flutter/material.dart';
// import 'package:notas/features/home/models/house.dart';

// import '../../features/home/screens/house_detail_screen.dart';

// class HouseListCard extends StatefulWidget {
//   const HouseListCard({
//     super.key,
//     required this.house,
//   });
//   final House house;

//   @override
//   State<HouseListCard> createState() => _HouseListCardState();
// }

// class _HouseListCardState extends State<HouseListCard> {
//   @override
//   void initState() {
//     UserDBHelper.getUserInfo();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.sizeOf(context).height;
//     double w = MediaQuery.sizeOf(context).width;

//     return GestureDetector(
//       onTap: () {
//         Provider.of<Auth>(context, listen: false).isLoggedIn == true
//             ? Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => HouseDetailScreen(house: widget.house),
//                 ))
//             : LoginSheet.LoginSheetFunction(
//                 context,
//                 // widget.house.housetype
//               );
//       },
//       child: Container(
//         // height: h * 0.15,
//         width: w,
//         margin: const EdgeInsets.only(bottom: 15, left: 10, right: 10),
//         padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10, right: 0),
//         decoration: BoxDecoration(
//             boxShadow: [
//               BoxShadow(
//                   blurRadius: 10,
//                   color: Colors.grey.shade100,
//                   offset: const Offset(10, 10)),
//               BoxShadow(
//                   blurRadius: 10,
//                   color: Colors.grey.shade100,
//                   offset: const Offset(-10, -10))
//             ],
//             color: Colors.grey.shade200,
//             borderRadius: BorderRadius.circular(20)),
//         child: Row(
//           children: [
//             Container(
//               height: 100,
//               width: 100,
//               padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
//               child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.network(
//                     widget.house.images[0],
//                     fit: BoxFit.cover,
//                   )),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         SizedBox(
//                           width: w * 0.35,
//                           child: Text(
//                             widget.house.name,
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: const TextStyle(
//                                 overflow: TextOverflow.ellipsis,
//                                 fontFamily: "Raleway",
//                                 fontSize: 17,
//                                 fontWeight: FontWeight.w600),
//                           ),
//                         ),
//                         const Spacer(),
//                         (widget.house.housetype == houseType.Rented ||
//                                 widget.house.housetype == houseType.Owned)
//                             ? Container(
//                                 padding: EdgeInsets.symmetric(
//                                     vertical: h * 0.008, horizontal: w * 0.03),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   border: Border.all(color: Colors.green),
//                                   borderRadius: BorderRadius.circular(10),
//                                 ),
//                                 child: Center(
//                                   child: Text(
//                                     (widget.house.housetype == houseType.Rented)
//                                         ? "Rented"
//                                         : "Owned ",
//                                     style: TextStyle(
//                                       fontFamily: "Raleway",
//                                       color: Colors.green,
//                                       fontSize: h * 0.02,
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             : Container(),
//                         if (UserDBHelper.userData?.usertype == UserType.admin)
//                           GestureDetector(
//                               onTap: () {
//                                 HouseDBHelper.deleteHouse(widget.house.address);
//                                 context.read<HouseProvider>().refreshHouses();
//                               },
//                               child: Container(
//                                 margin:
//                                     const EdgeInsets.only(left: 3, right: 5),
//                                 child: Icon(
//                                   Icons.delete_outline_rounded,
//                                   size: h * 0.035,
//                                 ),
//                               )),
//                       ],
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         (widget.house.housetype == houseType.forSale ||
//                                 widget.house.housetype == houseType.Owned)
//                             ? "${widget.house.salePrice} USD"
//                             : "${widget.house.pricePerMonth} USD / Month",
//                         style: TextStyle(
//                             fontFamily: "Raleway",
//                             fontSize: 15,
//                             color: Colors.blue.shade800),
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                       children: [
//                         Icon(
//                             color: Colors.grey.shade400,
//                             size: 14,
//                             Icons.bedroom_parent_rounded),
//                         Text(
//                           (widget.house.roomQty <= 1)
//                               ? "${widget.house.roomQty} Room"
//                               : "${widget.house.roomQty} Rooms",
//                           style:
//                               const TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                         const SizedBox(
//                           width: 25,
//                         ),
//                         Icon(
//                             color: Colors.grey.shade400,
//                             size: 14,
//                             Icons.square_foot_rounded),
//                         Text(
//                           "${widget.house.sizeInFeet} square feet",
//                           style:
//                               const TextStyle(fontSize: 14, color: Colors.grey),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
