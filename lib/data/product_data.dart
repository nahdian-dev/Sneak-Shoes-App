import 'package:flutter/cupertino.dart';
import 'package:sneak_shoes_app/models/product.dart';

class ProductData with ChangeNotifier {
  static List<Product> listProduct = [
    Product(
      id: 1,
      title: "Adidas Ultraboost 20",
      price: 240.00,
      quantity: 20,
      description:
          'Memiliki inovasi terbaru yaitu Pulseboost HD, yang digunakan untuk lari, agar lebih nyaman. Dengan kualitas premium, Adidas mengutamakan kenyamanan, ketahanan dan kekuatan sepatunya.',
      size: [38, 39, 40],
      logo: 'assets/brand_logo/adidas.png',
      images: [
        'assets/shoes_img/adidas_ultrabost_20/1.jpg',
        'assets/shoes_img/adidas_ultrabost_20/2.jpg',
        'assets/shoes_img/adidas_ultrabost_20/3.jpg',
      ],
    ),
    Product(
      id: 2,
      title: "Adidas Yeezy Boost 350",
      price: 190.00,
      quantity: 18,
      description:
          'Memiliki inovasi terbaru yaitu Pulseboost HD, yang digunakan untuk lari, agar lebih nyaman. Dengan kualitas premium, Adidas mengutamakan kenyamanan, ketahanan dan kekuatan sepatunya.',
      size: [38, 39, 40],
      logo: 'assets/brand_logo/adidas.png',
      images: [
        'assets/shoes_img/adidas_yeezy_boost_350/1.png',
        'assets/shoes_img/adidas_yeezy_boost_350/2.png',
        'assets/shoes_img/adidas_yeezy_boost_350/3.png',
      ],
    ),
    Product(
      id: 3,
      title: "New Balance 997",
      price: 210.00,
      quantity: 10,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [39, 40, 41, 42],
      logo: 'assets/brand_logo/new_balance.png',
      images: [
        'assets/shoes_img/new_balance_997/1.png',
        'assets/shoes_img/new_balance_997/2.png',
        'assets/shoes_img/new_balance_997/3.png',
      ],
    ),
    Product(
      id: 4,
      title: "New Balance 1500",
      price: 250.00,
      quantity: 10,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [39, 40, 41, 42],
      logo: 'assets/brand_logo/new_balance.png',
      images: [
        'assets/shoes_img/new_balance_1500/1.png',
        'assets/shoes_img/new_balance_1500/2.png',
        'assets/shoes_img/new_balance_1500/3.jpg',
      ],
    ),
    Product(
      id: 5,
      title: "Nike Air Max 270",
      price: 220.00,
      quantity: 10,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [39, 40, 41, 42],
      logo: 'assets/brand_logo/nike.png',
      images: [
        'assets/shoes_img/nike_air_max_270/1.png',
        'assets/shoes_img/nike_air_max_270/2.png',
        'assets/shoes_img/nike_air_max_270/3.png',
      ],
    ),
    Product(
      id: 6,
      title: "Nike Air Max 720",
      price: 270.00,
      quantity: 15,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [39, 40, 41, 42],
      logo: 'assets/brand_logo/nike.png',
      images: [
        'assets/shoes_img/nike_air_max_720/1.png',
        'assets/shoes_img/nike_air_max_720/2.png',
        'assets/shoes_img/nike_air_max_720/3.png',
      ],
    ),
  ];
}
