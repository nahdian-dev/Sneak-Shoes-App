import 'package:flutter/material.dart';

class ListMenu extends StatelessWidget {
  final List listTitle;
  const ListMenu({Key key, @required this.listTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        for (var i in listTitle)
          Text(
            i.toString(),
            style:
                Theme.of(context).textTheme.headline1.apply(fontSizeDelta: 5),
          ),
      ],
    );
  }
}
