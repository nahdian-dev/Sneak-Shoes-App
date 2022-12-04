import 'package:flutter/material.dart';

import '../../resources/styles_manager.dart';
import '../../routes/routes_manager.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/widgets/custom_animated_icon.dart';

import 'component/drawer_menu.dart';
import 'component/filter_content.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: CustomAnimatedIcon(
          globalKey: _scaffoldKey,
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
                    child: FilterContent(),
                  );
                }),
              );
            },
          ),

          // Button
          FloatingActionButton(
            backgroundColor: ColorManager.dark,
            elevation: 0,
            mini: true,
            onPressed: () {
              Navigator.pushNamed(context, Routes.productDetailRoute);
            },
            child: Center(
              child: Text(
                "3",
                style: getRegularStyle(),
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
        // body: Content(),
      ),
    );
  }
}
