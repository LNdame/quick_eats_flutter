// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$UserAccountService extends UserAccountService {
  _$UserAccountService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = UserAccountService;

  Future<Response> createAccount(Map<String, dynamic> model) {
    final $url = '/api/v1/User/CreateUserAccount';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> createUserAccountConfirmCode(Map<String, dynamic> model) {
    final $url = '/api/v1/User/CreateUserAccountConfirmCode';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getCountries() {
    final $url = '/api/v1/Country/GetCountries';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> checkUsername(String name) {
    final $url = '/api/v1/User/VerifyUsername';
    final Map<String, dynamic> $params = {'username': name};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> loginUser(Map<String, dynamic> model, String headerValue) {
    final $url = '/api/v1/User/Login';
    final $headers = {'Authorization': headerValue};
    final $body = model;
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> createAuthToken(
      String username, String password, String grantType) {
    final $url = '/api/v1/token/create';
    final $headers = {'content-type': 'application/x-www-form-urlencoded'};
    final $body = {
      'username': username,
      'password': password,
      'grant_type': grantType
    };
    final $request =
        Request('POST', $url, client.baseUrl, body: $body, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> initiateForgotPassword(String name) {
    final $url = '/api/v1/User/InitiateForgotPassword';
    final Map<String, dynamic> $params = {'emailAddress': name};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> confirmCode(Map<String, dynamic> model) {
    final $url = '/api/v1/User/ForgotPasswordConfirmCode';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> changePassword(Map<String, dynamic> model) {
    final $url = '/api/v1/User/ForgotPasswordChangePassword';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> getForgotPasswordResetOTP(String userID) {
    final $url = '/api/v1/User/ForgotPasswordResetOTP';
    final Map<String, dynamic> $params = {'userID': userID};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  Future<Response> requestNewOTP(int appLogID, int userID) {
    final $url = '/api/v1/User/CreateAccountRequestNewOneTimePin';
    final Map<String, dynamic> $params = {
      'appLogID': appLogID,
      'userID': userID
    };
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
