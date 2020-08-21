import 'package:quick_eats/src/models/menu_item_extras_panel.dart';

class CartItem {
  String name;
  double price;
  String description;
  int quantity;
  List<MenuExtraItem> items;
  CartItem(this.name,this.price,this.quantity, {this.description, this.items});
}