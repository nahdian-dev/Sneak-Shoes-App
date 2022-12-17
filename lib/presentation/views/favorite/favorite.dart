import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';

import 'package:sneak_shoes_app/providers/favorite_product.dart';

import 'package:sneak_shoes_app/presentation/widgets/base_appbar.dart';

class Favorite extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    FavoriteProduct _favoriteProduct = Provider.of<FavoriteProduct>(context);
    var _favorite = _favoriteProduct.favoriteProduct;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: BackButton(color: ColorManager.dark),
        title: Text(
          'My favorite',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (_favorite.isNotEmpty)
              ? Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: _favorite.length,
                    itemBuilder: (context, index) {
                      var _getFavorite =
                          _favoriteProduct.getFavorite(_favorite[index]);

                      return Dismissible(
                        key: Key(_getFavorite.id.toString()),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd ||
                              direction == DismissDirection.endToStart) {
                            _favoriteProduct.removeFavorite(
                                _getFavorite.id, context);
                          }
                        },
                        child: Container(
                          margin: EdgeInsets.all(20),
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
                                child: Image.asset(_getFavorite.images[0]),
                              ),
                              SizedBox(
                                width: 20,
                              ),

                              Flexible(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      _getFavorite.title,
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '\Rp. ${_getFavorite.price.toStringAsFixed(0)}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .subtitle1
                                              .apply(color: ColorManager.dark),
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
                  ),
                )
              : Expanded(
                  child: Center(
                    child: Text(
                      'Favorite is Empty',
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .apply(color: ColorManager.dark),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
