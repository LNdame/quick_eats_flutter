/*
"id": "04869690-685d-11ea-a1b4-bd91f24bb7b5",
"restaurant_name": "Prof. Lavern Hahn",
"description": "Ducimus tenetur itaque et inventore dolore.",
"address": "934 Abshire Plains\nEast Susanburgh, OH 63085",
"business_hours": null,
"vendor_id": "04505410-685d-11ea-9a07-fb1dbaff0d82",
"created_at": "2020-03-17 14:38:50",
"updated_at": "2020-03-17 14:38:50",
"deleted_at": nu

 @nullable
  int get id;
  @nullable
  String get authors;
  @nullable
  String get title;
  @nullable
  String get description;
  @nullable
  int get questionnaire_type_id;
  @nullable
  int get user_id;

  @BuiltValueField(wireName: "questions")
  @nullable
  BuiltList<QuestionModel> get questions;

  Questionnaire._();

  factory Questionnaire([updates(QuestionnaireBuilder b)]) = _$Questionnaire;

  static Serializer<Questionnaire> get serializer => _$questionnaireSerializer;
*/

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';

part 'restaurant_model.g.dart';

abstract class Restaurant implements Built<Restaurant, RestaurantBuilder>{
  @nullable
  int get id;

  @nullable
  String get restaurant_name;

  @nullable
  String get description;
  @nullable
  String get address;
  @nullable
  String get business_hours;
  @nullable
  int get vendor_id;

  Restaurant._();

  factory Restaurant([updates(RestaurantBuilder b)]) = _$Restaurant;

  static Serializer<Restaurant> get serializer => _$restaurantSerializer;

}
