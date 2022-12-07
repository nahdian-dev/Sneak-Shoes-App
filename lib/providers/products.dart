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
}
