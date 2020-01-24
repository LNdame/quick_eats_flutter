import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {

     return GestureDetector(
       onTap: (){
          _navigateToVendor(context, widget._vendor);
       },
       child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        child: Stack(
          children: <Widget>[
            Container(
              height: 230.0,
              width: 340.0,
              child: Image(
                image: NetworkImage(
                    widget._vendor.profilePictureUri
                ),
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              left: 0.0,
              bottom: 0.0,
              width: 340.0,
              height: 60.0,
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Colors.black, Colors.black12])),
              ),
            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              right: 10.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        widget._vendor.name,
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 16.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 16.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 16.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 16.0,
                          ),
                          Icon(
                            Icons.star,
                            color: Theme.of(context).primaryColor,
                            size: 16.0,
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Text(
                            "( 0 Reviews)",
                          //  "(" + widget.ratings.toString() + " Reviews)",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text("10.0",
                       // widget.price.toString(),
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent),
                      ),
                      Text("Min order",
                          style: TextStyle(color: Colors.grey))
                    ],
                  ),
                ],
              ),
            ),
          ],
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