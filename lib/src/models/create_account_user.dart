import 'package:json_annotation/json_annotation.dart';

part 'create_account_user.g.dart';

@JsonSerializable()
class CreateAccountUser {
  String name;
  String surname;
  String emailAddress;
  String password;
  String phoneNumber;


  CreateAccountUser(this.name, this.surname, this.emailAddress, this.password, this.phoneNumber);

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

/*
  int getCountryID() {
    return countryID;
  }

  void setCountryID(int countryID) {
    this.countryID = countryID;
  }

  int getDialingCodeID() {
    return dialingCodeID;
  }

  void setDialingCodeID(int dialingCodeID) {
    this.dialingCodeID = dialingCodeID;
  }

  bool getIsValid() {
    return isValid;
  }

  void setValid(bool valid) {
    isValid = valid;
  }
*/

  toString() {
    return 'Name: $name,Surname :$surname, Phone Number: $phoneNumber, Email: $emailAddress, Password: $password';
  }

  String getPhoneNumber() {
    return phoneNumber;
  }

  Map<String, dynamic> toJson() =>
      <String, dynamic>{
        'name': name,
        'surname': surname,
        'email': emailAddress,
        'password': password,
        'contact_number': phoneNumber,
        'role':"vendor"
      };

  void setPhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
  }
}