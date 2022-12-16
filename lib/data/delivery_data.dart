import 'package:sneak_shoes_app/models/delivery.dart';

class DeliveryData {
  static List<Delivery> deliveryData = [
    Delivery(
      id: 1,
      name: 'Regular',
      cost: 9000,
    ),
    Delivery(
      id: 2,
      name: 'Express',
      cost: 15000,
    ),
    Delivery(
      id: 3,
      name: 'Same Day',
      cost: 22000,
    ),
  ];
}
