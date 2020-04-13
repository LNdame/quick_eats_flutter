// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$MenuApiService extends MenuApiService {
  _$MenuApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = MenuApiService;

  @override
  Future<Response<MenuResponse>> getAllMenus(String restaurantId) {
    final $url = '/get-menus/$restaurantId';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<MenuResponse, MenuResponse>($request);
  }
}
