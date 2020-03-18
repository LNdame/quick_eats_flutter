import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating/flutter_rating.dart';
import 'package:quick_eats/src/models/vendor_model.dart';
import 'package:quick_eats/src/views/vendor/vendor_profile.dart';

class VendorFrontCard extends StatefulWidget{
   final Vendor _vendor;

   VendorFrontCard(this._vendor);

   @override
  _VendorFrontCardState createState() => _VendorFrontCardState();
}

class _VendorFrontCardState extends State<VendorFrontCard> {
  var cardText = TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);
  double rating = 3.5;
  int starCount = 5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          height: 200,
          decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10.0)),
              image: DecorationImage(image: NetworkImage(widget._vendor.profilePictureUri),fit: BoxFit.cover )
          ),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: <Widget>[
              Container(
                height: 50,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12])
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget._vendor.name, style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          ),
                          Row(
                            children: <Widget>[
                              StarRating(starCount:starCount ,
                                size: 18.0,
                                rating: rating,
                                color: Theme.of(context).accentColor,
                                borderColor: Theme.of(context).accentColor,
                                onRatingChanged: (rat){
                                  setState(() {
                                    rating = rat;
                                  });
                                },
                              ),
                              SizedBox(width: 30,),
                              Text("(50 reviews)", style: TextStyle(color: Colors.white),)
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
    );
  }



  void _navigateToVendor(BuildContext context, Vendor vendor) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => VendorProfile(vendor: vendor),
      ),
    );
  }
}