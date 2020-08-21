import 'package:flutter/material.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:quick_eats/src/models/models.dart';
import 'package:quick_eats/src/models/scoped_models.dart';
import 'package:quick_eats/src/views/vendor/vendor_landing.dart';
import 'package:quick_eats/src/views/vendor/vendor_profile.dart';
import 'package:scoped_model/scoped_model.dart';

class RestaurantCard extends StatefulWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key key, this.restaurant}) : super(key: key);

  @override
  _RestaurantCardState createState() => _RestaurantCardState();
}

class _RestaurantCardState extends State<RestaurantCard> {
  double rating = 3.5;

  final int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ScopedQEModel>(
        builder: (BuildContext context, Widget child, ScopedQEModel model) {
      return GestureDetector(
        onTap: () => _navigateToVendor(context, widget.restaurant,model),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  // image: DecorationImage(image: NetworkImage(widget._vendor.profilePictureUri),fit: BoxFit.cover )
                  image: DecorationImage(
                      image: AssetImage("assets/images/burrito.jpg"),
                      fit: BoxFit.cover)),
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: <Widget>[
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [Colors.black, Colors.black12])),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                widget.restaurant.restaurant_name,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Row(
                                children: <Widget>[
                                  StarRating(
                                    starCount: starCount,
                                    size: 18.0,
                                    rating: rating,
                                    color: Theme.of(context).accentColor,
                                    borderColor: Theme.of(context).accentColor,
                                    onRatingChanged: (rat) {
                                      setState(() {
                                        rating = rat;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 30,
                                  ),
                                  Text(
                                    "(50 reviews)",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  _showDialog(BuildContext context,Restaurant restaurant,ScopedQEModel model){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(title: Text("Clear Cart"),
      content: Text("Selecting a different restaurant clears the current cart. Do you wish to continue?"),
      actions: [
        FlatButton(child: Text("Yes"),
        onPressed: (){
          model.clearCart();
          model.selectRestaurant(restaurant);
          Navigator.pop(context);
          Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RestaurantLanding(
          restaurant: restaurant,
        ),
      ),
      
    );
        },),
        FlatButton(child: Text("No"),
        onPressed: (){
          Navigator.of(context).pop();
        },)
      ],);
    });
  }

  void _navigateToVendor(BuildContext context, Restaurant restaurant,ScopedQEModel model) {
    if(model.currentRestraurant!=null && model.currentRestraurant.restaurant_name!=restaurant.restaurant_name){
      _showDialog(context,restaurant,model);
    }else{
model.selectRestaurant(restaurant);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => RestaurantLanding(
          restaurant: restaurant,
        ),
      ),
    );
  }
    }
    
}
