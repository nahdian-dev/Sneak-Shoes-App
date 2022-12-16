import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/providers/checkout.dart';

class Payment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Checkouts _checkout = Provider.of<Checkouts>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: BackButton(color: ColorManager.dark),
        title: Text(
          'Payment Method',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                _checkout.getLogoPayment(),
                Flexible(
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    keyboardType: TextInputType.number,
                    controller: _checkout.payment,
                    onChanged: (value) {
                      _checkout.onChanged = value;
                    },
                    decoration: InputDecoration(
                      hintText: 'Add credit card number',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .apply(color: Colors.grey),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.dark),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.dark),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              children: [
                Flexible(
                  flex: 3,
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Add expired card',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .apply(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.dark),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.dark),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Flexible(
                  flex: 3,
                  child: TextField(
                    style: Theme.of(context).textTheme.bodyText1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Add CVV',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyText1
                          .apply(color: Colors.grey),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.dark),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: ColorManager.dark),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            TextField(
              style: Theme.of(context).textTheme.bodyText1,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Add cardholder name',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(color: Colors.grey),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.dark),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: ColorManager.dark),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 10,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            _checkout.cardNumber = _checkout.payment.text;
            Navigator.pop(context);
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
                "Add Payment Card",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .apply(color: ColorManager.primary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
