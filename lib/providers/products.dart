import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/data/product_data.dart';
import 'package:sneak_shoes_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _productData = ProductData.listProduct;

  List<Product> get productData {
    return _productData;
  }

  Product getById(int id) {
    Product _product;

    _product = _productData.firstWhere((element) => element.id == id);

    return _product;
  }

  // SELECTED BRAND
  int _selectedbrand;
  int get selectedBrand => _selectedbrand;

  set selectedBrand(int value) {
    _selectedbrand = value;
    notifyListeners();
  }

  void selectedIndex(int index) {
    _selectedbrand = index;
    notifyListeners();
  }

  // IMAGE SLIDER
  int _selectedImage = 0;
  int get selectedImage => _selectedImage;

  set selectedImage(int index) {
    _selectedImage = index;
    notifyListeners();
  }

  List<Widget> _imageSlider;
  List<Widget> get imageSlider => _imageSlider;

  set imagesSlider(List<String> images) {
    _imageSlider = images
        .map((item) => Image.asset(
              item,
              height: 400,
            ))
        .toList();
  }
}
