import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/resources/colors_manager.dart';

class ShippingInput extends StatelessWidget {
  final String title;
  final TextEditingController textEditingController;

  const ShippingInput({Key key, this.textEditingController, this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Flexible(
              child: TextField(
                controller: textEditingController,
                style: Theme.of(context).textTheme.bodyText1,
                decoration: InputDecoration(
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
        Divider(height: 20),
      ],
    );
  }
}
