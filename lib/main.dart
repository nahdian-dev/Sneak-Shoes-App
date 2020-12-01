import 'package:flutter/material.dart';

import 'package:sneak_shoes_app/immutable.dart';
import 'package:sneak_shoes_app/screen/product/home_screen.dart';

void main() => runApp(
      MaterialApp(
        title: 'Sneak Shoes App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: primaryColor,
          appBarTheme: AppBarTheme(
            color: Colors.transparent,
            elevation: 0,
          ),
        ),
        home: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomeScreen(),
    );
  }
}
