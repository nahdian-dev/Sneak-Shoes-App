import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';
import 'package:sneak_shoes_app/presentation/widgets/shipping_input.dart';
import 'package:sneak_shoes_app/providers/checkout.dart';

class Shipping extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Checkouts _checkout = Provider.of<Checkouts>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        leading: BackButton(color: ColorManager.dark),
        title: Text(
          'Shipping',
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            ShippingInput(
              textEditingController: _checkout.firstName,
              title: 'First Name',
            ),
            ShippingInput(
              textEditingController: _checkout.lastName,
              title: 'Last Name',
            ),
            ShippingInput(
              textEditingController: _checkout.phoneNumber,
              title: 'Phone Number',
            ),
            ShippingInput(
              textEditingController: _checkout.address,
              title: 'Address',
            ),
            ShippingInput(
              textEditingController: _checkout.zip,
              title: 'ZIP',
            ),
            ShippingInput(
              textEditingController: _checkout.city,
              title: 'City',
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height / 10,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () => _checkout.addShipping(context),
          child: Container(
            margin: EdgeInsets.only(bottom: 20),
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: ColorManager.dark,
            ),
            child: Center(
              child: Text(
                "Add Shipping",
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
