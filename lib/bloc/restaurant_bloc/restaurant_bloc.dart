import 'dart:async';
import 'package:bloc/bloc.dart';
import './bloc.dart';

class RestaurantBloc extends Bloc<RestaurantEvent, RestaurantState> {
  @override
  RestaurantState get initialState => InitialRestaurantState();

  @override
  Stream<RestaurantState> mapEventToState(
    RestaurantEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
