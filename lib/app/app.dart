import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/routes/routes_generator.dart';
import 'package:sneak_shoes_app/providers/carts.dart';
import 'package:sneak_shoes_app/providers/checkout.dart';
import 'package:sneak_shoes_app/providers/favorite_product.dart';
import '../presentation/resources/themes_manager.dart';
import '../presentation/views/home/home.dart';
import '../providers/products.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteProduct(),
        ),
        ChangeNotifierProvider(
          create: (context) => Carts(),
        ),
        ChangeNotifierProvider(
          create: (context) => Checkouts(),
        ),
      ],
      child: MaterialApp(
        title: 'Sneak Shoes App',
        debugShowCheckedModeBanner: false,
        theme: getApplicationTheme(),
        onGenerateRoute: RouteGenerator.getRoute,
        home: Home(),
      ),
    );
  }
}
