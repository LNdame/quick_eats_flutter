import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/user_account_api_service.dart';
import 'package:quick_eats/src/models/responses/single_response.dart';

class UserRepository {
  static final storage = FlutterSecureStorage();

  static Future<SingleResponse> authenticate(Map<String,dynamic> user, BuildContext context){
    return Provider.of<UserAccountService>(context, listen: false).loginUser(user).then((onValue){
      var response = SingleResponse().fromJson(jsonDecode(onValue.bodyString));
        //debugPrint(onValue.bodyString);
        return response;
    },onError: (error) {
      var response = SingleResponse().fromJson(jsonDecode(error));
        //debugPrint(onValue.bodyString);
        return response;
    });
  }

  static Future<void> persistToken(String token){
    return storage.write(key: 'token', value: token);
  }

  static Future<void> persistSession(String token, String user){
    var tokenFuture = storage.write(key: 'token', value: token);
    var userFuture = storage.write(key: "user", value: user);
    return Future.wait([tokenFuture,userFuture]);
  }

  static Future<void> persistUser(String user){
    return storage.write(key:'user', value:user);
  }

  static Future<void> deleteToken(){
    return storage.delete(key: "token");
  }

  static Future<void> deleteSession(){
    return storage.deleteAll();
  }

  static Future<String> getToken(){
    return storage.read(key: "token").then((onValue){
      return onValue;
    });
  }

  static Future<bool> hasToken(){
    return storage.read(key: "token").then((onValue){
      return onValue!=null;
    });
  }
}