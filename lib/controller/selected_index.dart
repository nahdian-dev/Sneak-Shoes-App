// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class SelectedIndex extends GetxController {
//   RxInt _selectedIndex = 0.obs;
//   RxInt get selectedIndex => _selectedIndex;

//   RxBool _selectedBrandIndex = false.obs;
//   RxBool get selectedBrandIndex => _selectedBrandIndex;
// }

// class SelectedGender extends SelectedIndex {
//   final List<String> _listGender = ["Man", "Woman"].obs;

//   List<String> get listGender => _listGender;

//   set onTapItem(RxInt value) {
//     _selectedIndex = value;
//     update();
//   }
// }

// class SelectedBrand extends SelectedIndex {
//   final List<String> _listBrand = [
//     "assets/brand_logo/adidas.png",
//     "assets/brand_logo/new_balance.png",
//     "assets/brand_logo/nike.png",
//     "assets/brand_logo/puma.png",
//     "assets/brand_logo/reebook.png",
//     "assets/brand_logo/umbro.png"
//   ].obs;

//   List<String> get listBrand => _listBrand;

//   set onTapItem(RxBool value) {
//     _selectedBrandIndex = value;
//     update();
//   }
// }

// class SelectedColor extends SelectedIndex {
//   final List<Color> _listColor = [
//     Colors.blueAccent,
//     Colors.blueGrey,
//     Colors.black,
//   ];

//   List<Color> get listColor => _listColor;
// }

// class SelectedPrice extends SelectedIndex {
//   final Rx<RangeValues> _currentRange = RangeValues(10, 300).obs;

//   Rx<RangeValues> get currentRange => _currentRange;

//   set currentRange(newValue) {
//     currentRange = newValue;
//   }
// }
