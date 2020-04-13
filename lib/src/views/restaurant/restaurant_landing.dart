import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quick_eats/blocs/menu_bloc/bloc.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/views/vendor/menu_item_card.dart';

import 'menu_bloc_list_widget.dart';


class RestaurantLanding extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantLanding({Key key, this.restaurant}) : assert(restaurant!=null), super(key: key);
  @override
  _RestaurantLandingState createState() => _RestaurantLandingState();
}

class _RestaurantLandingState extends State<RestaurantLanding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.0),
                        bottomRight: Radius.circular(30.0),
                      )
                  ),
                  child: Image.asset("assets/images/burrito.jpg", fit: BoxFit.fitWidth,),
                ),

                Padding(
                  padding: const EdgeInsets.only(left:15.0, top: 40.0),
                  child: GestureDetector(
                    onTap: ()=>Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 15.0,
                      child: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 20.0,),
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(20.0),
              //TODO replace the style with the uniform theme style
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("${widget.restaurant.restaurant_name}", style: TextStyle(fontSize: 20.0, color: Colors.black), ),
                  Spacer(),
                  CircleAvatar(
                    backgroundColor: Colors.grey.withOpacity(0.7),
                    radius: 18.0,
                    child: Icon(Icons.info, color: Colors.white, size: 26.0,),
                  ),
                ],
              ),
            ),

            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left:15.0),
                  child: Row(
                    children: <Widget>[
                      Icon(Icons.location_on, color: Colors.grey,),
                      SizedBox(width: 5.0,),
                      //TODO replace the style with the uniform theme style
                      Text("${widget.restaurant.address} ", style: TextStyle(fontSize: 14.0, color: Colors.black),),

                    ],
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right:15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.2),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 7.0, right: 7.0, top: 3.0, bottom: 3.0),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.access_time, color: Colors.orange,),
                          SizedBox(width: 5.0,),
                          Text("Closes in 2hrs", style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold,fontSize: 14.0),)
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 5.0, bottom: 5.0),
              child: Divider(
                color: Colors.grey.withOpacity(0.8),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left:15.0, right: 15.0, top: 15.0),
              child: Container(
                height: 40.0,
                child: Center(
                  child: Text("<<Add the choice chip here>>"),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Flexible(
                    fit: FlexFit.loose,
                    flex: 1,
                    child: BlocProvider(
                      create: (context) => MenuBloc(context: context),
                      child: MenuBlocList(restaurantId: widget.restaurant.id),
                    )),
              ],
            )
            /*MenuItemCard(),
            MenuItemCard(),
            MenuItemCard(),
            MenuItemCard(),*/

          ],
        ),
      ),
    );
  }
}
