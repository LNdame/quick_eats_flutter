// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
      json['countryID'] as int,
      json['name'] as String,
      json['code'] as String,
      json['dateAdded'] as String,
      json['isDeleted'] as bool,
      (json['dialingCodes'] as List)
          ?.map((e) => e == null
              ? null
              : DiallingCode.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'countryID': instance.countryID,
      'name': instance.name,
      'code': instance.code,
      'dateAdded': instance.dateAdded,
      'isDeleted': instance.isDeleted,
      'dialingCodes': instance.dialingCodes
    };
