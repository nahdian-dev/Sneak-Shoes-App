import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';

import 'component/image_slider.dart';
import 'component/product_detail_body.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: ColorManager.grey,
              expandedHeight: MediaQuery.of(context).size.height / 2.5,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: ColorManager.dark,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.more_vert),
                  color: ColorManager.dark,
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
                background: ImageSlider(),
              ),
            ),
            ProductDetailBody(),
          ],
        ),
      ),
      // bottomNavigationBar: Container(
      //   height: 120,
      //   child: ButtonCart(),
      // ),
    );
  }
}
