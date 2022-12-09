import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/widgets/base_appbar.dart';

import 'component/drawer_menu.dart';
import 'component/home_menu.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar.baseAppBar(context, _scaffoldKey, true, true, true),
      body: Scaffold(
        key: _scaffoldKey,
        drawer: DrawerMenu(),
        body: HomeMenu(),
      ),
    );
  }
}
