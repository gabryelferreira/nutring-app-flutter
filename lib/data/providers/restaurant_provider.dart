import 'package:flutter/cupertino.dart';
import 'package:nutring/data/controllers/restaurant_controller.dart';
import 'package:nutring/data/models/restaurant.dart';
import 'package:nutring/data/models/restaurant_types.dart';

class RestaurantProvider with ChangeNotifier {
  RestaurantController _restaurantController = RestaurantController();

  List<Restaurant> _restaurants = [];
  List<Restaurant> get restaurants => _restaurants;

  List<Restaurant> _healthyRestaurants = [];
  List<Restaurant> _vegetarianRestaurants = [];
  List<Restaurant> _veganRestaurants = [];
  List<Restaurant> _parcialHealthyRestaurants = [];

  void getRestaurants() async {
    final restaurantsResponse = await _restaurantController.getRestaurants();
    _restaurants = restaurantsResponse;
    _healthyRestaurants = filterRestaurants(1);
    _vegetarianRestaurants = filterRestaurants(2);
    _veganRestaurants = filterRestaurants(3);
    _parcialHealthyRestaurants = filterRestaurants(4);
    print("notifying listeners");
    notifyListeners();
  }

  RestaurantTypes getAllRestaurantTypes() {
    return RestaurantTypes(
      healthy: _healthyRestaurants,
      vegetarian: _vegetarianRestaurants,
      vegan: _veganRestaurants,
      parcialHealthy: _parcialHealthyRestaurants,
    );
  }

  List<Restaurant> filterRestaurants(int id) {
    final filteredRestaurants = _restaurants.where((restaurant) {
      return restaurant.filters
              .where((filter) => filter.id == id)
              .toList()
              .length >
          0;
    }).toList();
    filteredRestaurants.shuffle();
    return filteredRestaurants;
  }
}
