import 'package:sneak_shoes_app/models/payment_method.dart';

class PaymentMethodData {
  static List<PaymentMethod> paymentMethodData = [
    PaymentMethod(
      id: 1,
      name: 'Mastercard',
      logo: 'assets/payment_method/mastercard.png',
    ),
    PaymentMethod(
      id: 2,
      name: 'Visa',
      logo: 'assets/payment_method/visa.png',
    ),
  ];
}
