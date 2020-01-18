import 'package:json_annotation/json_annotation.dart';


@JsonSerializable()
 class SingleResponse {
   bool didError;
   String message;
   dynamic model;

   bool isDidError() {
    return didError;
  }

  /* void setDidError(bool didError) {
    this.didError = didError;
  }*/

   String getMessage() {
    return message;
  }

  /* void setMessage(String message) {
    this.message = message;
  }*/

   getModel() {
    return model;
  }

   /*void setModel(model) {
    this.model = model;
  }*/
   fromJson(Map<String, dynamic> json) {
     return SingleResponse()
     ..didError = json['didError'] as bool
     ..message = json['message'] as String
     ..model = json['model'];
   }
   
}