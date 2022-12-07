import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/views/home/component/drawer_menu.dart';
import 'package:sneak_shoes_app/presentation/widgets/base_appbar.dart';

import 'component/favorite_body.dart';

class Favorite extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.baseAppBar(context, _scaffoldKey, false, false),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerMenu(),
        body: FavoriteBody(),
      ),
    );
  }
}
