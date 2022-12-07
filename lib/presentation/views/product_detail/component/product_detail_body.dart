import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/providers/favorite_product.dart';
import 'package:sneak_shoes_app/providers/products.dart';

class ProductDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FavoriteProduct _favoriteProduct = Provider.of<FavoriteProduct>(context);

    Products _product = Provider.of<Products>(context);
    var productId = ModalRoute.of(context).settings.arguments;

    return SliverList(
      delegate: SliverChildListDelegate([
        // LOGO
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // LOGO
              Image.asset(
                _product.getById(productId).logo,
                height: MediaQuery.of(context).size.height / 8,
                width: MediaQuery.of(context).size.width / 3,
              ),

              // TITLE
              Text(
                _product.getById(productId).title,
                style: Theme.of(context)
                    .textTheme
                    .headline1
                    .apply(fontSizeDelta: 10),
              ),
              SizedBox(height: 10),

              // PRICE
              Text(
                '\$ ${_product.getById(productId).price.toStringAsFixed(0)}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(fontSizeDelta: 10),
              ),

              // SIZE
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Size',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .apply(fontWeightDelta: 2),
                      ),
                      Text(
                        'Size Guide',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 12,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: _product.getById(productId).size.length,
                      itemBuilder: ((context, index) {
                        return GestureDetector(
                          onTap: () {
                            _product.selectedIndex(index);
                          },
                          child: Container(
                            margin:
                                (index != 0) ? EdgeInsets.only(left: 20) : null,
                            width: 60,
                            decoration: BoxDecoration(
                              color: (_product.selectedBrand != index)
                                  ? ColorManager.grey
                                  : ColorManager.brown,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                _product
                                    .getById(productId)
                                    .size[index]
                                    .toString(),
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              //DESCRIPTION
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .apply(fontWeightDelta: 2),
                  ),
                  SizedBox(height: 10),
                  Text(
                    _product.getById(productId).description,
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 6,
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
              SizedBox(height: 20),

              // BUTTON
              SizedBox(
                height: MediaQuery.of(context).size.height / 14,
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
                            (_favoriteProduct.favoriteProduct
                                    .contains(productId)
                                ? Icons.favorite
                                : Icons.favorite_border),
                            color: ColorManager.dark,
                          ),
                        ),
                      ),
                    ),

                    // CART
                    Container(
                      width: MediaQuery.of(context).size.width / 1.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: ColorManager.brown,
                      ),
                      child: Center(
                        child: Text(
                          "Add to Cart",
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ]),
    );
  }
}
