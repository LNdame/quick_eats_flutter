
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:scoped_model/scoped_model.dart';

part 'restaurant_model.g.dart';

abstract class Restaurant implements Built<Restaurant, RestaurantBuilder>{
  @nullable
  String get id;

  @nullable
  String get restaurant_name;

  @nullable
  String get description;
  @nullable
  String get address;
  @nullable
  String get business_hours;
  @nullable
  String get vendor_id;

  Restaurant._();

  factory Restaurant([updates(RestaurantBuilder b)]) = _$Restaurant;

  static Serializer<Restaurant> get serializer => _$restaurantSerializer;

}

