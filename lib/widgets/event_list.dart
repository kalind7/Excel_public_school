// import 'package:flutter/material.dart';
// import 'package:hexcolor/hexcolor.dart';
//
// Widget EventList ({
//   required String text,
//   required String image,
//   required Function onpress,
// }){
//   return Container(
//     margin: EdgeInsets.symmetric(horizontal: 10.0),
//     decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border.all(color: HexColor("#F4F4F4")),
//         borderRadius: BorderRadius.circular(20.0),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.blueAccent.withOpacity(.06),
//             spreadRadius: 5,
//             blurRadius: 7,
//             offset: Offset(4, 3), // changes position of shadow
//           ),
//         ]),
//     child: Padding(
//       padding: EdgeInsets.all(16.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(30.0),
//             child: Image(
//               image: AssetImage(image),
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(
//             height: 10.0,
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 2.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   text,
//                   style: TextStyle(
//                       fontSize: 20.0,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black),
//                 ),
//                 ElevatedButton(
//                     onPressed: () {onpress();},
//                     style: ElevatedButton.styleFrom(
//                       primary:
//                       Colors.blueAccent, // background
//
//                     ),
//                     child: Text('See More',
//                         style: TextStyle(color: Colors.white))),
//
//               ],
//             ),
//           )
//         ],
//       ),
//     ),
//   );
// }