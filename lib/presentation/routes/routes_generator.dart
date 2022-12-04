import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/views/product_detail/product_detail.dart';

import '../views/home/home.dart';
import '../../presentation/resources/strings_manager.dart';
import 'routes_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => Home());
      case Routes.productDetailRoute:
        return MaterialPageRoute(builder: (_) => ProductDetail());
      // case Routes.cartRoute:
      //   return MaterialPageRoute(builder: (_) => Cart());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(
          title: const Text(AppString.noRouteFound),
        ),
        body: const Center(child: Text(AppString.noRouteFound)),
      ),
    );
  }
}
