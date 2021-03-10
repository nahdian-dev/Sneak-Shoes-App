import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneak_shoes_app/controller/product_controller.dart';
import 'package:sneak_shoes_app/size_config.dart';

import '../../immutable.dart';
import 'component/brand_size.dart';
import 'component/button_cart.dart';
import 'component/carousel.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    final ProductController productController = Get.put(ProductController());
    var arguments = Get.arguments;

    return Scaffold(
      body: SafeArea(
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
                  Get.back();
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
                  productController: productController,
                  arguments: arguments,
                ),
              ),
            ),
            ContentProductDetail(
                productController: productController, arguments: arguments),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 120,
        child: ButtonCart(),
      ),
    );
  }
}

class ContentProductDetail extends StatelessWidget {
  const ContentProductDetail({
    Key key,
    @required this.productController,
    @required this.arguments,
  }) : super(key: key);

  final ProductController productController;
  final arguments;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        //logo
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            productController.listProduct[arguments].logo,
            height: (SizeConfig.orientation == Orientation.landscape) ? 50 : 80,
          ),
        ),

        //description
        Column(
          children: <Widget>[
            Text(
              productController.listProduct[arguments].title,
              style: getPrimaryFont(
                fontSize: 26,
              ),
            ),
            SizedBox(height: 14),
            Text(
              "\$ ${productController.listProduct[arguments].price.toStringAsFixed(0)}",
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
      ]),
    );
  }
}
