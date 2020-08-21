import 'package:scoped_model/scoped_model.dart';

import 'cart.dart';
import 'models.dart';

class ScopedQEModel extends Model {
  Restaurant _currentRestraurant;
  Cart _currentCart;

  void selectRestaurant(Restaurant res) {
    _currentRestraurant = res;
    notifyListeners();
  }

  Restaurant get currentRestraurant {
    return _currentRestraurant;
  }

  void populateCart(Cart cart) {
    _currentCart = cart;
    notifyListeners();
  }

  void clearCart(){
    _currentCart = null;
  }

  void updateNumberItems(int count){

  }

  Cart get currentCart {
    return _currentCart;
  }
}
