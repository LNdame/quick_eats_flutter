// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_account_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateAccountUser _$CreateAccountUserFromJson(Map<String, dynamic> json) {
  return CreateAccountUser(
      json['name'] as String,
      json['surname'] as String,
      json['emailAddress'] as String,
      json['password'] as String,
      json['countryID'] as int,
      json['dialingCodeID'] as int,
      json['isValid'] as bool,
      json['phoneNumber'] as String);
}

Map<String, dynamic> _$CreateAccountUserToJson(CreateAccountUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'countryID': instance.countryID,
      'dialingCodeID': instance.dialingCodeID,
      'phoneNumber': instance.phoneNumber,
      'isValid': instance.isValid
    };
