import 'package:equatable/equatable.dart';

abstract class RestaurantEvent extends Equatable {
  const RestaurantEvent();
}

class FetchRestaurants extends RestaurantEvent{

  const FetchRestaurants();

  @override
  List<Object> get props => [];

}

class GetRestaurantById extends RestaurantEvent{
   final int id;
   const GetRestaurantById(this.id);

  @override
  List<Object> get props => [id];
}
