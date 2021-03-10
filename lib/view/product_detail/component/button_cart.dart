import 'package:flutter/material.dart';

import '../../../immutable.dart';

class ButtonCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Description",
                style: getPrimaryFont(),
              ),
              Icon(Icons.keyboard_arrow_up),
            ],
          ),
          SizedBox(height: 10.0),

          //button
          SizedBox(
            height: 55,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: secondaryColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.star_border,
                        color: blackColor,
                      ),
                    ),
                  ),
                ),

                //add to Cart
                Container(
                  width: MediaQuery.of(context).size.width / 1.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: blackColor,
                  ),
                  child: Center(
                    child: Text(
                      "Add to Cart",
                      style: getPrimaryFont(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
