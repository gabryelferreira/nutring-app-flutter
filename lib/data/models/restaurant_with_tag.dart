import 'package:flutter/material.dart';
import 'package:nutring/data/models/filter.dart';
import 'package:nutring/data/models/restaurant.dart';

class RestaurantWithTag extends Restaurant {
  String tag;

  RestaurantWithTag({
    int id,
    String name,
    String description,
    String imageUrl,
    List<Filter> filters,
    @required this.tag,
  }) : super(
          id: id,
          name: name,
          description: description,
          imageUrl: imageUrl,
          filters: filters,
        );

  RestaurantWithTag.constructWith(Restaurant restaurant, {String tag}) {
    this.id = restaurant.id;
    this.name = restaurant.name;
    this.description = restaurant.description;
    this.imageUrl = restaurant.imageUrl;
    this.filters = restaurant.filters;
    this.tag = tag;
  }
}
