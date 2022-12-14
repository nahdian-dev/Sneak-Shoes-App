import 'package:flutter/material.dart';

import '../resources/colors_manager.dart';
import '../routes/routes_manager.dart';
import '../views/home/component/filter_content.dart';
import 'custom_animated_icon.dart';

class BaseAppBar {
  static baseAppBar(BuildContext context, GlobalKey<ScaffoldState> _scaffoldKey,
      bool drawer, bool favorite, bool cart) {
    return AppBar(
      elevation: 0,
      leading: (drawer == true)
          ? CustomAnimatedIcon(
              globalKey: _scaffoldKey,
            )
          : IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: ColorManager.dark),
            ),
      actions: <Widget>[
        // Search Button
        IconButton(
          icon: Icon(Icons.search),
          color: ColorManager.dark,
          onPressed: () {},
        ),

        // Filter
        IconButton(
          icon: Icon(Icons.tune),
          color: ColorManager.dark,
          onPressed: () {
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              builder: ((context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: FilterMenu(),
                );
              }),
            );
          },
        ),

        // Favorite
        (favorite == true)
            ? IconButton(
                icon: Icon(Icons.favorite_border),
                color: ColorManager.dark,
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.favorite);
                },
              )
            : SizedBox.shrink(),

        // Cart
        (cart == true)
            ? IconButton(
                onPressed: () => Navigator.pushNamed(context, Routes.cart),
                icon: Icon(
                  Icons.shopping_cart,
                  color: ColorManager.dark,
                ),
              )
            : SizedBox.shrink(),
        SizedBox(width: 10),
      ],
    );
  }
}
