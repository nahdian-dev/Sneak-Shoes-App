import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sneak_shoes_app/controller/product_controller.dart';

import '../../../immutable.dart';

class Content extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProductController productController = Get.put(ProductController());

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
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
                          Get.toNamed('/product-detail', arguments: index);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: secondaryColor,
                          ),
                          child: Stack(
                            children: <Widget>[
                              //icon
                              GestureDetector(
                                onTap: () {
                                  productController
                                          .listProduct[index].isSelected =
                                      !productController
                                          .listProduct[index].isSelected;
                                },
                                child: GetBuilder<ProductController>(
                                    init: ProductController(),
                                    builder: (context) {
                                      return Container(
                                        alignment: Alignment.topRight,
                                        margin: EdgeInsets.all(10),
                                        child: (context.listProduct[index]
                                                    .isSelected ==
                                                true)
                                            ? Icon(Icons.favorite)
                                            : Icon(Icons.favorite_border),
                                      );
                                    }),
                              ),

                              //image
                              Obx(() => Container(
                                    margin: EdgeInsets.all(20),
                                    alignment: Alignment.topCenter,
                                    child: Image.asset(
                                      productController.listProduct[index].img,
                                      fit: BoxFit.contain,
                                      height: 120,
                                    ),
                                  )),

                              //description
                              Obx(() => Container(
                                    margin: EdgeInsets.all(10),
                                    alignment: Alignment.bottomCenter,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: <Widget>[
                                        Text(
                                          productController
                                              .listProduct[index].title,
                                          style: getPrimaryFont(
                                            fontSize: 20,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "\$ ${productController.listProduct[index].price.toStringAsFixed(0)}",
                                          style: getSecondaryFont(),
                                        ),
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: productController.listProduct.length,
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
