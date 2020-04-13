import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menu_item_model.g.dart';

abstract class MenuItem implements Built<MenuItem, MenuItemBuilder> {
  @nullable
  String get id;

  @nullable
  String get item_name;

  @nullable
  String get menu_id;

  @nullable
  String get item_description;

  @nullable
  String get item_picture_url;

  @nullable
  String get item_price;

  @nullable
  String get notes;

  @nullable
  int get is_vegan;

  @nullable
  int get is_halal;

  MenuItem._();

  factory MenuItem([updates(MenuItemBuilder b)]) = _$MenuItem;

  static Serializer<MenuItem> get serializer => _$menuItemSerializer;
}
