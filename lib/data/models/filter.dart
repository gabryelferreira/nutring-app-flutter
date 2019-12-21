import 'package:flutter/material.dart';

class Filter {
  int id;
  String name;
  String icon;
  String color;
  int idFilterType;
  String filterType;

  Filter({
    @required this.id,
    @required this.name,
    @required this.icon,
    @required this.color,
    @required this.idFilterType,
    @required this.filterType,
  });

  Filter.fromJson(Map<String, dynamic> json) {
    id = json["id_filter"];
    name = json["name"];
    icon = json["icon"];
    color = json["color"];
    idFilterType = json["id_filter_type"];
    filterType = json["filter_type"];
  }

}
