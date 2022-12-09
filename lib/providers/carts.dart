import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/models/cart.dart';
import 'package:sneak_shoes_app/providers/products.dart';

class Carts extends Products {
  List<Cart> _listCart = [];
  List<Cart> get listCart => _listCart;

  void addToCart(BuildContext context, int id, int qty) {
    var data = Cart(id: id, quantity: qty);

    try {
      if (getCart(id) != null) {
        getCart(id).quantity += qty;
      } else {
        _listCart.add(data);
      }

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Berhasil tambah ke Cart')));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Gagal menambahkan ke Cart')));
    }

    notifyListeners();
  }

  void removeCart(int id, BuildContext context) {
    int _cartId = getCart(id).id;

    _listCart.remove(_cartId);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        duration: Duration(milliseconds: 500),
        content: Text('Berhasil hapus ke Favorite')));

    notifyListeners();
  }

  Cart getCart(int id) {
    Cart _cart;

    _cart =
        _listCart.firstWhere((element) => element.id == id, orElse: () => null);

    return _cart;
  }

  double countPrice() {
    double price = 0;

    _listCart.forEach((element) {
      price += element.quantity * getById(element.id).price;
    });

    return price;
  }
}
