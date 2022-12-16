import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/providers/checkout.dart';

class Coupons extends StatelessWidget {
  final double subtotal;

  const Coupons({Key key, this.subtotal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Checkouts _checkout = Provider.of<Checkouts>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: BackButton(color: ColorManager.dark),
        title: Text(
          'Coupons',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: _checkout.couponsData.length,
          itemBuilder: (context, index) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              height: MediaQuery.of(context).size.height / 5,
              decoration: BoxDecoration(
                color: _checkout.couponsData[index].color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: LayoutBuilder(
                builder: (ctx, constraint) {
                  DateTime _dateTime = _checkout.couponsData[index].expired;
                  bool _isNotExpired =
                      _dateTime.compareTo(DateTime.now()).isNegative;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(left: 10),
                              child: Text(
                                _checkout.couponsData[index].code,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1
                                    .apply(color: ColorManager.primary),
                              ),
                            ),
                            (_isNotExpired)
                                ? Container(
                                    margin: EdgeInsets.only(right: 20),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.av_timer,
                                          color: ColorManager.primary,
                                        ),
                                        Text(
                                          '  Expired',
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1
                                              .apply(
                                                  color: ColorManager.primary),
                                        ),
                                      ],
                                    ),
                                  )
                                : SizedBox.shrink(),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        height: constraint.maxHeight / 1.5,
                        color: ColorManager.grey,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline1
                                        .apply(
                                          color: Colors.green,
                                          fontSizeDelta: 14,
                                        ),
                                    text:
                                        '${_checkout.couponsData[index].discount.toStringAsFixed(0)}%',
                                    children: [
                                      TextSpan(
                                        text: '  OFF',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline1
                                            .apply(color: Colors.green),
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Valid Until:  ${_dateTime.day} - ${_dateTime.month} - ${_dateTime.year}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle1
                                      .apply(color: ColorManager.dark),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                _checkout.useCoupon(
                                  context,
                                  _isNotExpired,
                                  _checkout.couponsData[index].code,
                                  _checkout.couponsData[index].discount,
                                );
                                _checkout.countDiscount(subtotal);
                              },
                              child: Container(
                                height: 40,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                padding: EdgeInsets.symmetric(horizontal: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: _checkout.couponsData[index].color,
                                ),
                                child: Center(
                                  child: Text(
                                    "Use Now",
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
                    ],
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
