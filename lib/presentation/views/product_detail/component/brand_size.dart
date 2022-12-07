// import 'package:flutter/material.dart';

// import '../../immutable.dart';

// class BrandSize extends StatefulWidget {
//   @override
//   _BrandSizeState createState() => _BrandSizeState();
// }

// class _BrandSizeState extends State<BrandSize> {
//   int _selectedIndex = 0;

//   List sizeItem = [
//     '40',
//     '41',
//     '42',
//     '45',
//     '46',
//     '47',
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 "Size",
//                 style: getPrimaryFont(),
//               ),
//               Text(
//                 "Size Guide",
//                 style: getPrimaryFont(),
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20,
//         ),

//         //brand
//         SizedBox(
//           height: 60,
//           child: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             scrollDirection: Axis.horizontal,
//             itemCount: sizeItem.length,
//             itemBuilder: (context, index) => GestureDetector(
//               onTap: () {
//                 setState(() {
//                   _selectedIndex = index;
//                 });
//               },
//               child: Container(
//                 margin: EdgeInsets.only(left: 20),
//                 width: 60,
//                 decoration: BoxDecoration(
//                   color:
//                       (index == _selectedIndex) ? blackColor : secondaryColor,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: Center(
//                   child: Text(
//                     sizeItem[index],
//                     style: getPrimaryFont(
//                       color: (index == _selectedIndex)
//                           ? secondaryColor
//                           : blackColor,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
