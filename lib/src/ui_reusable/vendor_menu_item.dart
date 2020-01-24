import 'package:flutter/material.dart';

class VendorMenuItem extends StatefulWidget{


  @override
  _VendorMenuItemState createState() => _VendorMenuItemState();
}

class _VendorMenuItemState extends State<VendorMenuItem> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[

              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Menu Item Name", style:Theme.of(context).textTheme.title,),
                      Text("Menu Item Description", style:Theme.of(context).textTheme.caption),
                    ],
                  ),
                ),
              ),
              Container(
                width: 60.0,
                child: Center(
                  child: Text("R 999.99"),
                ),
              ),
            ],
          ),
        ),

      ),
    );
  }
}