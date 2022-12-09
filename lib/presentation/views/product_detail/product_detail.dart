import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/providers/products.dart';

import 'component/image_slider.dart';
import 'component/product_detail_body.dart';
import 'package:sneak_shoes_app/providers/carts.dart';
import 'package:sneak_shoes_app/providers/favorite_product.dart';

class ProductDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteProduct _favoriteProduct = Provider.of<FavoriteProduct>(context);
    Carts _cartList = Provider.of<Carts>(context);
    Products _product = Provider.of<Products>(context);

    var productId = ModalRoute.of(context).settings.arguments;

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
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 10,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // ICON
            GestureDetector(
              onTap: () {
                _favoriteProduct.addToFavoriteList(
                  productId,
                  context,
                );
              },
              child: Container(
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorManager.grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Icon(
                    (_favoriteProduct.favoriteProduct.contains(productId)
                        ? Icons.favorite
                        : Icons.favorite_border),
                    color: ColorManager.dark,
                  ),
                ),
              ),
            ),

            // ADD TO CART
            GestureDetector(
              onTap: () {
                _cartList.addToCart(context, _product.getById(productId).id, 1);
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: MediaQuery.of(context).size.width / 1.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorManager.dark,
                ),
                child: Center(
                  child: Text(
                    "Add to Cart",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .apply(color: ColorManager.primary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
