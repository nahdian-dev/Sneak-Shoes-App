// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/material.dart';
// import 'package:sneak_shoes_app/controller/product_controller.dart';

// class Carousel extends StatefulWidget {
//   const Carousel({
//     Key key,
//     @required this.productController,
//     @required this.arguments,
//   }) : super(key: key);

//   final ProductController productController;
//   final arguments;

//   @override
//   _CarouselState createState() => _CarouselState();
// }

// class _CarouselState extends State<Carousel> {
//   int _current = 0;
//   List imgList, imageSliders;

//   @override
//   void initState() {
//     super.initState();

//     imgList = [
//       widget.productController.listProduct[widget.arguments].img,
//       widget.productController.listProduct[widget.arguments].img2,
//       widget.productController.listProduct[widget.arguments].img3,
//     ];

//     imageSliders = imgList
//         .map((item) => Image.asset(
//               item,
//               height: 400,
//             ))
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: <Widget>[
//         CarouselSlider(
//           items: imageSliders,
//           options: CarouselOptions(
//             autoPlay: true,
//             enlargeCenterPage: true,
//             aspectRatio: 2.0,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _current = index;
//               });
//             },
//           ),
//         ),
//         SizedBox(height: 10),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: imgList.map((url) {
//             int index = imgList.indexOf(url);
//             return Container(
//                 width: 8.0,
//                 height: 8.0,
//                 margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _current == index
//                       ? Color.fromRGBO(0, 0, 0, 0.9)
//                       : Color.fromRGBO(0, 0, 0, 0.4),
//                 ));
//           }).toList(),
//         ),
//         SizedBox(height: 25),
//       ],
//     );
//   }
// }
