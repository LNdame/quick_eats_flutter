import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:built_collection/built_collection.dart';
import 'package:quick_eats/src/views/vendor/menu_item_card.dart';

ListView buildMenuItemList(BuildContext context, BuiltList<MenuItem> menuItems){
  return ListView.builder(shrinkWrap: true,
      itemCount: menuItems.length,
      itemBuilder: (context, index){
        return Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: MenuItemCard(menuItem: menuItems[index],),
        );
      });
}