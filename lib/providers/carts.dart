import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/models/cart.dart';
import 'package:sneak_shoes_app/providers/products.dart';

class Carts extends Products {
  // CART
  List<Cart> _listCart = [];
  List<Cart> get listCart => _listCart;

  // VISIBLE WIDGET
  bool _isVisible = false;
  bool get isVisible => _isVisible;

  set isVisible(bool value) {
    _isVisible = value;
    notifyListeners();
  }

  // SELECT CART
  int _selectedCart;
  int get selectedCart => _selectedCart;

  set selectedCart(int index) {
    _selectedCart = index;
    notifyListeners();
  }

  // CURRENT QUANTITY
  int _currentQuantity;
  int get currentQuantity => _currentQuantity;

  set currentQuantity(int qty) {
    _currentQuantity = qty;
    notifyListeners();
  }

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

  void removeCart(BuildContext context) {
    _listCart.removeAt(_selectedCart);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: MediaQuery.of(context).size.width / 1.5,
        duration: Duration(milliseconds: 500),
        content: Text(
          'Berhasil hapus produk',
          textAlign: TextAlign.center,
        ),
      ),
    );

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

  int addQuantity(int qty) {
    int output;

    output = _listCart[_selectedCart].quantity = qty;

    return output;
  }
}
