import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_eats/src/data/repositories.dart';
import 'package:quick_eats/src/models/models.dart';
import './bloc.dart';
import 'package:built_collection/built_collection.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
   BuildContext context;
   RestaurantBloc({@required this.context});
  @override
  RestaurantState get initialState {
    return  RestaurantEmpty();
  }

  @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
      yield RestaurantLoading();
    if(event is FetchRestaurants){

      try{
        RestaurantRepository restaurantRepository = new RestaurantRepository();
        final RestaurantResponse restaurantResponse = await restaurantRepository.getAllRestaurants(context);
        final BuiltList<Restaurant> restaurants = restaurantResponse.restaurants;//   null;//await restaurantRepository.getAllRestaurants(context);
        yield RestaurantLoaded(restaurants: restaurants);
      } catch(_){
        yield RestaurantError();
    }
    }
  }
}
