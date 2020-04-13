import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_eats/src/data/menu_api_service.dart';
import 'package:quick_eats/src/models/menu_response.dart';

class MenuRepository {
  Future<MenuResponse> getRestaurantMenu(
      BuildContext context, String restaurantId) async {
    final response = await Provider.of<MenuApiService>(context, listen: false)
        .getAllMenus(restaurantId);
    if (response.statusCode == 200) {
      return response.body;
    }

    return null;
  }
}
