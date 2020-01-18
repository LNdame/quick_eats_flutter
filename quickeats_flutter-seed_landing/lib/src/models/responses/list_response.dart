import 'package:json_annotation/json_annotation.dart';

import '../country.dart';
import '../dialling_code.dart';


@JsonSerializable()
class ListResponse {

   bool didError;
   String message;
   List model;

   bool isDidError() {
    return didError;
  }

   void setDidError(bool didError) {
    this.didError = didError;
  }

   String getMessage() {
    return message;
  }

   void setMessage(String message) {
    this.message = message;
  }

   List getModel() {
    return model;
  }

   void setModel(List model) {
    this.model = model;
  }


  fromJson(Map<String, dynamic> json) {
    return ListResponse()
      ..didError = json['didError'] as bool
      ..message = json['message'] as String
      ..model = (json['model'] as List)
          ?.map((e) =>
      e == null ? null : Country.fromJson(e as Map<String, dynamic>))
          ?.toList();
  }
}