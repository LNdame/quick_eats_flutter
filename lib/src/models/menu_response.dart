
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:built_collection/built_collection.dart';
import 'menu_model.dart';

part 'menu_response.g.dart';

abstract class MenuResponse implements Built<MenuResponse, MenuResponseBuilder>{

  @BuiltValueField(wireName:"menus" )
  @nullable
 BuiltList<Menu> get menu_items;

  MenuResponse._();

  factory MenuResponse([updates(MenuResponseBuilder b)]) = _$MenuResponse;

  static Serializer<MenuResponse> get serializer => _$menuResponseSerializer;
}
