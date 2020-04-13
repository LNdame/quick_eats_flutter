import 'package:json_annotation/json_annotation.dart';

import 'dialling_code.dart';

part 'country.g.dart';

@JsonSerializable()
class Country {
  final int countryID;
  final String name;
  final String code;
  final String dateAdded;
  final bool isDeleted;
  final List<DiallingCode> dialingCodes;

  List<DiallingCode> getDiallingCodes() {
    return dialingCodes;
  }
  Country(this.countryID, this.name, this.code, this.dateAdded, this.isDeleted, this.dialingCodes);

  Country.fromJson(Map<String, dynamic> json) :
      countryID = json['countryID'] as int,
      name = json['name'] as String,
      code = json['code'] as String,
      dateAdded = json['dateAdded'] as String,
      isDeleted = json['isDeleted'] as bool,
      dialingCodes = (json['dialingCodes'] as List)
          ?.map((e) =>
      e == null ? null : DiallingCode.fromJson(e as Map<String, dynamic>))
          ?.toList();

  @override
  String toString() {
    return name;
  }


}