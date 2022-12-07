import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/data/product_data.dart';
import 'package:sneak_shoes_app/models/product.dart';

class FavoriteProduct with ChangeNotifier {
  List<Product> _listProduct = ProductData.listProduct;

  List<int> _favoriteProduct = [];
  List<int> get favoriteProduct => _favoriteProduct;

  void addToFavoriteList(int id, BuildContext context) {
    if (!_favoriteProduct.contains(id)) {
      _favoriteProduct.add(id);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Berhasil tambah ke Favorite')));
    } else {
      _favoriteProduct.remove(id);

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Berhasil hapus ke Favorite')));
    }
    notifyListeners();
  }

  Product getFavorite(int id) {
    Product _favorite;

    if (_favoriteProduct.contains(id)) {
      _favorite = _listProduct.firstWhere((element) => element.id == id);
    }

    return _favorite;
  }

  void removeFavorite(int id, BuildContext context) {
    _favoriteProduct.remove(id);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Berhasil hapus ke Favorite')));

    notifyListeners();
  }
}
