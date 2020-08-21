import 'package:flutter/material.dart';
import 'package:quick_eats/src/models/cart_enum.dart';
import 'package:quick_eats/src/models/cart_item.dart';
import 'package:quick_eats/src/models/cart.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/ui_reusable/bottom_cart_widget.dart';
import 'package:quick_eats/src/utils/custom_text_style.dart';
import 'package:scoped_model/scoped_model.dart';

import '../../quick_eats_routes.dart';

class CartPage extends StatefulWidget {
  @override
  CartPageState createState() => CartPageState();
}

class CartPageState extends State<CartPage> {
  List<CartItem> _cartItems;
  double discountPercantage = 0.1;
  double totalPrice;

  // List<CartItem> createCartItemsList(int count){
  //   List<CartItem> cartItems = new List();
  //   for(int x = 0;x<count;x++){
  //     String name = "Food Name $x";
  //     String description = "Description $x";
  //     double price = 50.0;
  //     //widget.cart.addToCart(items)
  //     cartItems.add(new CartItem(name:name,description:description, price: price));
  //   }
  //   return cartItems;
  // }

  @override
  void initState() {
    _cartItems = [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedQEModel>(
          builder: (BuildContext context, Widget child, ScopedQEModel model){
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: <Widget>[Text("Cart")],
      )),
      resizeToAvoidBottomInset: false,
      body: createCartList(model.currentCart.cartItems)
      ,
      //bottomNavigationBar: BottomCartToolbar(CartOptions.checkout),
      bottomNavigationBar: _buildTotalContainer(model.currentCart)
    );
          });
  }

  createCartList(List<CartItem> cartItems) {
    _cartItems = cartItems;
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemBuilder: (context, position) {
        return createCartListItem(_cartItems[position]);
      },
      itemCount: _cartItems.length,
    );
  }

  String extrasText(CartItem item) {
    var extraItems = item.items;
    StringBuffer sb = new StringBuffer();
    if (extraItems != null) {
      extraItems.forEach((element) {
        sb.write(element.name + "\n");
      });
    }

    return sb.toString();
  }

  double discountAmount(Cart cart){
    double discountAmount = (cart.totalPrice * discountPercantage).floorToDouble();
    cart.setDiscount = discountAmount;
    return discountAmount;
  }

  Widget _buildTotalContainer(Cart cart) {
    return Container(
      height: 220.0,
      padding: EdgeInsets.only(
        left: 10.0,
        right: 10.0,
      ),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Subtotal",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                cart.totalPrice.toString(),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Discount",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                discountAmount(cart).toString(),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Divider(
            height: 2.0,
          ),
          SizedBox(
            height: 20.0,
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Cart Total",
                style: TextStyle(
                    color: Color(0xFF9BA7C6),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                cart.discountedPrice.toString(),
                style: TextStyle(
                    color: Color(0xFF6C6D6D),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(
            height: 20.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, QuickEatsRoutes.checkOutPage);
            },
            child: Container(
              height: 50.0,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Center(
                child: Text(
                  "Proceed To Checkout",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }

  createCartListItem(CartItem item) {
    return Stack(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(left: 16, right: 16, top: 16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(16))),
          child: Row(
            children: <Widget>[
              // Container(
              //   margin: EdgeInsets.only(right: 8, left: 8, top: 8, bottom: 8),
              //   width: 80,
              //   height: 80,
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.all(Radius.circular(14)),
              //       color: Colors.blue.shade200,
              //       image: DecorationImage(
              //           image: AssetImage("assets/images/multifood.jpg"))),
              // ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(right: 8, top: 4),
                        child: Text(
                          item.quantity.toString() + " x " + item.name,
                          maxLines: 2,
                          softWrap: true,
                          style: CustomTextStyle.textFormFieldSemiBold
                              .copyWith(fontSize: 14),
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        extrasText(item),
                        style: CustomTextStyle.textFormFieldRegular
                            .copyWith(color: Colors.grey, fontSize: 14),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              item.price.toString(),
                              style: CustomTextStyle.textFormFieldBlack
                                  .copyWith(color: Colors.green),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                flex: 100,
              )
            ],
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            width: 24,
            height: 24,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 10, top: 8),
            child: GestureDetector(
                child: Icon(
                  Icons.close,
                  color: Colors.white,
                  size: 20,
                ),
                onTap: () {
                  setState(() {
                    _cartItems.remove(item);
                  });
                }),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4)),
                color: Colors.green),
          ),
        )
      ],
    );
  }
}
