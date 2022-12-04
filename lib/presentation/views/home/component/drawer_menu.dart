import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/widgets/list_menu.dart';

class DrawerMenu extends StatelessWidget {
  final List listMenuTitle = [
    'Home',
    'New in',
    'Sale',
    'Profile',
  ];

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.primary,
      elevation: 0.0,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          // LIST MENU
          Expanded(
            flex: 7,
            child: Container(
              alignment: Alignment.centerLeft,
              margin: EdgeInsets.only(left: 30),
              width: double.infinity,
              child: ListMenu(listTitle: listMenuTitle),
            ),
          ),

          // SUMMER COLLECTION BUTTON
          Expanded(
            flex: 2,
            child: Center(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 50),
                decoration: BoxDecoration(
                  color: ColorManager.brown,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(left: 50),
                  child: Text(
                    'Summer Collection',
                    style: Theme.of(context).textTheme.bodyText1.apply(
                        color: ColorManager.primary, fontWeightDelta: 10),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
