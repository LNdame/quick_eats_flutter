import 'package:equatable/equatable.dart';

abstract class MenuEvent extends Equatable {
  const MenuEvent();
  @override
  List<Object> get props => [];
}

class GetRestaurantMenu extends MenuEvent{
  final String restaurantId;
  const GetRestaurantMenu( this.restaurantId);

  @override
  List<Object> get props => [restaurantId];
}

