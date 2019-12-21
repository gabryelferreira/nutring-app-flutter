import 'package:flutter/material.dart';
import 'package:nutring/data/models/restaurant.dart';
import 'package:nutring/data/providers/restaurant_provider.dart';
import 'package:nutring/widgets/restaurant_list_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _renderRestaurants(RestaurantProvider restaurantProvider) {
    final _restaurants = restaurantProvider.getAllRestaurantTypes();
    if (restaurantProvider.restaurants == null || restaurantProvider.restaurants.length == 0)
      return Container(
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(Colors.green),
        ),
        alignment: Alignment.center,
      );

    return Column(
      children: <Widget>[
        RestaurantListView(
          title: 'Saudaveis',
          restaurants: _restaurants.healthy,
        ),
        SizedBox(
          height: 30,
        ),
        RestaurantListView(
          title: 'Vegetarianos',
          restaurants: _restaurants.vegetarian,
        ),
        SizedBox(
          height: 30,
        ),
        RestaurantListView(
          title: 'Veganos',
          restaurants: _restaurants.vegan,
        ),
        SizedBox(
          height: 30,
        ),
        RestaurantListView(
          title: 'Parcialmente Saudaveis',
          restaurants: _restaurants.parcialHealthy,
        ),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    Provider.of<RestaurantProvider>(context, listen: false).getRestaurants();
  }

  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30),
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                left: 20,
                right: 20,
                bottom: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Encontre Restaurantes',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'Saudaveis em Santos',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            _renderRestaurants(restaurantProvider),
          ],
        ),
      ),
    );
  }
}
