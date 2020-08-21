import 'package:chopper/chopper.dart';
import 'package:quick_eats/src/models/models.dart';
import 'server_settings.dart';

part 'restaurant_api_service.chopper.dart';

@ChopperApi(baseUrl: "/")
abstract class RestaurantApiService extends ChopperService{

  @Get(path:'get-restaurants', headers: {'Content-Type':'application/json'})
  Future<Response<RestaurantResponse>>getAllRestaurants();

  static RestaurantApiService create(){
    final client = ChopperClient(
      baseUrl: serverBaseUrl,
      services: [
        _$RestaurantApiService(),],
      converter: BuiltValueConverter(),
      interceptors: [
        HeadersInterceptor({'Cache-Control':'no-cache'}),
        HttpLoggingInterceptor(),
      ],
    );
    return _$RestaurantApiService(client);
  }

}