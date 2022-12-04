import 'package:flutter/material.dart';
import 'package:sneak_shoes_app/presentation/routes/routes_generator.dart';
import '../presentation/resources/themes_manager.dart';
import '../presentation/views/home/home.dart';

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneak Shoes App',
      debugShowCheckedModeBanner: false,
      theme: getApplicationTheme(),
      onGenerateRoute: RouteGenerator.getRoute,
      home: Home(),
    );
  }
}
