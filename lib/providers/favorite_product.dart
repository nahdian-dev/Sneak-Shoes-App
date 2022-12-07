import 'package:flutter/material.dart';

class Favoriteproduct with ChangeNotifier {
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
}
