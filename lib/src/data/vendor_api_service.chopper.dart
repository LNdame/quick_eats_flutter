// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$VendorApiService extends VendorApiService {
  _$VendorApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = VendorApiService;

  Future<Response> getAllVendors() {
    final $url = '/Vendor/GetAllVendors';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
