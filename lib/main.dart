import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneak_shoes_app/view/home/component/cart.dart';
import './immutable.dart';

import 'view/home/home.dart';
import 'view/product_detail/product_detail.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sneak Shoes App',
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/product-detail', page: () => ProductDetail()),
        GetPage(name: '/cart', page: () => Cart()),
      ],
      theme: ThemeData(
        scaffoldBackgroundColor: primaryColor,
        appBarTheme: AppBarTheme(
          color: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: Home(),
    );
  }
}
