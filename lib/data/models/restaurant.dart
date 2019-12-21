import 'package:flutter/material.dart';
import 'package:nutring/data/models/filter.dart';

class Restaurant {
  int id;
  String name;
  String description;
  String imageUrl;
  List<Filter> filters;

  Restaurant({
    @required this.id,
    @required this.name,
    @required this.description,
    @required this.imageUrl,
    @required this.filters,
  });

  Restaurant.fromJson(Map<String, dynamic> json) {
    id = json['id_restaurant'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['img_url'];
    List<dynamic> newFilters = json['filters'];
    filters = newFilters.map((filter) => Filter.fromJson(filter)).toList();
  }

}