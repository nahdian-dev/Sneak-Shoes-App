import 'package:flutter/animation.dart';

class Coupons {
  final int id;
  final String code;
  final double discount;
  final DateTime expired;
  final Color color;

  Coupons({this.id, this.code, this.discount, this.expired, this.color});
}
