import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/models/products.dart';
import 'package:sneak_shoes_app/screen/detail/component/body_detail.dart';

class DetailScreen extends StatelessWidget {
  final DataContent dataContent;

  const DetailScreen({Key key, this.dataContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BodyDetail(
        dataContent: dataContent,
      ),
    );
  }
}
