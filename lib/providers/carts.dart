import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

import 'package:sneak_shoes_app/presentation/routes/routes_manager.dart';
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

    if (getCart(id) != null) {
      getCart(id).quantity += qty;
    } else {
      _listCart.add(data);
    }

    ScaffoldMessenger.of(context)
      ..showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: AwesomeSnackbarContent(
            title: 'Success add to Cart!',
            message: '${getById(data.id).title} success add to Cart',
            contentType: ContentType.success,
          ),
        ),
      );

    Navigator.pushReplacementNamed(context, Routes.cart);

    notifyListeners();
  }

  void removeCart(BuildContext context) {
    int _getId = getCart(_listCart[_selectedCart].id).id;

    ScaffoldMessenger.of(context)
      ..showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: AwesomeSnackbarContent(
            title: 'Success remove!',
            message: '${getById(_getId).title} success remove from Cart',
            contentType: ContentType.failure,
          ),
        ),
      );
    _listCart.removeAt(_selectedCart);

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

  int addQuantity(BuildContext context, int qty) {
    int output;

    output = _listCart[_selectedCart].quantity = qty;

    ScaffoldMessenger.of(context)
      ..showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: AwesomeSnackbarContent(
            title: 'Success Change Quantity!',
            message: 'Succes change quantity to ${output.toString()} ',
            contentType: ContentType.success,
          ),
        ),
      );

    return output;
  }
}
