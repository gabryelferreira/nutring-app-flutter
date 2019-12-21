import 'package:flutter/material.dart';
import 'package:nutring/data/models/restaurant.dart';
import 'package:nutring/widgets/restaurant_card.dart';

class RestaurantListView extends StatelessWidget {
  final String title;
  final List<Restaurant> restaurants;
  final String buttonText;

  RestaurantListView({
    @required this.title,
    @required this.restaurants,
    this.buttonText,
  });

  Widget renderButton() {
    if (buttonText == null) return null;
    return GestureDetector(
      onTap: () {},
      child: Text(
        'Ver tudo',
        style: TextStyle(
          color: Colors.green,
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 18, right: 10),
            itemCount: restaurants.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return RestaurantCard(
                restaurant: restaurants[index],
              );
            },
          ),
        ),
      ],
    );
  }
}
