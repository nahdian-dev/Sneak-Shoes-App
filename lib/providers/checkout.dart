import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/data/coupons.dart';
import 'package:sneak_shoes_app/data/delivery_data.dart';
import 'package:sneak_shoes_app/models/coupons.dart';
import 'package:sneak_shoes_app/models/delivery.dart';

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

  // DELIVERY
  List<Delivery> _deliveryData = DeliveryData.deliveryData;
  List<Delivery> get deliveryData => _deliveryData;

  int _selectedDelivery;
  int get selectedDelivery => _selectedDelivery;

  set selectedDelivery(int index) {
    _selectedDelivery = index;
    notifyListeners();
  }

  int _deliveryCost = 0;
  int get deliveryCost => _deliveryCost;

  void getDeliveryCost(int id) {
    Delivery _getDelivery =
        _deliveryData.firstWhere((element) => element.id == id);

    _deliveryCost = _getDelivery.cost;
  }

  // COUPONS
  List<Coupons> _couponsData = CouponsData.couponsData;
  List<Coupons> get couponsData => _couponsData;

  String _couponCode = '';
  String get couponCode => _couponCode;

  double _couponDiscount = 0;
  double get couponDiscount => _couponDiscount;

  double totalDiscount = 0;

  void useCoupon(
    BuildContext context,
    bool isExpired,
    String code,
    double discount,
  ) {
    if (!isExpired) {
      _couponCode = code;
      _couponDiscount = discount;
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context)
        ..showSnackBar(
          SnackBar(
            duration: Duration(milliseconds: 500),
            backgroundColor: Colors.transparent,
            content: AwesomeSnackbarContent(
              title: 'Coupons is Expired!',
              message: 'Cannot use this coupon',
              contentType: ContentType.failure,
            ),
          ),
        );
    }
    notifyListeners();
  }

  double countDiscount(double subtotal) {
    double _discount;

    _discount = (_couponDiscount / 100) * subtotal;
    totalDiscount = _discount;

    return _discount;
  }

  double countTotalPay(double subtotal) {
    double _totalPay;

    _totalPay = subtotal + _deliveryCost - totalDiscount;

    return _totalPay;
  }
}
