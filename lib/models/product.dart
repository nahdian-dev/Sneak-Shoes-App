import 'package:flutter/material.dart';

class Product {
  final int id;
  final String title;
  final double price;
  final int quantity;
  final String description;
  final List<int> size;
  final String logo;
  final String img;
  final String img2;
  final String img3;

  Product({
    @required this.id,
    @required this.title,
    @required this.price,
    this.quantity,
    this.description,
    this.size,
    this.logo,
    this.img,
    this.img2,
    this.img3,
  });
}
