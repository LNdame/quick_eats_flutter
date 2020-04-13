import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quick_eats/src/datarepo/menu_repository.dart';
import 'package:quick_eats/src/models/models.dart';
import './bloc.dart';
import 'package:built_collection/built_collection.dart';


class MenuBloc extends Bloc<MenuEvent, MenuState> {
  BuildContext context;
  MenuBloc({@required this.context});



  @override
  MenuState get initialState => MenuEmpty();

  @override
  Stream<MenuState> mapEventToState(
    MenuEvent event,
  ) async* {
    yield MenuLoading();
    if(event is GetRestaurantMenu){
      try{
        MenuRepository menuRepository = new MenuRepository();
        final MenuResponse menuResponse = await menuRepository.getRestaurantMenu(context, event.restaurantId);
        final BuiltList<Menu> menus = menuResponse.menu_items;
        yield MenuLoaded(menus: menus);
      }catch(_){
        yield MenuError();
      }
    }
  }
}
