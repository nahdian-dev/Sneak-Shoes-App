import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/routes/routes_manager.dart';
import 'package:sneak_shoes_app/providers/products.dart';

class HomeMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Products _product = Provider.of<Products>(context);

    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        SliverOverlapAbsorber(
          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
          sliver: SliverAppBar(
            automaticallyImplyLeading: false,
            forceElevated: innerBoxIsScrolled,
            expandedHeight: 10.0,
            centerTitle: false,
            title: Text(
              "Shoes",
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .apply(fontSizeDelta: 10),
            ),
            actions: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 10),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Sort by",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: ColorManager.dark,
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
                  itemExtent: MediaQuery.of(context).size.height / 3.3,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(Routes.productDetailRoute);
                        },
                        child: Container(
                          margin: EdgeInsets.all(5),
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.0),
                            color: ColorManager.grey,
                          ),
                          child: Stack(
                            children: <Widget>[
                              // FAVORITE BUTTON
                              Align(
                                alignment: Alignment.topRight,
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.favorite),
                                ),
                              ),

                              //IMAGE
                              Container(
                                margin: EdgeInsets.all(20),
                                alignment: Alignment.topCenter,
                                child: Image.asset(
                                  _product.productData[index].img,
                                  fit: BoxFit.contain,
                                  height:
                                      MediaQuery.of(context).size.height / 7,
                                ),
                              ),

                              //TITLE
                              Container(
                                margin: EdgeInsets.all(10),
                                alignment: Alignment.bottomCenter,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Text(_product.productData[index].title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1),
                                    SizedBox(height: 10),
                                    Text(
                                      '\$ ${_product.productData[index].price.toStringAsFixed(0)}',
                                      style: Theme.of(context)
                                          .textTheme
                                          .subtitle1
                                          .apply(color: ColorManager.dark),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: _product.productData.length,
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
