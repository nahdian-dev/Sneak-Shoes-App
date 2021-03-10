import 'package:get/get.dart';
import 'package:sneak_shoes_app/models/product_model.dart';

class ProductController extends GetxController {
  List<ProductModel> listProduct = [
    ProductModel(
      img: 'assets/shoes_img/adidas_ultrabost_20/1.jpg',
      img2: 'assets/shoes_img/adidas_ultrabost_20/2.jpg',
      img3: 'assets/shoes_img/adidas_ultrabost_20/3.jpg',
      logo: 'assets/brand_logo/adidas.png',
      title: "Adidas Ultraboost 20",
      price: 240.00,
    ),
    ProductModel(
      img: 'assets/shoes_img/adidas_yeezy_boost_350/1.png',
      img2: 'assets/shoes_img/adidas_yeezy_boost_350/2.png',
      img3: 'assets/shoes_img/adidas_yeezy_boost_350/3.png',
      logo: 'assets/brand_logo/adidas.png',
      title: "Adidas Yeezy Boost 350",
      price: 190.00,
    ),
    ProductModel(
      img: 'assets/shoes_img/new_balance_997/1.png',
      img2: 'assets/shoes_img/new_balance_997/2.png',
      img3: 'assets/shoes_img/new_balance_997/3.png',
      logo: 'assets/brand_logo/new_balance.png',
      title: "New Balance 997",
      price: 210.00,
    ),
    ProductModel(
      img: 'assets/shoes_img/new_balance_1500/1.png',
      img2: 'assets/shoes_img/new_balance_1500/2.png',
      img3: 'assets/shoes_img/new_balance_1500/3.jpg',
      logo: 'assets/brand_logo/new_balance.png',
      title: "New Balance 1500",
      price: 250.00,
    ),
    ProductModel(
      img: 'assets/shoes_img/nike_air_max_270/1.png',
      img2: 'assets/shoes_img/nike_air_max_270/2.png',
      img3: 'assets/shoes_img/nike_air_max_270/3.png',
      logo: 'assets/brand_logo/nike.png',
      title: "Nike Air Max 270",
      price: 220.00,
    ),
    ProductModel(
      img: 'assets/shoes_img/nike_air_max_720/1.png',
      img2: 'assets/shoes_img/nike_air_max_720/2.png',
      img3: 'assets/shoes_img/nike_air_max_720/3.png',
      logo: 'assets/brand_logo/nike.png',
      title: "Nike Air Max 720",
      price: 270.00,
    ),
  ].obs;
}
