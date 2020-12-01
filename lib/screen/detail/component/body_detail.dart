import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/models/products.dart';

import 'package:sneak_shoes_app/screen/detail/component/brand_size.dart';
import 'package:sneak_shoes_app/screen/detail/component/button_cart.dart';
import 'package:sneak_shoes_app/screen/detail/component/carousel.dart';
import 'package:sneak_shoes_app/size_config.dart';

import '../../../immutable.dart';

class BodyDetail extends StatelessWidget {
  const BodyDetail({
    Key key,
    this.dataContent,
  }) : super(key: key);

  final DataContent dataContent;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: secondaryColor,
            expandedHeight:
                (SizeConfig.orientation == Orientation.landscape) ? 200 : 300,
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: blackColor,
              iconSize: 22.0,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.more_vert),
                color: blackColor,
                onPressed: () {},
              ),
            ],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Carousel(
                dataContent: dataContent,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              //logo
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  dataContent.logo,
                  height: (SizeConfig.orientation == Orientation.landscape)
                      ? 50
                      : 80,
                ),
              ),

              //description
              Column(
                children: <Widget>[
                  Text(
                    dataContent.title,
                    style: getPrimaryFont(
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    "\$ ${dataContent.price.toStringAsFixed(0)}",
                    style: getSecondaryFont(
                      fontSize: 22,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //size
              BrandSize(),
              SizedBox(
                height: 20,
              ),

              //button
              ButtonCart(),
            ]),
          ),
        ],
      ),
    );
  }
}
