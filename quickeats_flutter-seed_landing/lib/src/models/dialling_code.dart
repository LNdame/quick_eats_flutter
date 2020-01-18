import 'package:json_annotation/json_annotation.dart';

import 'country.dart';

part 'dialling_code.g.dart';

@JsonSerializable()
class DiallingCode {

  final int dialingCodeID;
  final int countryID;
  final String code;
  final String dateAdded;
  final bool isDeleted;
  final Country country;
  final DateTime actualDateAdded;

  DiallingCode(this.dialingCodeID, this.countryID, this.code, this.dateAdded, this.isDeleted, this.country, this.actualDateAdded);

  DiallingCode.fromJson(Map<String, dynamic> json) :
      dialingCodeID = json['dialingCodeID'] as int,
      countryID = json['countryID'] as int,
      code = json['code'] as String,
      dateAdded = json['dateAdded'] as String,
      isDeleted = json['isDeleted'] as bool,
      country = json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      actualDateAdded = json['actualDateAdded'] == null
          ? null
          : DateTime.parse(json['actualDateAdded'] as String);


  @override
  String toString() {
    return code;
  }
}