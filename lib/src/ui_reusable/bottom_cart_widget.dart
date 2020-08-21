import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/cart_enum.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/menu_item.dart';
import 'package:quick_eats/src/models/menu_item_extras_panel.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/quick_eats_routes.dart';
import 'package:quick_eats/src/views/restaurant/cart_page.dart';
import 'package:scoped_model/scoped_model.dart';



class BottomCartToolbar extends StatefulWidget {
  final CartOptions option;
  final Cart cart;

  final int numberItems;
  final bool enabled;
  final MenuItem menuItem;
  final double extrasPrice; 
  final List<MenuExtraItem> extraItems;

  BottomCartToolbar(this.option,{this.numberItems, this.menuItem, this.cart, this.extrasPrice, this.extraItems, this.enabled = true});

  @override
  _ToolbarState createState() => _ToolbarState();
}



class _ToolbarState extends State<BottomCartToolbar>{

  double getTotalPrice(ScopedQEModel model){
  if(widget.option == CartOptions.continueShopping){
    double price = double.parse(widget.menuItem.item_price);
    price += widget.extrasPrice;
    price += (price * (widget.numberItems-1));
    return price.truncateToDouble();
  }
  else{
    return model.currentCart.totalPrice ?? 0;
  }
  //if(model.currentCart)
}
@override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
          return Container(color: widget.enabled ? Colors.white : Colors.grey.shade500,
          child: Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            "Total",
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            getTotalPrice(model).toString(),
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
        ),
        Spacer(),
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: RaisedButton(
            color: Theme.of(context).accentColor,
            textColor: Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 10.0),
              child: Text(getCartString(model)),
            ),
            onPressed: () {
              cartAction(model);
            },
          ),
        )
      ],
    ),);
   
  });
  }
  

  void cartAction(ScopedQEModel model){
    if(widget.option == CartOptions.cart){
      Navigator.push(context, new MaterialPageRoute(builder: (context) => new CartPage()));
    }
    else{
      if(widget.option == CartOptions.continueShopping){
        //model.populateCart(widget.cart);
        addToCart(model);
      }
      Navigator.pushNamed(context, getPageRoute);     
    }
  }
void addToCart(ScopedQEModel model){
    Cart cart = model.currentCart ?? new Cart();
    double price = double.parse(widget.menuItem.item_price);
    price += widget.extrasPrice;
    price += (price * (widget.numberItems-1));
    cart.addToCart(new CartItem(widget.menuItem.item_name, price, widget.numberItems, items: widget.extraItems, description: widget.menuItem.item_description));
    model.populateCart(cart);
  }
  String getCartString(ScopedQEModel model) => widget.option == CartOptions.cart ? "Go to Cart" : widget.option == CartOptions.checkout ? "Check Out" : "Add ${widget.numberItems} to Cart";
  String get getPageRoute => widget.option == CartOptions.checkout ? QuickEatsRoutes.checkOutPage: QuickEatsRoutes.vendor;
}
