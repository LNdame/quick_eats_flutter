import 'dart:async';

import 'package:chopper/chopper.dart';
import 'package:quick_eats/src/data/server_settings.dart';

part 'user_account_api_service.chopper.dart';

@ChopperApi(baseUrl:"/")
abstract class UserAccountService extends ChopperService{

  @Post(path: "register")
  Future<Response<dynamic>> createAccount(@Body() Map<String,dynamic> model);

  @Post(path: "update-profile/{user_id}")
  Future<Response<dynamic>> updateProfile(@Path("user_id") String id,@Body() Map<String,dynamic> model);

  @Post(path: "User/CreateUserAccountConfirmCode")
  Future<Response<dynamic>> createUserAccountConfirmCode(@Body() Map<String,dynamic> model);

  @Get(path:"Country/GetCountries")
  Future<Response<dynamic>> getCountries();

  @Get(path:"User/VerifyUsername")
  Future<Response<dynamic>> checkUsername(@Query("username") String name);

  @Post(path: "login")
  Future<Response<dynamic>> loginUser(@Body() Map<String,dynamic> model);

  @Post(path: "password-update")
  Future<Response<dynamic>> passwordUpdate(@Body() Map<String,dynamic> model);


  static UserAccountService create() {
    final client = ChopperClient(
      baseUrl: serverBaseUrl,
      services: [
        _$UserAccountService()
      ],
      converter: JsonConverter(),
    );
    return _$UserAccountService(client);
  }

}