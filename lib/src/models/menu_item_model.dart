 import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menu_item_model.g.dart';

abstract class MenuItem implements Built<MenuItem, MenuItemBuilder>{

  @nullable
  int get id;
  @nullable
  String get menu_name;
  @nullable
  int get restaurant_id;
  @nullable
  String get description;


  MenuItem._();

  factory MenuItem([updates(MenuItemBuilder b)]) = _$MenuItem;

  static Serializer<MenuItem> get serializer => _$menuItemSerializer;
}