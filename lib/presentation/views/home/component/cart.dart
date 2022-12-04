// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sneak_shoes_app/controller/product_controller.dart';
// import 'package:sneak_shoes_app/view/home/component/custom_bottom_sheet.dart';
// import 'package:sneak_shoes_app/presentation/widgets/custom_animated_icon.dart';

// import '../../../immutable.dart';
// import 'drawer_menu.dart';

// class Cart extends StatelessWidget {
//   final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: buildAppBar(context),
//       body: Scaffold(
//         key: _scaffoldKey,
//         drawer: DrawerMenu(),
//         body: CartContent(),
//         bottomNavigationBar: SizedBox(
//           height: 120,
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Total",
//                       style: getSecondaryFont(
//                         color: Colors.grey,
//                       ),
//                     ),
//                     Text(
//                       "\$ 508.00",
//                       style: getPrimaryFont(),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 10),
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.all(15),
//                 margin: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                   color: Colors.black,
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//                 child: Center(
//                   child: Text(
//                     "Checkout",
//                     style: getPrimaryFont(
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   //appBar method
//   AppBar buildAppBar(BuildContext context) {
//     return AppBar(
//       leading: CustomAnimatedIcon(
//         globalKey: _scaffoldKey,
//       ),
//       actions: <Widget>[
//         IconButton(
//           icon: Icon(Icons.search),
//           color: blackColor,
//           onPressed: () {},
//         ),
//         IconButton(
//           icon: Icon(Icons.tune),
//           color: blackColor,
//           onPressed: () {
//             showModalBottomSheet(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//               isScrollControlled: true,
//               backgroundColor: primaryColor,
//               context: context,
//               builder: (BuildContext context) {
//                 return CustomBottomSheet();
//               },
//             );
//           },
//         ),
//         FloatingActionButton(
//           backgroundColor: blackColor,
//           elevation: 0,
//           mini: true,
//           onPressed: () {},
//           child: Center(
//             child: Text(
//               "3",
//               style: getPrimaryFont(
//                 color: Colors.white,
//               ),
//             ),
//           ),
//         ),
//         SizedBox(
//           width: 10,
//         ),
//       ],
//     );
//   }
// }

// class CartContent extends StatelessWidget {
//   final ProductController productController = Get.put(ProductController());

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Container(
//           margin: EdgeInsets.symmetric(horizontal: 20),
//           child: Text(
//             "My Bag",
//             style: getPrimaryFont(
//               fontSize: 30,
//             ),
//           ),
//         ),
//         Expanded(
//           child: ListView.builder(
//             physics: BouncingScrollPhysics(),
//             itemCount: 4,
//             itemBuilder: (context, index) => InkWell(
//               onTap: () {},
//               child: Container(
//                 margin: EdgeInsets.all(20),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 120,
//                       height: 70,
//                       padding: EdgeInsets.all(14),
//                       decoration: BoxDecoration(
//                         color: Colors.grey.withOpacity(0.2),
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       child: Image.asset(
//                         productController.listProduct[index].img,
//                       ),
//                     ),
//                     SizedBox(
//                       width: 20,
//                     ),
//                     Flexible(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             productController.listProduct[index].title,
//                             style: getPrimaryFont(),
//                           ),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "\$ ${productController.listProduct[index].price.toStringAsFixed(2)}",
//                                 style: getSecondaryFont(),
//                               ),
//                               Text(
//                                 "x1",
//                                 style: getSecondaryFont(
//                                   color: Colors.grey,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
