import 'package:chopper/chopper.dart';
import 'package:quick_eats/src/models/built_value_converter.dart';
import 'package:quick_eats/src/models/menu_response.dart';

import 'server_settings.dart';

part 'menu_api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class MenuApiService extends ChopperService{

  @Get(path:'get-menus/{restaurant_id}', headers: {'Content-Type':'application/json'})
  Future<Response<MenuResponse>>getAllMenus(@Path('restaurant_id') String restaurantId);

  static MenuApiService create(){
    final client =ChopperClient(baseUrl: serverBaseUrl,
      services: [
        _$MenuApiService(),],
      converter: BuiltValueConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
      ],
    );
    return _$MenuApiService(client);
  }
}