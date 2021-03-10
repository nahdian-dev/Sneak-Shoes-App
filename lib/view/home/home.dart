import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneak_shoes_app/view/home/component/content.dart';
import 'package:sneak_shoes_app/view/home/component/custom_bottom_sheet.dart';
import 'package:sneak_shoes_app/view/home/component/drawer_menu.dart';
import 'package:sneak_shoes_app/view/widgets/custom_animated_icon.dart';

import '../../immutable.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CustomAnimatedIcon(
          globalKey: _scaffoldKey,
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: blackColor,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.tune),
            color: blackColor,
            onPressed: () {
              Get.bottomSheet(
                CustomBottomSheet(),
                isScrollControlled: true,
              );
            },
          ),
          FloatingActionButton(
            backgroundColor: blackColor,
            elevation: 0,
            mini: true,
            onPressed: () {
              Get.toNamed('/cart');
            },
            child: Center(
              child: Text(
                "3",
                style: getPrimaryFont(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerMenu(),
        body: Content(),
      ),
    );
  }
}
