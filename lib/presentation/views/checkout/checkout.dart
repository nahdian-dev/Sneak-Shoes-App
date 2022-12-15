import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/providers/carts.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Carts _cartList = Provider.of<Carts>(context);

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          leading: BackButton(color: ColorManager.dark),
          title: Text(
            'Checkout',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        body: Column(
          children: [
            // SHIPPING
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: MediaQuery.of(context).size.height / 8,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('SHIPPING TO: '),
                      TextButton(
                        onPressed: () => null,
                        child: Text('EDIT'),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('JOHN SMITH'),
                      Text('350 5th Ave,'),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 20),

            // PAYMENT
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('PAYMENT METHOD: '),
                      TextButton(
                        onPressed: () => null,
                        child: Text('EDIT'),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // NUMBER
                      Row(
                        children: [
                          Text('LOGO'),
                          SizedBox(width: 10),
                          Text('1234 1234567 1234'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(height: 20),

            // DELIVERY
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text('DELIVERY: '),
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 120,
                          decoration: BoxDecoration(
                            border: Border.all(color: ColorManager.dark),
                            borderRadius: BorderRadius.circular(10),
                            color: ColorManager.primary,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Rp. 10000'),
                                Text('STANDARD'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Divider(),

            // SUMMARY
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: Text('SUMMARY: '),
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Subtotal',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Rp. 10000',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .apply(color: ColorManager.dark),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Discount',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Rp. 10000',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .apply(color: ColorManager.dark),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Delivery',
                              style: Theme.of(context).textTheme.bodyText1),
                          Text(
                            'Rp. 10000',
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1
                                .apply(color: ColorManager.dark),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(),
          ],
        ),
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height / 6,
          child: LayoutBuilder(
            builder: (p0, constraint) {
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: constraint.maxHeight / 1.5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        Text(
                          '\Rp. ${_cartList.countPrice().toStringAsFixed(0)}',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    GestureDetector(
                      onTap: () => null,
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20),
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: ColorManager.dark,
                        ),
                        child: Center(
                          child: Text(
                            "Confirm & Pay",
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
              );
            },
          ),
        ));
  }
}
