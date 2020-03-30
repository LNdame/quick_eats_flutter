import 'package:flutter/material.dart';

class AltTopInfoWidget extends StatelessWidget {
  final textStyle = TextStyle(fontSize: 32.0, fontWeight:  FontWeight.bold);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 100.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10.0),
                bottomRight: Radius.circular(10.0),
              ),
            color: Colors.yellow,
          ),
          child: Align(
            alignment: Alignment(0, -0.50),
            child: Padding(
              padding: const EdgeInsets.only(top:8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("See anything", style: textStyle),
                  Text("you fancy?", style: textStyle,)
                ],
              ),
            ),
          ),
          // Image.asset("assets/images/burrito.jpg", fit: BoxFit.fitWidth,),
        ),

        Padding(
          padding: const EdgeInsets.only(left:15.0, top: 40.0),
          child: GestureDetector(onTap: ()=> Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 15.0,
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black, size: 20.0,),
            ),
          ),
        ),

      ],
    );
  }
}
