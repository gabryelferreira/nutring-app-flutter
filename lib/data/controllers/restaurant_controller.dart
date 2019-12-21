import 'package:nutring/data/models/restaurant.dart';
import 'package:nutring/data/repositories/restaurant_repository.dart';

class RestaurantController {

  RestaurantRepository _restaurantRepository = RestaurantRepository();

  Future<List<Restaurant>> getRestaurants() async {
    return _restaurantRepository.getRestaurants();
  }

}