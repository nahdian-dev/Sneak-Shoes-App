import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sneak_shoes_app/presentation/views/cart/cart.dart';
import 'package:sneak_shoes_app/presentation/views/checkout/checkout.dart';
import 'package:sneak_shoes_app/presentation/views/product_detail/product_detail.dart';

import '../views/favorite/favorite.dart';
import '../views/home/home.dart';
import '../../presentation/resources/strings_manager.dart';
import 'routes_manager.dart';

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.mainRoute:
        return PageTransition(
          child: Home(),
          type: PageTransitionType.bottomToTop,
        );
      case Routes.productDetailRoute:
        return PageTransition(
          settings: RouteSettings(arguments: routeSettings.arguments),
          child: ProductDetail(),
          type: PageTransitionType.rightToLeftPop,
          childCurrent: ProductDetail(),
        );
      case Routes.favorite:
        return PageTransition(
          child: Favorite(),
          type: PageTransitionType.topToBottom,
          childCurrent: Favorite(),
        );
      case Routes.cart:
        return PageTransition(
          child: Cart(),
          type: PageTransitionType.rightToLeftPop,
          childCurrent: Cart(),
        );
      case Routes.checkout:
        return PageTransition(
          child: Checkout(),
          type: PageTransitionType.rightToLeftPop,
          childCurrent: Checkout(),
        );
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
