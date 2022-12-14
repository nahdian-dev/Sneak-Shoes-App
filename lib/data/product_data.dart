import 'package:flutter/cupertino.dart';
import 'package:sneak_shoes_app/models/product.dart';

class ProductData with ChangeNotifier {
  static List<Product> listProduct = [
    Product(
      id: 1,
      title: "Adidas Ultraboost 4.0",
      price: 1820000,
      quantity: 18,
      description:
          'The Adidas Ultraboost shoe is the worlds first 3D knit running shoe, designed to enhance performance in running motion and put you.',
      size: [38, 39, 40, 41, 42],
      logo: 'assets/brand_logo/adidas.png',
      images: [
        'assets/shoes_images/adidas_ultraboost_4.0/1.png',
        'assets/shoes_images/adidas_ultraboost_4.0/2.png',
        'assets/shoes_images/adidas_ultraboost_4.0/3.png',
      ],
    ),
    Product(
      id: 2,
      title: "Adidas Ultraboost 20",
      price: 1500000,
      quantity: 20,
      description:
          'The Adidas Ultraboost shoe is the worlds first 3D knit running shoe, designed to enhance performance in running motion and put you.',
      size: [38, 39, 40, 41, 42],
      logo: 'assets/brand_logo/adidas.png',
      images: [
        'assets/shoes_images/adidas_ultraboost_20/1.png',
        'assets/shoes_images/adidas_ultraboost_20/2.png',
        'assets/shoes_images/adidas_ultraboost_20/3.png',
      ],
    ),
    Product(
      id: 3,
      title: "New Balance 997",
      price: 1200000,
      quantity: 10,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [39, 40, 41, 42],
      logo: 'assets/brand_logo/new_balance.png',
      images: [
        'assets/shoes_images/new_balance_997/1.png',
        'assets/shoes_images/new_balance_997/2.png',
        'assets/shoes_images/new_balance_997/3.png',
      ],
    ),
    Product(
      id: 4,
      title: "New Balance 1500",
      price: 1400000,
      quantity: 10,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [39, 40, 41, 42],
      logo: 'assets/brand_logo/new_balance.png',
      images: [
        'assets/shoes_images/new_balance_1500/1.png',
        'assets/shoes_images/new_balance_1500/2.png',
        'assets/shoes_images/new_balance_1500/3.png',
      ],
    ),
    Product(
      id: 5,
      title: "Nike Air Max 95",
      price: 900000,
      quantity: 24,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [38, 39, 40, 41, 42],
      logo: 'assets/brand_logo/nike.png',
      images: [
        'assets/shoes_images/nike_air_max_95/1.png',
        'assets/shoes_images/nike_air_max_95/2.png',
        'assets/shoes_images/nike_air_max_95/3.png',
      ],
    ),
    Product(
      id: 6,
      title: "Nike Air Max 270",
      price: 1500000,
      quantity: 16,
      description:
          'Tackle your workouts with confidence in performance running shoes and stylish clothes from New Balance. Our athletic footwear goes the distance with you.',
      size: [38, 39, 40, 41, 42],
      logo: 'assets/brand_logo/nike.png',
      images: [
        'assets/shoes_images/nike_air_max_270/1.png',
        'assets/shoes_images/nike_air_max_270/2.png',
        'assets/shoes_images/nike_air_max_270/3.png',
      ],
    ),
    Product(
      id: 7,
      title: "Umbro Men's Neptune Sneaker",
      price: 800000,
      quantity: 16,
      description:
          'Perhaps the closest to its original silhouette, the NEPTUNE features a nostalgic speed lacing system and mesh panels as well as a heavy logo presence which includes an oversized black Umbro double diamond on the white outsole, brand logo across the side of the upper and an embroidered white logo on the tongue.',
      size: [38, 39, 40, 41, 42],
      logo: 'assets/brand_logo/umbro.png',
      images: [
        'assets/shoes_images/umbro_neptune/1.png',
        'assets/shoes_images/umbro_neptune/2.png',
        'assets/shoes_images/umbro_neptune/3.png',
      ],
    ),
  ];
}
