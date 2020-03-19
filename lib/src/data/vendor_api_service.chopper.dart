// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_api_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations
class _$VendorApiService extends VendorApiService {
  _$VendorApiService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = VendorApiService;

  @override
  Future<Response<dynamic>> getAllVendors() {
    final $url = '/Vendor/GetAllVendors';
    final $headers = {'Content-Type': 'application/json'};
    final $request = Request('GET', $url, client.baseUrl, headers: $headers);
    return client.send<dynamic, dynamic>($request);
  }
}
