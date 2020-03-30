import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:built_collection/built_collection.dart';
abstract class RestaurantState extends Equatable {
  const RestaurantState();
  @override
  List<Object> get props => [];
}


class RestaurantEmpty extends RestaurantState {
 //empty state
}

class RestaurantLoading extends RestaurantState{}
class RestaurantLoaded extends RestaurantState{
  final BuiltList<Restaurant> restaurants;

  RestaurantLoaded( {@required this.restaurants}):assert(restaurants!=null);

  @override
  List<Object> get props => [restaurants];
}

class RestaurantError extends RestaurantState{}