import 'package:flutter/material.dart';

import 'package:sneak_shoes_app/screen/product/component/body.dart';
import 'package:sneak_shoes_app/screen/product/component/cart.dart';
import 'package:sneak_shoes_app/screen/product/component/drawer.dart';
import 'package:sneak_shoes_app/screen/product/component/filters.dart';

import '../../immutable.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  bool isOpened = false;
  AnimationController _animationController;
  Animation<double> _animateIcon;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500))
          ..addListener(() {
            setState(() {});
          });
    _animateIcon =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerMenu(),
        body: SafeArea(
          child: Body(),
        ),
      ),
    );
  }

  //appBar method
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        onPressed: () {
          if (!isOpened) {
            _animationController.forward();
            _scaffoldKey.currentState.openDrawer();
          } else {
            _scaffoldKey.currentState.openEndDrawer();
            _animationController.reverse();
          }
          isOpened = !isOpened;
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          color: blackColor,
          progress: _animateIcon,
        ),
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
            showModalBottomSheet(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              isScrollControlled: true,
              backgroundColor: primaryColor,
              context: context,
              builder: (BuildContext context) {
                return Filters();
              },
            );
          },
        ),
        FloatingActionButton(
          backgroundColor: blackColor,
          elevation: 0,
          mini: true,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Cart(),
              ),
            );
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
    );
  }
}
