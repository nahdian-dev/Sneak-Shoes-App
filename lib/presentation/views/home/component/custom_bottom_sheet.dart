// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sneak_shoes_app/controller/selected_index.dart';
// import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';

// class CustomBottomSheet extends StatelessWidget {
//   final SelectedGender selectedGender = Get.put(SelectedGender());
//   final SelectedBrand selectedBrand = Get.put(SelectedBrand());
//   final SelectedColor selectedColor = Get.put(SelectedColor());
//   final SelectedPrice selectedPrice = Get.put(SelectedPrice());

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: <Widget>[
//           //Strip on top
//           Align(
//             alignment: Alignment.topCenter,
//             child: Container(
//               margin: EdgeInsets.symmetric(vertical: 20.0),
//               width: 50,
//               height: 5,
//               decoration: BoxDecoration(
//                 color: Colors.blueGrey,
//                 borderRadius: BorderRadius.circular(20),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),

//           //Title
//           Text(
//             "Filters",
//             style: TextStyle(
//               fontFamily: "Averta",
//               fontSize: 50,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//           SizedBox(
//             height: 40,
//           ),

//           //Select Gender
//           Column(
//             children: <Widget>[
//               Text(
//                 "Gender",
//                 style: TextStyle(
//                   fontFamily: "Averta",
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   for (var i = 0; i < selectedGender.listGender.length; i++)
//                     GetBuilder<SelectedGender>(
//                       init: SelectedGender(),
//                       builder: (builder) {
//                         return GestureDetector(
//                           onTap: () {
//                             builder.onTapItem = i.obs;
//                           },
//                           child: Container(
//                             width: 130,
//                             padding: EdgeInsets.symmetric(vertical: 5),
//                             margin: EdgeInsets.all(10),
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color: (builder.selectedIndex.value == i)
//                                     ? ColorManager.darkPrimary
//                                     : ColorManager.grey,
//                                 width: 1.5,
//                               ),
//                               borderRadius: BorderRadius.circular(10),
//                               color: Color.fromARGB(0, 23, 2, 2),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 builder.listGender[i].toString(),
//                                 style: TextStyle(
//                                   color: (builder.selectedIndex.value == i)
//                                       ? ColorManager.darkPrimary
//                                       : ColorManager.grey,
//                                   fontFamily: "Averta",
//                                   fontSize: 17,
//                                   fontWeight: FontWeight.w600,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                 ],
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 30,
//           ),

//           //Slider on Price
//           Column(
//             children: <Widget>[
//               Text(
//                 "Price",
//                 style: TextStyle(
//                   fontFamily: "Averta",
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               GetBuilder<SelectedPrice>(
//                   init: SelectedPrice(),
//                   builder: (builder) => RangeSlider(
//                         min: 0,
//                         max: 500,
//                         divisions: 5,
//                         values: builder.currentRange.value,
//                         activeColor: ColorManager.darkPrimary,
//                         // labels: RangeLabels(
//                         //   selectedPrice.currentRange.value.toString(),
//                         //   // selectedPrice.currentRange.end.round().toString(),
//                         // ),
//                         onChanged: (rangeValues) {
//                           builder.currentRange.value = rangeValues;
//                         },
//                       ))
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),

//           //List of Brands
//           Column(
//             children: <Widget>[
//               Text(
//                 "Brand",
//                 style: TextStyle(
//                   fontFamily: "Averta",
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(
//                 height: 60,
//                 child: GetBuilder<SelectedBrand>(builder: (builder) {
//                   return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     primary: false,
//                     shrinkWrap: true,
//                     physics: BouncingScrollPhysics(),
//                     itemCount: selectedBrand.listBrand.length,
//                     itemBuilder: (context, index) {
//                       return GestureDetector(
//                         onTap: () {},
//                         child: Container(
//                           width: 60.0,
//                           margin: const EdgeInsets.symmetric(horizontal: 10.0),
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             // border: Border.all(
//                             //   color: (builder.listBrand[index])
//                             //       ? ColorManager.grey
//                             //       : ColorManager.darkPrimary,
//                             //   width: 1.5,
//                             // ),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(10.0),
//                             child: Image.asset(
//                               builder.listBrand[index],
//                               fit: BoxFit.contain,
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   );
//                 }),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),

//           //List of Colors
//           Column(
//             children: <Widget>[
//               Text(
//                 "Color",
//                 style: TextStyle(
//                   fontFamily: "Averta",
//                   fontSize: 20,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//               SizedBox(
//                 height: 40,
//                 child: GetBuilder<SelectedColor>(builder: (builder) {
//                   return ListView.builder(
//                     scrollDirection: Axis.horizontal,
//                     itemCount: selectedColor.listColor.length,
//                     itemBuilder: (context, index) {
//                       return Row(
//                         children: [
//                           SizedBox(width: 20),
//                           GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 color: builder.listColor[index],
//                               ),
//                             ),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 }),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 20,
//           ),
//         ],
//       ),
//     );
//   }
// }
