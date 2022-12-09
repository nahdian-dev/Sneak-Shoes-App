import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/widgets/base_appbar.dart';
import 'package:sneak_shoes_app/providers/carts.dart';
import 'package:sneak_shoes_app/providers/products.dart';

class Cart extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    Carts _cartList = Provider.of<Carts>(context);
    Products _products = Provider.of<Products>(context);

    return Scaffold(
      appBar: BaseAppBar.baseAppBar(context, _scaffoldKey, false, false, false),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TITLE
            Text('My Bag',
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .apply(fontSizeDelta: 10)),
            SizedBox(height: 20),

            // LIST
            Expanded(
              child: (_cartList.listCart.isNotEmpty)
                  ? ListView.builder(
                      physics: BouncingScrollPhysics(),
                      itemCount: _cartList.listCart.length,
                      itemBuilder: (context, index) {
                        var _product =
                            _products.getById(_cartList.listCart[index].id);

                        var key =
                            _cartList.getCart(_cartList.listCart[index].id).id;

                        return Dismissible(
                          key: Key(key.toString()),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd ||
                                direction == DismissDirection.endToStart) {
                              _cartList.removeCart(key, context);
                            }
                          },
                          child: Column(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // IMAGE
                                  Container(
                                    width: 120,
                                    height: 70,
                                    padding: EdgeInsets.all(14),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Center(
                                      child: Image.asset(_product.images[0]),
                                    ),
                                  ),
                                  SizedBox(width: 20),

                                  Flexible(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          _product.title,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '\$ ${_product.price.toStringAsFixed(0)}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .apply(
                                                      color: ColorManager.dark),
                                            ),
                                            Text(
                                              'x' +
                                                  _cartList
                                                      .getCart(_product.id)
                                                      .quantity
                                                      .toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1
                                                  .apply(
                                                      color: ColorManager.dark),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'CART KOSONG',
                        style: Theme.of(context).textTheme.headline1.apply(
                              color: ColorManager.dark,
                            ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height / 7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  _cartList.countPrice().toString(),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              height: 50,
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
          ],
        ),
      ),
    );
  }
}
