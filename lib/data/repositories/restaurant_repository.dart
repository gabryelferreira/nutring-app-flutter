import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:nutring/data/models/restaurant.dart';

class RestaurantRepository {

  Future<List<Restaurant>> getRestaurants() async {
    var response = await http.get('https://api.nutring.com.br/restaurants');
    final List<dynamic> restaurantResponse = jsonDecode(response.body)["restaurants"];

    final List<Restaurant> restaurants = 
      restaurantResponse.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
    return restaurants;
  }

}