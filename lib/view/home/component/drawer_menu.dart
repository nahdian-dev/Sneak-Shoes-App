import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/size_config.dart';

import '../../../immutable.dart';

class DrawerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      color: primaryColor,
      width: double.infinity,
      child: Drawer(
        elevation: 0.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            drawerListMenu("Home"),
            drawerListMenu("New in"),
            drawerListMenu("Sale"),
            drawerListMenu("Profile"),
            SizedBox(
              height: 10,
            ),
            Container(
              width: (SizeConfig.orientation == Orientation.landscape)
                  ? SizeConfig.screenWidth * 0.9
                  : SizeConfig.screenWidth / 1.2,
              height: (SizeConfig.orientation == Orientation.landscape)
                  ? SizeConfig.defaultSize * 5
                  : SizeConfig.defaultSize * 7,
              margin: EdgeInsets.only(
                left: 20,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: brownColor,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  margin: EdgeInsets.only(right: 50.0),
                  padding: EdgeInsets.only(left: 40.0),
                  child: Text(
                    "Summer Collection",
                    style: TextStyle(
                      fontFamily: 'Averta',
                      fontSize: 17,
                      color: primaryColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding drawerListMenu(String nama) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
      child: Text(
        nama,
        style: getPrimaryFont(
          fontSize: (SizeConfig.orientation == Orientation.landscape) ? 20 : 30,
        ),
      ),
    );
  }
}
