import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/repositories.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:built_collection/built_collection.dart';
class RestaurantRepository {

   Future<RestaurantResponse> getAllRestaurants(BuildContext context)async{
    final response = await Provider.of<RestaurantApiService>(context,listen: false).getAllRestaurants();
    if (response.statusCode == 200){
      return response.body;
    }

    return null;
  }
}