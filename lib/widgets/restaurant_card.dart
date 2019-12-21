import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import 'package:nutring/data/models/restaurant.dart';

class RestaurantCard extends StatelessWidget {
  var uuid = Uuid();
  final Restaurant restaurant;
  String uuidString;

  RestaurantCard({
    @required this.restaurant,
  });

  @override
  Widget build(BuildContext context) {
    uuidString = uuid.v1();
    return Row(
      children: <Widget>[
        GestureDetector(
          // onTap: () {
          //   Navigator.of(context).pushNamed(RestaurantInfoPage.routeName, arguments: RestaurantWithTag.constructWith(restaurant, tag: uuidString));
          // },
          child: Card(
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: restaurant.imageUrl + uuidString,
                    child: Image.network(
                      restaurant.imageUrl,
                      height: 120,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 7,
                      horizontal: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          restaurant.name,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          restaurant.description,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
      ],
    );
  }
}
