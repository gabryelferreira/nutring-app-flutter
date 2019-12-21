import 'package:flutter/material.dart';
import 'package:nutring/data/models/restaurant.dart';

class RestaurantTypes {
  List<Restaurant> healthy;
  List<Restaurant> vegetarian;
  List<Restaurant> vegan;
  List<Restaurant> parcialHealthy;
  RestaurantTypes({
    @required this.healthy,
    @required this.vegetarian,
    @required this.vegan,
    @required this.parcialHealthy,
  });
}