import 'package:flutter/material.dart';

class Checkouts with ChangeNotifier {
  // SHIPPING
  final TextEditingController firstName = new TextEditingController();
  final TextEditingController lastName = new TextEditingController();
  final TextEditingController phoneNumber = new TextEditingController();
  final TextEditingController address = new TextEditingController();
  final TextEditingController zip = new TextEditingController();
  final TextEditingController city = new TextEditingController();

  Map<String, String> _shipping = {};
  Map<String, String> get shipping => _shipping;

  void addShipping(BuildContext context) {
    _shipping.addAll({
      'firstName': firstName.text,
      'lastName': lastName.text,
      'phoneNumber': phoneNumber.text,
      'address': address.text,
      'zip': zip.text,
      'city': city.text,
    });

    Navigator.pop(context);

    notifyListeners();
  }

  // PAYMENT
  final TextEditingController payment = new TextEditingController();

  String _cardNumber;
  String get cardNumber => _cardNumber;

  set cardNumber(String number) {
    _cardNumber = number;
    notifyListeners();
  }

  String _onChanged = '';

  set onChanged(String value) {
    _onChanged = value;
    notifyListeners();
  }

  Image getLogoPayment() {
    Image _image;

    if (_onChanged.length != 0) {
      if (_onChanged.startsWith('5')) {
        _image = Image.asset(
          'assets/payment_method/visa.png',
          height: 40,
          width: 40,
        );
      } else if (_onChanged.startsWith('3')) {
        _image = Image.asset(
          'assets/payment_method/mastercard.png',
          height: 40,
          width: 40,
        );
      } else {
        _image = Image.asset(
          'assets/payment_icon.png',
          height: 40,
          width: 40,
        );
      }
    } else {
      _image = Image.asset(
        'assets/payment_icon.png',
        height: 40,
        width: 40,
      );
    }

    return _image;
  }
}
