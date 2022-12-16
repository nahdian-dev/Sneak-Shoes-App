import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/models/coupons.dart';

class CouponsData {
  static List<Coupons> couponsData = [
    Coupons(
      id: 1,
      code: 'FQT431QW',
      discount: 50,
      expired: DateTime(2023, 4, 1),
      color: Colors.green,
    ),
    Coupons(
      id: 2,
      code: 'FPQ998QI',
      discount: 30,
      expired: DateTime(2022, 4, 1),
      color: Colors.green,
    ),
    Coupons(
      id: 3,
      code: 'NIO990GH',
      discount: 70,
      expired: DateTime(2022, 4, 1),
      color: Colors.blue,
    ),
    Coupons(
      id: 4,
      code: 'NGH655PO',
      discount: 30,
      expired: DateTime(2023, 1, 15),
      color: Colors.blue,
    ),
  ];
}
