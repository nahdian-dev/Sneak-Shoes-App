import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/immutable.dart';
import 'package:sneak_shoes_app/models/products.dart';
import 'package:sneak_shoes_app/screen/detail/detail_screen.dart';

import 'package:sneak_shoes_app/screen/product/component/drawer.dart';
import 'package:sneak_shoes_app/screen/product/component/filters.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> with SingleTickerProviderStateMixin {
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
        body: CartContent(),
        bottomNavigationBar: SizedBox(
          height: 120,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Total",
                      style: getSecondaryFont(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "\$ 508.00",
                      style: getPrimaryFont(),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Checkout",
                    style: getPrimaryFont(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
          onPressed: () {},
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

class CartContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            "My Bag",
            style: getPrimaryFont(
              fontSize: 30,
            ),
          ),
        ),
        SizedBox(
          height: 350,
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 4,
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      dataContent: dataContent[index],
                    ),
                  ),
                );
              },
              child: Container(
                margin: EdgeInsets.all(20),
                child: Row(
                  children: [
                    Container(
                      width: 120,
                      height: 70,
                      padding: EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Image.asset(dataContent[index].img),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dataContent[index].title,
                            style: getPrimaryFont(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ ${dataContent[index].price.toStringAsFixed(2)}",
                                style: getSecondaryFont(),
                              ),
                              Text(
                                "x1",
                                style: getSecondaryFont(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
