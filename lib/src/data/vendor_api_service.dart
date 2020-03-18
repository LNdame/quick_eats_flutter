import 'package:chopper/chopper.dart';

import 'server_settings.dart';

part 'vendor_api_service.chopper.dart';

@ChopperApi(baseUrl: "/Vendor")
abstract class VendorApiService extends ChopperService{

  @Get(path:'/GetAllVendors', headers: {'Content-Type':'application/json'})
  Future<Response>getAllVendors();

  static VendorApiService create(){
    final client =ChopperClient(baseUrl: serverBaseUrl,
    services: [
      _$VendorApiService(),],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
      ],
    );
   return _$VendorApiService(client);
  }

}