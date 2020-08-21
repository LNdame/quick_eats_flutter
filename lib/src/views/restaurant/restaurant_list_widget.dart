import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/ui_reusable/restaurant_card.dart';
import 'package:built_collection/built_collection.dart';

ListView buildRestaurantList(BuildContext context, BuiltList<Restaurant> restaurants){
  return ListView.builder(shrinkWrap: true,
      itemCount: restaurants.length,
      scrollDirection: Axis.vertical,
      primary: false,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: RestaurantCard(restaurant: restaurants[index],),
        );
      });
}