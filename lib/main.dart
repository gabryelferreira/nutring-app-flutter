import 'package:flutter/material.dart';
import 'package:nutring/pages/home.dart';
import 'package:nutring/data/providers/restaurant_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(
      ChangeNotifierProvider<RestaurantProvider>(
        create: (_) => RestaurantProvider(),
        child: MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nutring',
      theme: ThemeData(
        primaryColor: Colors.white,
        accentColor: Colors.black,
      ),
      home: HomePage(),
    );
  }
}
