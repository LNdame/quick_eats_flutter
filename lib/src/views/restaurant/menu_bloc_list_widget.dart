import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/menu_bloc/bloc.dart';
import 'package:built_collection/built_collection.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/views/restaurant/menu_list_widget.dart';

class MenuBlocList extends StatelessWidget {
  final String restaurantId;

  const MenuBlocList({Key key, this.restaurantId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MenuBloc>(context).add(GetRestaurantMenu(restaurantId));
    return Center(
      child: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state){
          if( state is MenuEmpty){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is MenuLoading){
            return Center(child: CircularProgressIndicator(),);
          }
          if(state is MenuLoaded){
            final BuiltList<Menu> menus = state.menus;
            return buildMenuItemList(context, menus[0].menu_items);
          }
          if(state is MenuError){
            return Text("Something went wrong!");
          }
          else{
            return Text("Something went wrong!");
          }
        },
      )
    );
  }
}
