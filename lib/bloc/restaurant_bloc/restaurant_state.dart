import 'package:equatable/equatable.dart';

abstract class RestaurantState extends Equatable {
  const RestaurantState();
}

class InitialRestaurantState extends RestaurantState {
  @override
  List<Object> get props => [];
}
