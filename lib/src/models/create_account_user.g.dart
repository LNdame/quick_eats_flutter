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
    json['phoneNumber'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$CreateAccountUserToJson(CreateAccountUser instance) =>
    <String, dynamic>{
      'name': instance.name,
      'surname': instance.surname,
      'emailAddress': instance.emailAddress,
      'password': instance.password,
      'phoneNumber': instance.phoneNumber,
      'id': instance.id,
    };
