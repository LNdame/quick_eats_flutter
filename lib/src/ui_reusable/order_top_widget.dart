import 'package:flutter/material.dart';

class OrderTopInfo extends StatelessWidget{

  final textStyle = TextStyle(fontSize: 32.0, fontWeight:  FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("It is always", style: textStyle),
              Text("warm in here!", style: textStyle,)
            ],
          ),
          Icon(Icons.notifications_none, size: 30.0, color: Theme.of(context).primaryColor,),
        ],
      ),
    );
  }

}