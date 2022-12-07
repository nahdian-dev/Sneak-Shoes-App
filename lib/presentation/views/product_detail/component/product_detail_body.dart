import 'package:flutter/material.dart';

class ProductDetailBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        //LOGO
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            'assets/brand_logo/nike.png',
            height: MediaQuery.of(context).size.height / 14,
          ),
        ),

        //DESCRIPTION
        Column(
          children: <Widget>[
            Text(
              'NIKE AIRMAX 270',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            SizedBox(height: 14),
            Text(
              "200.000",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ],
        ),
        SizedBox(height: 20),

        //size
        // BrandSize(),
        SizedBox(height: 20),
      ]),
    );
  }
}
