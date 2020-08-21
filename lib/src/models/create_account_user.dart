import 'package:json_annotation/json_annotation.dart';

part 'create_account_user.g.dart';

@JsonSerializable()
class CreateAccountUser {
  String name;
  String surname;
  String emailAddress;
  String password;
  String phoneNumber;
  String id;

  CreateAccountUser(this.name, this.surname, this.emailAddress, this.password, this.phoneNumber, [this.id]);

  CreateAccountUser.emptyConstructor();

  String getId() { return id;}

  void setId(String thisId){
    this.id = thisId;
  }

  String getName() {
    return name;
  }

  void setName(String name) {
    this.name = name;
  }

  String getSurname() {
    return surname;
  }

  void setSurname(String surname) {
    this.surname = surname;
  }

  String getEmailAddress() {
    return emailAddress;
  }

  void setEmailAddress(String emailAddress) {
    this.emailAddress = emailAddress;
  }

  String getPassword() {
    return password;
  }

  void setPassword(String password) {
    this.password = password;
  }

  toString() {
    return 'Id: $id, Name: $name,Surname :$surname, Phone Number: $phoneNumber, Email: $emailAddress, Password: $password';
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  static fromJson(Map<String, dynamic> json) {
    return CreateAccountUser.emptyConstructor()
      ..name = json['name'] as String
      ..surname = json['surname'] as String
      ..phoneNumber = json['contact_number'] as String
      ..emailAddress = json['email'] as String
      ..id = json['id'] as String;
  }
  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'name': name,
        'surname': surname,
        'email': emailAddress,
        'password': password,
        'contact_number': phoneNumber,
        'id': id,
        'role':"vendor"
      };

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }
}