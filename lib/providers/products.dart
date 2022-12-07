import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/data/product_data.dart';
import 'package:sneak_shoes_app/models/product.dart';

class Products with ChangeNotifier {
  List<Product> _productData = ProductData.listProduct;

  List<Product> get productData {
    return _productData;
  }
}
