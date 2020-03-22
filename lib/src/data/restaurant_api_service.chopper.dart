// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$RestaurantApiService extends RestaurantApiService {
  _$RestaurantApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = RestaurantApiService;

  @override
  Future<Response<RestaurantResponse>> getAllRestaurants() {
    final $url = '/get-restaurants';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<RestaurantResponse, RestaurantResponse>($request);
  }
}
