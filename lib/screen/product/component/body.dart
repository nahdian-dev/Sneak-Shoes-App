import 'package:flutter/material.dart';

import 'package:sneak_shoes_app/models/products.dart';
import 'package:sneak_shoes_app/screen/detail/detail_screen.dart';

import '../../../immutable.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverOverlapAbsorber(
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            forceElevated: innerBoxIsScrolled,
            expandedHeight: 10.0,
            title: Text(
              "Shoes",
              style: getPrimaryFont(
                fontSize: 30,
              ),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sort by",
                      style: getPrimaryFont(),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: blackColor,
                    ),
                  ],
                ),
              ),
            ],
          ),
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
        ),
      ],
      body: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            physics: BouncingScrollPhysics(),
            slivers: <Widget>[
              SliverPadding(
                padding: const EdgeInsets.all(10.0),
                sliver: SliverFixedExtentList(
                  itemExtent: 240.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return DetailScreen(
                                dataContent: dataContent[index],
                              );
                            },
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: secondaryColor,
                          ),
                          child: Stack(
                            children: <Widget>[
                              //icon
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Icon(Icons.star_border),
                                ),
                              ),

                              //image
                              Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  dataContent[index].img,
                                  fit: BoxFit.contain,
                                  height: 120,
                                ),
                              ),

                              //description
                              Container(
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(
                                      dataContent[index].title,
                                      style: getPrimaryFont(
                                        fontSize: 20,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "\$ ${dataContent[index].price.toStringAsFixed(0)}",
                                      style: getSecondaryFont(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    // The childCount of the SliverChildBuilderDelegate
                    // specifies how many children this inner list
                    // has. In this example, each tab has a list of
                    // exactly 30 items, but this is arbitrary.
                    childCount: dataContent.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
