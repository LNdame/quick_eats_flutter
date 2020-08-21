import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'menu_model.g.dart';

abstract class Menu implements Built<Menu, MenuBuilder> {
  @nullable
  String get id;

  @nullable
  String get menu_name;

  @nullable
  String get restaurant_id;

  @nullable
  String get description;

  Menu._();

  factory Menu([updates(MenuBuilder b)]) = _$Menu;

  static Serializer<Menu> get serializer => _$menuSerializer;
}
