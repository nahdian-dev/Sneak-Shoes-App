import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/views/checkout/component/succes_confirm.dart';

import 'package:sneak_shoes_app/providers/carts.dart';
import 'package:sneak_shoes_app/providers/checkout.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/views/checkout/component/coupons.dart';
import 'package:sneak_shoes_app/presentation/views/checkout/component/payment.dart';
import 'package:sneak_shoes_app/presentation/views/checkout/component/shipping.dart';

class Checkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Carts _cartList = Provider.of<Carts>(context);
    Checkouts _checkout = Provider.of<Checkouts>(context);

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
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
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
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Shipping()),
                        ),
                      ),
                      child: Text('EDIT'),
                    ),
                  ],
                ),
                (_checkout.shipping.isNotEmpty)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: TextSpan(
                              text: _checkout.shipping['firstName'] + ' ',
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                  text: _checkout.shipping['lastName'],
                                ),
                              ],
                            ),
                          ),
                          RichText(
                            text: TextSpan(
                              text: _checkout.shipping['address'] + ', ',
                              style: Theme.of(context).textTheme.bodyText1,
                              children: [
                                TextSpan(
                                  text: _checkout.shipping['zip'] + ', ',
                                ),
                                TextSpan(
                                  text: _checkout.shipping['city'] + '.',
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    : SizedBox.shrink(),
              ],
            ),
          ),
          Divider(height: 20),

          // PAYMENT
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('PAYMENT METHOD: '),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Payment()),
                        ),
                      ),
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
                        _checkout.getLogoPayment(),
                        SizedBox(width: 10),
                        Text((_checkout.cardNumber != null)
                            ? _checkout.cardNumber.toString()
                            : ' '),
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
                    itemCount: _checkout.deliveryData.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          _checkout.selectedDelivery = index;
                          _checkout.getDeliveryCost(_checkout
                              .deliveryData[_checkout.selectedDelivery].id);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 10),
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: (_checkout.selectedDelivery == index)
                                ? ColorManager.brown
                                : ColorManager.grey,
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '\Rp. ${_checkout.deliveryData[index].cost}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                                Text(
                                  _checkout.deliveryData[index].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color: ColorManager.dark),
                                ),
                              ],
                            ),
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

          // COUPONS
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('COUPONS: '),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => Coupons(
                                subtotal: _cartList.countPrice(),
                              )),
                        ),
                      ),
                      child: Text('EDIT'),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // COUPONS
                    Text(
                        (_checkout.couponCode.length != 0)
                            ? '*${_checkout.couponCode}* applied'
                            : 'Coupon is not used',
                        style: Theme.of(context).textTheme.bodyText1),
                  ],
                ),
              ],
            ),
          ),
          Divider(height: 20),

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
                          '\Rp. ${_cartList.countPrice().toStringAsFixed(0)}',
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
                          (_checkout.deliveryCost != 0)
                              ? '\Rp. ${_checkout.deliveryCost.toString()}'
                              : '-',
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
                          'Rp. ${_checkout.totalDiscount.toStringAsFixed(0)}',
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
                        '\Rp. ${_checkout.countTotalPay(_cartList.countPrice()).toStringAsFixed(0)}',
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => SuccesConfirm()),
                        ),
                      );
                    },
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
      ),
    );
  }
}
