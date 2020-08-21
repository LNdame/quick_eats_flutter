// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_account_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$UserAccountService extends UserAccountService {
  _$UserAccountService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = UserAccountService;

  @override
  Future<Response<dynamic>> createAccount(Map<String, dynamic> model) {
    final $url = '/register';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> updateProfile(
      String id, Map<String, dynamic> model) {
    final $url = '/update-profile/$id';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> createUserAccountConfirmCode(
      Map<String, dynamic> model) {
    final $url = '/User/CreateUserAccountConfirmCode';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> getCountries() {
    final $url = '/Country/GetCountries';
    final $request = Request('GET', $url, client.baseUrl);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> checkUsername(String name) {
    final $url = '/User/VerifyUsername';
    final $params = <String, dynamic>{'username': name};
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> loginUser(Map<String, dynamic> model) {
    final $url = '/login';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<dynamic>> passwordUpdate(Map<String, dynamic> model) {
    final $url = '/password-update';
    final $body = model;
    final $request = Request('POST', $url, client.baseUrl, body: $body);
    return client.send<dynamic, dynamic>($request);
  }
}
