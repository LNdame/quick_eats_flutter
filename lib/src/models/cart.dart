import 'package:quick_eats/src/models/cart_item.dart';

class Cart {
  double _discount = 0;

  List<CartItem> cartItems = [];
  int get numberItems => cartItems.length;
  void addToCart(CartItem item) {
    cartItems.add(item);
  }

  set setDiscount(double discount) {
    _discount = discount;
  }

  double get totalPrice {
    double total = 0;
    for (var item in cartItems) {
      total += item.price;
    }
    return total;
  }

  double get discountedPrice {
    return totalPrice -_discount;
  }
}
