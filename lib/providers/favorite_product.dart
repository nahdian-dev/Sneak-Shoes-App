import 'package:flutter/cupertino.dart';

class Favoriteproduct with ChangeNotifier {
  List<int> _favoriteProduct;
  List<int> get favoriteProduct => _favoriteProduct;

  void addToFavoriteList(int id) {
    if (!_favoriteProduct.contains(id)) {
      _favoriteProduct.add(id);
    } else {
      _favoriteProduct.remove(id);
    }
    notifyListeners();
  }
}
