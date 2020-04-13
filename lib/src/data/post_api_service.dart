import 'dart:async';

import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl:'/api')
abstract class UserAccountService extends ChopperService{

  @Post(path: "/register")
  Future<Response<dynamic>> createAccount(@Body() Map<String,dynamic> model);

  @Post(path: "/User/CreateUserAccountConfirmCode")
  Future<Response<dynamic>> createUserAccountConfirmCode(@Body() Map<String,dynamic> model);

  @Get(path:"/Country/GetCountries")
  Future<Response<dynamic>> getCountries();

  @Get(path:"/User/VerifyUsername")
  Future<Response<dynamic>> checkUsername(@Query("username") String name);

  @Post(path: "/login")
  Future<Response<dynamic>> loginUser(@Body() Map<String,dynamic> model);

  @Post(path: "/token/create",headers: {contentTypeKey: formEncodedHeaders})
  Future<Response<dynamic>> createAuthToken(@Field("username") String username,@Field("password") String password,
      @Field("grant_type") String grantType);

  @Get(path:"/User/InitiateForgotPassword")
  Future<Response<dynamic>> initiateForgotPassword(@Query("emailAddress") String name);

  @Post(path: "/User/ForgotPasswordConfirmCode")
  Future<Response<dynamic>> confirmCode(@Body() Map<String,dynamic> model);

  @Post(path: "/User/ForgotPasswordChangePassword")
  Future<Response<dynamic>> changePassword(@Body() Map<String,dynamic> model);

  @Get(path: "/User/ForgotPasswordResetOTP")
  Future<Response<dynamic>> getForgotPasswordResetOTP(@Query("userID") String userID);

  @Get(path: "/User/CreateAccountRequestNewOneTimePin")
  Future<Response<dynamic>> requestNewOTP(@Query("appLogID") int appLogID, @Query("userID") int userID);

  static UserAccountService create() {
    final client = ChopperClient(
      baseUrl: "https://dev.quickeats.co.za",
      services: [
        _$UserAccountService()
      ],
      converter: JsonConverter(),
    );
    return _$UserAccountService(client);
  }

}