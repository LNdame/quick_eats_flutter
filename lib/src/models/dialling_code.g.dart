// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dialling_code.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DiallingCode _$DiallingCodeFromJson(Map<String, dynamic> json) {
  return DiallingCode(
      json['dialingCodeID'] as int,
      json['countryID'] as int,
      json['code'] as String,
      json['dateAdded'] as String,
      json['isDeleted'] as bool,
      json['country'] == null
          ? null
          : Country.fromJson(json['country'] as Map<String, dynamic>),
      json['actualDateAdded'] == null
          ? null
          : DateTime.parse(json['actualDateAdded'] as String));
}

Map<String, dynamic> _$DiallingCodeToJson(DiallingCode instance) =>
    <String, dynamic>{
      'dialingCodeID': instance.dialingCodeID,
      'countryID': instance.countryID,
      'code': instance.code,
      'dateAdded': instance.dateAdded,
      'isDeleted': instance.isDeleted,
      'country': instance.country,
      'actualDateAdded': instance.actualDateAdded?.toIso8601String()
    };
