import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/routes/routes_manager.dart';
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

                        return GestureDetector(
                          onTap: () {
                            _cartList.currentQuantity = 0;

                            if (_cartList.selectedCart == null) {
                              _cartList.selectedCart = index;
                              _cartList.isVisible = !_cartList.isVisible;

                              _cartList.currentQuantity =
                                  _cartList.listCart[index].quantity;
                            } else if (_cartList.selectedCart == index) {
                              _cartList.selectedCart = null;
                              _cartList.isVisible = false;
                            } else if (_cartList.selectedCart != index) {
                              _cartList.selectedCart = index;
                              _cartList.isVisible = true;

                              _cartList.currentQuantity =
                                  _cartList.listCart[index].quantity;
                            }
                          },
                          child: Container(
                            color: (_cartList.selectedCart == index)
                                ? ColorManager.grey
                                : ColorManager.primary,
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.symmetric(vertical: 10),
                            child: Row(
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
                                            '\Rp. ${_product.price.toStringAsFixed(0)}',
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle1
                                                .apply(
                                                    color: ColorManager.dark),
                                          ),
                                          Consumer<Carts>(
                                            builder: (context, value, child) {
                                              return Text(
                                                'x' +
                                                    _cartList
                                                        .getCart(_product.id)
                                                        .quantity
                                                        .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1
                                                    .apply(
                                                        color:
                                                            ColorManager.dark),
                                              );
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )
                  : Center(
                      child: Text(
                        'CART IS EMPTY',
                        style: Theme.of(context).textTheme.headline1.apply(
                              color: ColorManager.dark,
                            ),
                      ),
                    ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: (_cartList.listCart.isNotEmpty)
          ? Container(
              height: MediaQuery.of(context).size.height / 4.5,
              child: LayoutBuilder(
                builder: (p0, constraint) {
                  return Stack(
                    children: [
                      Visibility(
                        visible: _cartList.isVisible,
                        child: Container(
                          color: ColorManager.brown,
                          height: constraint.maxHeight / 3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _cartList.currentQuantity -= 1;
                                      },
                                      icon: Icon(Icons.remove)),
                                  Text(_cartList.currentQuantity.toString()),
                                  IconButton(
                                      onPressed: () {
                                        _cartList.currentQuantity += 1;
                                      },
                                      icon: Icon(Icons.add))
                                ],
                              ),
                              Row(
                                children: [
                                  // DELETE PRODUCT
                                  ElevatedButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (_) {
                                          return AlertDialog(
                                            content: Text(
                                              'Are you sure to delete this product?',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodyText1,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  _cartList.removeCart(context);

                                                  _cartList.selectedCart = null;
                                                  _cartList.isVisible = false;

                                                  Navigator.pop(context);
                                                },
                                                child: Text('Delete'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    child: Text(
                                      'Delete',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  SizedBox(width: 10),

                                  // ADD QUANTITY
                                  ElevatedButton(
                                    onPressed: () {
                                      _cartList.addQuantity(
                                        context,
                                        _cartList.currentQuantity,
                                      );

                                      _cartList.selectedCart = null;
                                      _cartList.isVisible = false;
                                    },
                                    child: Text(
                                      'Change',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20),
                          height: constraint.maxHeight / 1.5,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                  Text(
                                    '\Rp. ${_cartList.countPrice().toStringAsFixed(0)}',
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => Navigator.of(context)
                                    .pushNamed(Routes.checkout),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 20),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: ColorManager.dark,
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Checkout",
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
                      ),
                    ],
                  );
                },
              ),
            )
          : SizedBox.shrink(),
    );
  }
}
